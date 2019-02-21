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
    //m_readData.append(m_serialPort->readLine());

    m_dataReceiveList.append(m_serialPort->readLine());




    /*
    if(!m_timer.isActive())
    {
        m_timer.start(5000);
    }*/
}

void SerialPortHandler::handleDataReceived()
{
    if(!m_dataReceiveList.isEmpty())
    {
        for(int index = 0; index < m_dataReceiveList.size(); index++)
        {
            parseReceivedData(m_dataReceiveList.at(index));
            //m_standardOutput << "Read data:" << m_dataReceiveList.at(index) << endl;
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

    if(splitData.count() < 3)
    {
        return;
    }

    QString type = splitData.at(0);
    int widgetNum = splitData.at(1).toInt();

    if(type == QString("t"))
    {
        //m_standardOutput << QObject::tr("Temperature") <<endl;
        emit newTemperatureData(widgetNum, splitData.at(2).toFloat());
    }
    else if(type == QString("a"))
    {
        //m_standardOutput << QObject::tr("Accelerometer") <<endl;
        emit newAccelerometerData(widgetNum, splitData.at(2).toFloat());
    }
    else if(type == QString("r"))
    {
        //m_standardOutput << QObject::tr("RPM") <<endl;
        emit newRPMData(widgetNum, splitData.at(2).toInt());
    }
    else if(type == QString("l"))
    {
        //m_standardOutput << QObject::tr("LED") <<endl;
        emit newLEDData(widgetNum, splitData.at(2).toInt());
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
