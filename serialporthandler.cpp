#include "serialporthandler.h"

#include <QSerialPort>
#include <QCoreApplication>
#include <QSerialPortInfo>

SerialPortHandler::SerialPortHandler(QObject *parent) :
    QObject(parent),
    m_standardOutput(stdout)
{
    m_standardOutput << QObject::tr("Starting SerialPortHandler") <<endl;

    m_serialPort = new QSerialPort();
    m_portName = "Default";
    m_baudRate = QSerialPort::Baud9600;

    connect(m_serialPort, &QSerialPort::readyRead, this, &SerialPortHandler::handleReadyRead);
    connect(m_serialPort, &QSerialPort::errorOccurred, this, &SerialPortHandler::handleError);
    connect(&m_timer, &QTimer::timeout, this, &SerialPortHandler::handleDataReceived);


}


void SerialPortHandler::startSerialPort()
{

    m_serialPort->setPortName(m_portName);
    m_serialPort->setBaudRate(m_baudRate);

    /*
    m_standardOutput << QObject::tr("Start Serial Port: Port: %1 Baud: %2")
                            .arg(m_portName)
                            .arg(m_baudRate)
                     <<endl;*/


    if(!m_serialPort->open(QIODevice::ReadOnly))
    {
        m_standardOutput << QObject::tr("Failed to open port %1, error: %2")
                                  .arg(m_portName)
                                  .arg(m_serialPort->errorString())
                               << endl;
        QCoreApplication::exit(1);
    }

    m_timer.start(100);

}

void SerialPortHandler::setPortName(QString portName)
{
    m_portName = portName;
}

QString SerialPortHandler::getPortName()
{
    return m_portName;
}

void SerialPortHandler::setBaudRate(int baudRate)
{
    m_baudRate = baudRate;
}

int SerialPortHandler::getBaudRate()
{
    return m_baudRate;
}

void SerialPortHandler::handleReadyRead()
{
    //m_dataReceiveList.append(m_serialPort->readLine());
    //memset(m_buffer, 0, 1024);
    //qint64 lineLength = m_serialPort->readLine(m_buffer, 1024);


    QString dataRead;
    while(m_serialPort->canReadLine())
    {
         dataRead = QString::fromLatin1(m_serialPort->readLine());

    }

    if(!dataRead.isEmpty())
    {
        //m_standardOutput << "Read data:";
        //m_standardOutput << dataRead;
        //m_standardOutput << endl;
        m_dataReceiveList.append(dataRead);
    }

}

void SerialPortHandler::handleDataReceived()
{


    if(!m_dataReceiveList.isEmpty())
    {
        for(int index = 0; index < m_dataReceiveList.size(); index++)
        {
            parseReceivedData(m_dataReceiveList.at(index));
            m_standardOutput << "Read data:" << m_dataReceiveList.at(index) << endl;
        }

        m_dataReceiveList.clear();
    }
}

void SerialPortHandler::handleError(QSerialPort::SerialPortError error)
{
    if (error == QSerialPort::ReadError) {
        m_standardOutput << QObject::tr("An I/O error occurred while reading "
                                        "the data from port %1, error: %2")
                            .arg(m_serialPort->portName())
                            .arg(m_serialPort->errorString())
                         << endl;
        QCoreApplication::exit(1);
    }
}

void SerialPortHandler::parseReceivedData(QString data)
{
    QRegExp regex("[,]");
    QStringList splitData = data.split(regex, QString::SkipEmptyParts);

    if(splitData.count() < 11)
    {
        return;
    }

    QString startPacket = splitData.at(0);

    if(startPacket.compare("p") != 0)
    {
        return;
    }

    int rollerNum = splitData.at(1).toInt();
    float temp0Value = splitData.at(2).toFloat();
    float temp1Value = splitData.at(3).toFloat();
    float temp2Value = splitData.at(4).toFloat();
    float accelXValue = splitData.at(5).toFloat();
    float accelYValue = splitData.at(6).toFloat();
    float accelZValue = splitData.at(7).toFloat();
    int rpmValue = splitData.at(8).toInt();
    int shockValue = splitData.at(9).toInt();
    QString macAddr = splitData.at(10);
    int batteryLevel = splitData.at(11).toInt();

    emit newTemperatureData(rollerNum, 0, temp0Value);
    emit newTemperatureData(rollerNum, 1, temp1Value);
    emit newTemperatureData(rollerNum, 2, temp2Value);

    int led_state_0 = 0;
    int led_state_1 = 0;
    int led_state_2 = 0;

    led_state_0 = (temp0Value > 70 && temp0Value <= 80)? 1: led_state_0;
    led_state_0 = (temp0Value > 80)? 2: led_state_0;

    led_state_1 = (temp1Value > 70 && temp1Value <= 80)? 1: led_state_1;
    led_state_1 = (temp1Value > 80)? 2: led_state_1;

    led_state_2 = (temp2Value > 70 && temp2Value <= 80)? 1: led_state_2;
    led_state_2 = (temp2Value > 80)? 2: led_state_2;

    emit newLEDData(rollerNum, 0, led_state_0);
    emit newLEDData(rollerNum, 1, led_state_1);
    emit newLEDData(rollerNum, 2, led_state_2);
    emit newLEDData(rollerNum, 3, shockValue);

    emit newAccelerometerData(rollerNum, 0, accelXValue);
    emit newAccelerometerData(rollerNum, 1, accelYValue);
    emit newAccelerometerData(rollerNum, 2, accelZValue);

    emit newRPMData(rollerNum, 0, rpmValue);

    emit newMACAddressData(rollerNum, macAddr);

    emit newBatteryLevelData(rollerNum, batteryLevel);


}

void SerialPortHandler::availablePorts()
{
    m_standardOutput << QObject::tr("Read available ports") <<endl;

    const auto infos = QSerialPortInfo::availablePorts();
    for(const QSerialPortInfo &info: infos)
    {
        m_standardOutput << QObject::tr("New port: %1").arg(info.portName()) <<endl;
        emit newPortDetected(info.portName());
    }

}
