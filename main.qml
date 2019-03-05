import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4
import QtCharts 2.3

import com.kmi.accelerometerhandler 1.0
import com.kmi.serialporthandler 1.0

ApplicationWindow {
    id: window
    visible: true
    width: 640
    height: 480
    color: "#090808"
    title: qsTr("Monitoring Panel")



    SwipeView {
        id: swipeView
        anchors.fill: parent

        HomePageForm{
            id: homepage
        }

        RollerPageForm {
            id: rollerpage
        }


        Component.objectName: contentItem.interactive = false
    }

    SerialPortHandler {
        id: serialPortHandler
        signal changeToGreen()
        signal changeToYellow()
        signal changeToRed()

        onNewPortDetected: homepage.serial_configuration.serialPortsComboBox.addPort(portName)
        onNewLEDData: function(rollerNum, widgetNum, value) {
            if(swipeView.currentIndex == 0) {
                homepage.roller[rollerNum].leds[widgetNum].status(value);
            }
            else {
                console.log("Roller Number:" + rollerpage.roller_number)

                if(rollerNum === rollerpage.roller_number) {
                    rollerpage.bearing_status.leds[widgetNum].status(value);
                 }
            }

        }

        onNewTemperatureData: function(rollerNum, widgetNum, value) {
            if(rollerNum === rollerpage.roller_number) {
                rollerpage.thermometers[widgetNum].tempValue(value);
            }
        }

        onNewAccelerometerData: function(rollerNum, widgetNum, value) {
            if(rollerNum === rollerpage.roller_number) {
                rollerpage.accelerometers[widgetNum].add_value(value);
            }
        }

        onNewRPMData: function(rollerNum, widgetNum, value) {
            if(rollerNum === rollerpage.roller_number) {
                rollerpage.rpm_gyro.needleValue(value)
            }
        }

        onNewMACAddressData: function(rollerNum, value) {
            if(rollerNum === rollerpage.roller_number) {
                rollerpage.mac_address.text = value
            }
        }

        onNewBatteryLevelData: function(rollerNum, value){
            console.log("Roller:" + rollerNum + ", Value:" + value)
            if(rollerNum === rollerpage.roller_number) {
                rollerpage.battery_level_progress_bar.value = value
            }
        }


    }



























}



























































































































































































































































































/*##^## Designer {
    D{i:3;anchors_height:12;anchors_width:40;anchors_x:0;anchors_y:103}D{i:5;anchors_height:150;anchors_width:150;anchors_x:45;anchors_y:"-78"}
D{i:4;anchors_height:12;anchors_width:40;anchors_x:0;anchors_y:85}D{i:2;anchors_height:12;anchors_width:40;anchors_x:0;anchors_y:0}
D{i:1;anchors_width:360;anchors_x:210;anchors_y:103}D{i:9;anchors_width:49;anchors_x:145}
D{i:8;anchors_height:200;anchors_width:250;anchors_x:0;anchors_y:6}D{i:10;anchors_x:104}
D{i:7;anchors_height:200;anchors_width:49;anchors_x:145;anchors_y:6}D{i:13;anchors_height:12;anchors_width:40;anchors_x:480;anchors_y:85}
D{i:17;anchors_height:12;anchors_width:40;anchors_x:0;anchors_y:25}D{i:18;anchors_height:12;anchors_width:40;anchors_x:0;anchors_y:0}
D{i:16;anchors_height:12;anchors_width:40;anchors_x:0;anchors_y:0}D{i:15;anchors_height:150;anchors_width:250;anchors_x:0;anchors_y:0}
D{i:20;anchors_width:300}D{i:24;anchors_height:12;anchors_width:40;anchors_x:0;anchors_y:0}
D{i:25;anchors_height:200;anchors_width:200;anchors_x:0;anchors_y:85}D{i:26;anchors_height:12;anchors_width:40;anchors_x:0;anchors_y:85}
D{i:23;anchors_height:12;anchors_width:40;anchors_x:0;anchors_y:0}D{i:22;anchors_height:133;anchors_width:40;anchors_x:0;anchors_y:0}
D{i:27;anchors_width:300}D{i:21;anchors_height:12;anchors_width:40;anchors_x:104;anchors_y:85}
D{i:31;anchors_height:40;anchors_width:40;anchors_x:0;anchors_y:0}D{i:32;anchors_height:40;anchors_width:40;anchors_x:0;anchors_y:0}
D{i:30;anchors_height:12;anchors_width:40;anchors_x:0;anchors_y:0}D{i:29;anchors_height:152.33333333333337;anchors_width:100;anchors_x:1042;anchors_y:0}
D{i:34;anchors_width:300}D{i:35;anchors_height:360;anchors_width:200;anchors_x:0;anchors_y:"-30"}
D{i:36;anchors_height:40;anchors_width:40;anchors_x:0;anchors_y:0}D{i:37;anchors_height:12;anchors_width:40;anchors_x:0;anchors_y:0}
D{i:38;anchors_x:0}D{i:41;anchors_height:360;anchors_width:200;anchors_x:25;anchors_y:"-30"}
D{i:40;anchors_height:100;anchors_width:126;anchors_x:177;anchors_y:245}D{i:44;anchors_height:360;anchors_width:200;anchors_x:0;anchors_y:"-30"}
D{i:46;anchors_height:360;anchors_width:120;anchors_x:50;anchors_y:590}D{i:47;anchors_height:360;anchors_width:120;anchors_x:50;anchors_y:"-30"}
D{i:48;anchors_height:360;anchors_width:200;anchors_x:50;anchors_y:86}D{i:49;anchors_height:360;anchors_width:120;anchors_x:50;anchors_y:590}
D{i:50;anchors_height:360;anchors_width:120;anchors_x:50;anchors_y:"-30"}D{i:51;anchors_height:360;anchors_width:200;anchors_x:50;anchors_y:86}
D{i:52;anchors_height:100;anchors_width:50;anchors_x:50;anchors_y:0}D{i:53;anchors_height:360;anchors_width:200;anchors_x:0;anchors_y:280}
D{i:54;anchors_height:360;anchors_width:200;anchors_x:0;anchors_y:"-30"}D{i:55;anchors_height:360;anchors_width:200;anchors_x:104;anchors_y:280}
D{i:56;anchors_height:360;anchors_width:200;anchors_x:0;anchors_y:280}D{i:57;anchors_height:360;anchors_width:40;anchors_x:104;anchors_y:280}
D{i:43;anchors_height:360;anchors_width:200;anchors_x:104;anchors_y:280}D{i:42;anchors_height:360;anchors_width:200;anchors_x:104;anchors_y:280}
D{i:58;anchors_height:360;anchors_y:590}D{i:39;anchors_height:360;anchors_width:200;anchors_x:25;anchors_y:590}
D{i:62;anchors_width:49;anchors_x:145}D{i:61;anchors_height:200;anchors_width:250;anchors_x:0;anchors_y:6}
D{i:63;anchors_x:104}D{i:60;anchors_height:200;anchors_width:49;anchors_x:145;anchors_y:6}
D{i:67;anchors_width:49;anchors_x:145}D{i:66;anchors_height:200;anchors_width:250;anchors_x:0;anchors_y:6}
D{i:68;anchors_x:104}D{i:65;anchors_height:200;anchors_width:49;anchors_x:145;anchors_y:6}
D{i:64;anchors_y:6}
}
 ##^##*/
