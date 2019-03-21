#include "packethandler.h"

#include <QString>
#include <stdio.h>

#define DEBUGEN

PacketHandler::PacketHandler(QObject *parent) :
    QObject(parent),
    m_standardOutput(stdout)
{
    #ifdef DEBUGEN
        m_standardOutput << QObject::tr("Starting PacketHandler") << endl;
    #endif

    packetHandlerMap.insert("W", &PacketHandler::handleWakeUpPacket);
    packetHandlerMap.insert("A", &PacketHandler::handleConfigurationAckPacket);
    packetHandlerMap.insert("D", &PacketHandler::handleAccelerationPacket);
    packetHandlerMap.insert("T", &PacketHandler::handleTemperaturePacket);
    packetHandlerMap.insert("L", &PacketHandler::handleAlarmPacket);
}


/******************************************************
 * Packet Types:
 *      W - Wake up                    Direction: Incoming
 *      C - Configuration              Direction: Outgoing
 *      A - Configuration Knowledge    Direction: Incoming
 *      D - Acceleration Data          Direction: Incoming
 *      T - Temperature Data           Direction: Incoming
 *      L - Alarm Data                 Direction: Incoming
 *      X - Sleep Command              Direction: Outgoing
 * Format:
 *      Packet Type, Roller Number, Flag Value, Data Field
 *      Ex. W, 1, 0, 0x0608708988123456 (Wake up,       Roller 1, Flag 0, MAC Address)
 *          C, 2, 0, 1, 4, 5, 6, ....8  (Configuration, Roller 2, Flag 0, Config Data)
*******************************************************/

void PacketHandler::handlePacketData(QString data)
{
    QRegExp regex("[,]");
    QStringList splitData = data.split(regex, QString::SkipEmptyParts);
    QString packetType = splitData.at(0).toUpper();

    if(packetHandlerMap.contains(packetType))
    {
        (this->*packetHandlerMap[packetType])(splitData);
    }


    /*
    if(packetType.compare("W") == 0)
    {
        handleWakeUpPacket(splitData);
    }
    else if(packetType.compare("A") == 0)
    {
        handleConfigurationAckPacket(splitData);
    }
    else if(packetType.compare("D") == 0)
    {
        handleAccelerationPacket(splitData);
    }
    else if(packetType.compare("T") == 0)
    {
        handleTemperaturePacket(splitData);
    }
    else if(packetType.compare("L") == 0)
    {
        handleAlarmPacket(splitData);
    }
    */
}

void PacketHandler::handleWakeUpPacket(QStringList splitData)
{
    uint8_t index = 0;
    QString packetType = splitData.at(index++);
    int rollerNum = splitData.at(index++).toInt();
    QString flagValue = splitData.at(index++);

    QString mac_address = formatMAC(splitData.at(index++));

    #ifdef DEBUGEN
        m_standardOutput << QObject::tr("PacketHandler::handleWakeUpPacket: roller #:") << rollerNum
                         << QObject::tr(",flag value:") << flagValue
                         << QObject::tr(",mac address:") << mac_address
                         << endl;
    #endif

    //emit newMACAddressData(rollerNum, mac_address);
}


void PacketHandler::handleConfigurationAckPacket(QStringList splitData)
{
    uint8_t index = 0;
    QString packetType = splitData.at(index++);
    int rollerNum = splitData.at(index++).toInt();
    QString flagValue = splitData.at(index++);

    int configBeltSystemNum       = splitData.at(index++).toInt();
    int configBeltLineNum         = splitData.at(index++).toInt();
    int configRowNum              = splitData.at(index++).toInt();
    int configRollerNum           = splitData.at(index++).toInt();
    float configDoubleTapDuration = splitData.at(index++).toFloat();
    int configDoubleTapIntensity  = splitData.at(index++).toInt();
    int configDoubleTapGScale     = splitData.at(index++).toInt();
    float configSampleCycleTime   = splitData.at(index++).toFloat();
    float temperatureSampleTime   = splitData.at(index++).toFloat();

    #ifdef DEBUGEN
        m_standardOutput << QObject::tr("PacketHandler::handleConfigurationAckPacket:") << endl
                         << QObject::tr("--> roller #:")                     << rollerNum                      << endl
                         << QObject::tr("--> flag value:")                   << flagValue                      << endl
                         << QObject::tr("--> belt system #:")                << configBeltSystemNum            << endl
                         << QObject::tr("--> belt line #:")                  << configBeltLineNum              << endl
                         << QObject::tr("--> row #:")                        << configRowNum                   << endl
                         << QObject::tr("--> roller #:")                     << configRollerNum                << endl
                         << QObject::tr("--> double tap duration:")          << configDoubleTapDuration        << endl
                         << QObject::tr("--> double tap intensity:")         << configDoubleTapIntensity       << endl
                         << QObject::tr("--> double tap g-scale:")           << configDoubleTapGScale          << endl
                         << QObject::tr("--> sample cycle time:")            << configSampleCycleTime          << endl
                         << QObject::tr("--> temperature sample time:")      << configSampleCycleTime          << endl
                         << endl;
    #endif

}

