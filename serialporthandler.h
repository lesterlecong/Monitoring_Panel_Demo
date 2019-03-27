#ifndef SERIALPORTHANDLER_H
#define SERIALPORTHANDLER_H

#include <QObject>
#include <QByteArray>
#include <QSerialPort>
#include <QTextStream>
#include <QTimer>
#include <QString>

class PacketHandler;

class SerialPortHandler : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString portName READ getPortName WRITE setPortName NOTIFY portNameChanged)
    Q_PROPERTY(int baudRate READ getBaudRate WRITE setBaudRate NOTIFY baudRateChanged)

public:
    explicit SerialPortHandler(QObject *parent = nullptr);

    ~SerialPortHandler();

    Q_INVOKABLE void startSerialPort();
    Q_INVOKABLE void availablePorts();

    void setPortName(QString portName);
    QString getPortName();

    void setBaudRate(int baudRate);
    int getBaudRate();


signals:
    void portNameChanged();
    void baudRateChanged();
    void newPortDetected(QString portName);
    void newTemperatureData(int rollerNum, int widgetNum, int data);
    void newAccelerometerData(int rollerNum, int widgetNum, int data);
    void newRPMData(int rollerNum, int widgetNum, int data);
    void newLEDData(int rollerNum, int widgetNum, int data);
    void newMACAddressData(int rollerNum, QString macAddr);
    void newBatteryLevelData(int rollerNum, int battLevel);
public slots:
    void handleReadyRead();
    void handleDataReceived();
    void handleError(QSerialPort::SerialPortError error);
private:
    void setupConnection();
private:
    PacketHandler *m_packetHandler;
    QSerialPort *m_serialPort = nullptr;
    QByteArray m_readData;
    QStringList m_dataReceiveList;
    QTextStream m_standardOutput;
    QTimer m_timer;
    QString m_portName;
    int m_baudRate;
    char m_buffer[1024];
};

#endif // SERIALPORTHANDLER_H
