#ifndef SERIALPORTHANDLER_H
#define SERIALPORTHANDLER_H

#include <QObject>
#include <QByteArray>
#include <QSerialPort>
#include <QTextStream>
#include <QTimer>
#include <QString>

class SerialPortHandler : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString portName READ getPortName WRITE setPortName NOTIFY portNameChanged)
    Q_PROPERTY(int baudRate READ getBaudRate WRITE setBaudRate NOTIFY baudRateChanged)

public:
    explicit SerialPortHandler(QObject *parent = nullptr);

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
    void newTemperatureData(int widgetNum, float data);
    void newAccelerometerData(int widgetNum, float data);
    void newRPMData(int widgetNum, int data);
    void newLEDData(int widgetNum, int data);
public slots:
    void handleReadyRead();
    void handleDataReceived();
    void handleError(QSerialPort::SerialPortError error);
private:
    void setupConnection();
    void parseReceivedData(QString data);
private:
    QSerialPort *m_serialPort = nullptr;
    QByteArray m_readData;
    QStringList m_dataReceiveList;
    QTextStream m_standardOutput;
    QTimer m_timer;
    QString m_portName;
    int m_baudRate;
};

#endif // SERIALPORTHANDLER_H