void PacketHandler::handleAccelerationPacket(QStringList splitData)
{
    uint8_t index = 0;
    QString packetType = splitData.at(index++);
    int rollerNum = splitData.at(index++).toInt();
    QString flagValue = splitData.at(index++);

    int accelXValue = splitData.at(index++).toInt();
    int accelYValue = splitData.at(index++).toInt();
    int accelZValue = splitData.at(index++).toInt();
    int rpmValue    = splitData.at(index++).toInt();

    //emit newAccelerometerData(rollerNum, 0, accelXValue);
    //emit newAccelerometerData(rollerNum, 1, accelYValue);
    //emit newAccelerometerData(rollerNum, 2, accelZValue);
    //emit newRPMData(rollerNum, 0, rpmValue);

    #ifdef DEBUGEN
        m_standardOutput << QObject::tr("PacketHandler::handleAccelerationPacket:") << endl
                         << QObject::tr("--> roller #:")                     << rollerNum                      << endl
                         << QObject::tr("--> flag value:")                   << flagValue                      << endl
                         << QObject::tr("--> accelerator x:")                << accelXValue                    << endl
                         << QObject::tr("--> accelerator y:")                << accelYValue                    << endl
                         << QObject::tr("--> accelerator z:")                << accelZValue                    << endl
                         << QObject::tr("--> rpm value:")                    << rpmValue                       << endl
                         << endl;
    #endif

}

void PacketHandler::handleTemperaturePacket(QStringList splitData)
{
    uint8_t index = 0;
    QString packetType = splitData.at(index++);
    int rollerNum = splitData.at(index++).toInt();
    QString flagValue = splitData.at(index++);

    int temp0Value   = splitData.at(index++).toInt();   //ADC value
    int temp1Value   = splitData.at(index++).toInt();   //ADC value
    int temp2Value   = splitData.at(index++).toInt();   //ADC value
    int batteryValue = splitData.at(index++).toInt(); //ADC value
    //emit newTemperatureData(rollerNum, 0, temp0Value);
    //emit newTemperatureData(rollerNum, 1, temp1Value);
    //emit newTemperatureData(rollerNum, 2, temp2Value);

    int led_state_0 = 0;
    int led_state_1 = 0;
    int led_state_2 = 0;

    led_state_0 = (temp0Value > 70 && temp0Value <= 80)? 1: led_state_0;
    led_state_0 = (temp0Value > 80)? 2: led_state_0;

    led_state_1 = (temp1Value > 70 && temp1Value <= 80)? 1: led_state_1;
    led_state_1 = (temp1Value > 80)? 2: led_state_1;

    led_state_2 = (temp2Value > 70 && temp2Value <= 80)? 1: led_state_2;
    led_state_2 = (temp2Value > 80)? 2: led_state_2;

    //emit newLEDData(rollerNum, 0, led_state_0);
    //emit newLEDData(rollerNum, 1, led_state_1);
    //emit newLEDData(rollerNum, 2, led_state_2);
    //emit newLEDData(rollerNum, 3, shockValue);
    //emit newBatteryLevelData(rollerNum, batteryLevel);

    #ifdef DEBUGEN
        m_standardOutput << QObject::tr("PacketHandler::handleTemperaturePacket:") << endl
                         << QObject::tr("--> roller #:")                     << rollerNum                     << endl
                         << QObject::tr("--> flag value:")                   << flagValue                     << endl
                         << QObject::tr("--> temperature 1:")                << temp0Value                    << endl
                         << QObject::tr("--> temperature 2:")                << temp1Value                    << endl
                         << QObject::tr("--> temperature 3:")                << temp2Value                    << endl
                         << QObject::tr("--> battery level:")                << batteryValue                  << endl
                         << endl;
    #endif

}

void PacketHandler::handleAlarmPacket(QStringList splitData)
{
    uint8_t index = 0;
    QString packetType = splitData.at(index++);
    int rollerNum = splitData.at(index++).toInt();
    QString flagValue = splitData.at(index++);

    QString alarmType = splitData.at(index++);
    int alarmFlag = splitData.at(index++).toInt();
    int alarmValue = splitData.at(index++).toInt();

    #ifdef DEBUGEN
        m_standardOutput << QObject::tr("PacketHandler::handleAlarmPacket:") << endl
                         << QObject::tr("--> roller #:")                     << rollerNum                     << endl
                         << QObject::tr("--> flag value:")                   << flagValue                     << endl
                         << QObject::tr("--> alarmType:")                    << alarmType                     << endl
                         << QObject::tr("--> alarmFlag:")                    << alarmFlag                     << endl
                         << QObject::tr("--> alarmValue:")                   << alarmValue                    << endl
                         << endl;
    #endif

}

QString PacketHandler::formatMAC(QString mac)
{
    if(mac.length() < 18)
    {
        return QString("");
    }

    char formated_mac[20];
    sprintf(formated_mac, "%c%c:%c%c:%c%c:%c%c:%c%c:%c%c:%c%c:%c%c",
            mac.at(2), mac.at(3),mac.at(4),mac.at(5),mac.at(6),mac.at(7),mac.at(8),
            mac.at(9), mac.at(10),mac.at(11),mac.at(12),mac.at(13),mac.at(14),
            mac.at(15), mac.at(16), mac.at(17));

    return QString::fromUtf8(formated_mac);
}

