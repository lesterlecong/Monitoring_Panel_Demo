#ifndef PACKETHANDLER_H
#define PACKETHANDLER_H

#include <QMap>
#include <QObject>
#include <QString>
#include <QStringList>
#include <QTextStream>

class PacketHandler : public QObject
{
    Q_OBJECT


public:
    explicit PacketHandler(QObject *parent = nullptr);

    void handlePacketData(QString data);

signals:
    void newTemperatureData(int rollerNum, int widgetNum, int data);
    void newAccelerometerData(int rollerNum, int widgetNum, int data);
    void newRPMData(int rollerNum, int widgetNum, int data);
    void newLEDData(int rollerNum, int widgetNum, int data);
    void newMACAddressData(int rollerNum, QString macAddr);
    void newBatteryLevelData(int rollerNum, int battLevel);

private:
    typedef void (PacketHandler::*PacketHandlerFunc)(QStringList);

    void handleWakeUpPacket(QStringList splitData);
    void handleConfigurationAckPacket(QStringList splitData);
    void handleAccelerationPacket(QStringList splitData);
    void handleTemperaturePacket(QStringList splitData);
    void handleAlarmPacket(QStringList splitData);

    QString formatMAC(QString mac);

private:
    QMap<QString, PacketHandlerFunc> packetHandlerMap;
    QTextStream m_standardOutput;
};

#endif // PACKETHANDLER_H
