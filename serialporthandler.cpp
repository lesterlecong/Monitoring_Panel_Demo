#include "serialporthandler.h"
#include "packethandler.h"

#include <QSerialPort>
#include <QCoreApplication>
#include <QSerialPortInfo>

SerialPortHandler::SerialPortHandler(QObject *parent) :
    QObject(parent),
    m_standardOutput(stdout)
{
    m_standardOutput << QObject::tr("Starting SerialPortHandler") <<endl;

    m_packetHandler = new PacketHandler();
    m_serialPort = new QSerialPort();
    m_portName = "Default";
    m_baudRate = QSerialPort::Baud9600;

    connect(m_packetHandler, SIGNAL(newTemperatureData(int, int, float)), this, SIGNAL(newTemperatureData(int, int, float)));
    connect(m_packetHandler, SIGNAL(newAccelerometerData(int, int, float)), this, SIGNAL(newAccelerometerData(int, int, float)));
    connect(m_packetHandler, SIGNAL(newLEDData(int, int, int)), this, SIGNAL(newLEDData(int, int, int)));
    connect(m_packetHandler, SIGNAL(newAccelerometerData(int, int, float)), this, SIGNAL(newAccelerometerData(int, int, float)));
    connect(m_packetHandler, SIGNAL(newMACAddressData(int, QString)), this, SIGNAL(newMACAddressData(int, QString)));
    connect(m_packetHandler, SIGNAL(newBatteryLevelData(int, int)), this, SIGNAL(newBatteryLevelData(int, int)));

    connect(m_serialPort, &QSerialPort::readyRead, this, &SerialPortHandler::handleReadyRead);
    connect(m_serialPort, &QSerialPort::errorOccurred, this, &SerialPortHandler::handleError);
    connect(&m_timer, &QTimer::timeout, this, &SerialPortHandler::handleDataReceived);


}

SerialPortHandler::~SerialPortHandler()
{
    m_packetHandler->deleteLater();
    m_serialPort->deleteLater();
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
            m_packetHandler->handlePacketData(m_dataReceiveList.at(index));
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
