import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4
import QtCharts 2.3

import com.kmi.accelerometerhandler 1.0
import com.kmi.serialporthandler 1.0

Page {
    property alias roller_form_title: roller_form_title_id
    Rectangle {
        id: rectangle
        width: parent.width
        height: parent.height

        color: "#090808"

        Rectangle {
            id: rpm_gyro_background
            y: 103
            width: (parent.height - 25 - (height*0.20))/3
            height: width
            color: "#2c2a2a"
            anchors.verticalCenter: accel_x_background.verticalCenter
            anchors.left: accel_x_background.right
            anchors.leftMargin: 5
            border.color: "#2c2a2a"

            Image {
                id: gyro
                width: parent.width
                height: parent.height
                anchors.fill: parent
                fillMode: Image.PreserveAspectFit
                source: "Images/Analog Meter Background.png"

                Image {
                    id: gyro_needle
                    width: parent.width
                    height: parent.height
                    rotation: 0
                    anchors.fill: parent
                    fillMode: Image.PreserveAspectFit
                    source: "Images/Analog Meter Needle.png"
                }

                Image {
                    id: gyro_inner
                    width: parent.width
                    height: parent.height
                    anchors.fill: parent
                    fillMode: Image.PreserveAspectFit
                    source: "Images/Analog Meter Inner.png"

                    Text {
                        id: rpm_value
                        y: 0
                        width: parent.width
                        height: (parent.height)*0.266667
                        color: "#ffffff"
                        text: qsTr("0<br>RPM")
                        font.pixelSize: 12 + (12*((parent.width-150)/150))
                        anchors.right: parent.right
                        anchors.rightMargin: 0
                        anchors.left: parent.left
                        anchors.leftMargin: 0
                        anchors.verticalCenter: parent.verticalCenter
                        font.bold: true
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        textFormat: Text.RichText
                        wrapMode: Text.WordWrap
                    }
                }
                /*
                function needleValue(value) {
                    //console.log("Rotation:" + value)
                    gyro_needle.rotation = value * 1
                    rpm_value.text = value + "<br>RPM"
                }*/
            }
        }


        Rectangle {
            id: thermo_bearing_background_1
            x: 8
            y: 10
            width: (parent.height - 25 - (height*0.20))/3
            height: width
            color: "#2c2a2a"
            anchors.verticalCenter: accel_x_background.verticalCenter
            anchors.right: accel_x_background.left
            anchors.rightMargin: 5
            border.color: "#2c2a2a"

            Image {
                id: thermometer_bearing_1
                width: parent.width
                height: parent.height
                anchors.fill: parent
                clip: false
                sourceSize.height: 0
                fillMode: Image.PreserveAspectFit
                source: "Images/Thermometer Background.png"
                mipmap: true

                Image {
                    id: thermo_level_0_1
                    width: parent.width
                    height: parent.height
                    anchors.fill: parent
                    fillMode: Image.PreserveAspectFit
                    source: "Images/Thermometer Level/0-01.png"
                    mipmap: true

                    Text {
                        id: thermo_value_1
                        y: (parent.height)*0.74666667
                        width: parent.width
                        height: (parent.height)*0.133333
                        color: "#f1eeee"
                        text: qsTr("100<br><sup>o</sup>C")
                        font.pixelSize: 8 + (8*((parent.width-150)/150))
                        anchors.right: parent.right
                        anchors.rightMargin: 0
                        anchors.left: parent.left
                        anchors.leftMargin: 0
                        font.bold: true
                        horizontalAlignment: Text.AlignHCenter
                        textFormat: Text.RichText
                        wrapMode: Text.WordWrap
                    }


                }

                ThermometerLevel {
                    id: thermo_bearing
                    width: parent.width
                    height: parent.height
                }


                /*
                function tempValue(value) {
                    //console.log("Value:" + value)
                    thermo_value_1.text = value + "<br><sup>o</sup>C";
                    thermo_bearing.level1.visible = (value >=1)
                    thermo_bearing.level2.visible = (value >=2)
                    thermo_bearing.level3.visible = (value >=3)
                    thermo_bearing.level4.visible = (value >=4)
                    thermo_bearing.level5.visible = (value >=5)
                    thermo_bearing.level6.visible = (value >=6)
                    thermo_bearing.level7.visible = (value >=7)
                    thermo_bearing.level8.visible = (value >=8)
                    thermo_bearing.level9.visible = (value >=9)
                    thermo_bearing.level10.visible = (value >=10)
                    thermo_bearing.level11.visible = (value >=11)
                    thermo_bearing.level12.visible = (value >=12)
                    thermo_bearing.level13.visible = (value >=13)
                    thermo_bearing.level14.visible = (value >=14)
                    thermo_bearing.level15.visible = (value >=15)
                    thermo_bearing.level16.visible = (value >=16)
                    thermo_bearing.level17.visible = (value >=17)
                    thermo_bearing.level18.visible = (value >=18)
                    thermo_bearing.level19.visible = (value >=19)
                    thermo_bearing.level20.visible = (value >=20)
                    thermo_bearing.level21.visible = (value >=21)
                    thermo_bearing.level22.visible = (value >=22)
                    thermo_bearing.level23.visible = (value >=23)
                    thermo_bearing.level24.visible = (value >=24)
                    thermo_bearing.level25.visible = (value >=25)
                    thermo_bearing.level26.visible = (value >=26)
                    thermo_bearing.level27.visible = (value >=27)
                    thermo_bearing.level28.visible = (value >=28)
                    thermo_bearing.level29.visible = (value >=29)
                    thermo_bearing.level30.visible = (value >=30)
                    thermo_bearing.level31.visible = (value >=31)
                    thermo_bearing.level32.visible = (value >=32)
                    thermo_bearing.level33.visible = (value >=33)
                    thermo_bearing.level34.visible = (value >=34)
                    thermo_bearing.level35.visible = (value >=35)
                    thermo_bearing.level36.visible = (value >=36)
                    thermo_bearing.level37.visible = (value >=37)
                    thermo_bearing.level38.visible = (value >=38)
                    thermo_bearing.level39.visible = (value >=39)
                    thermo_bearing.level40.visible = (value >=40)
                    thermo_bearing.level41.visible = (value >=41)
                    thermo_bearing.level42.visible = (value >=42)
                    thermo_bearing.level43.visible = (value >=43)
                    thermo_bearing.level44.visible = (value >=44)
                    thermo_bearing.level45.visible = (value >=45)
                    thermo_bearing.level46.visible = (value >=46)
                    thermo_bearing.level47.visible = (value >=47)
                    thermo_bearing.level48.visible = (value >=48)
                    thermo_bearing.level49.visible = (value >=49)
                    thermo_bearing.level50.visible = (value >=50)
                    thermo_bearing.level51.visible = (value >=51)
                    thermo_bearing.level52.visible = (value >=52)
                    thermo_bearing.level53.visible = (value >=53)
                    thermo_bearing.level54.visible = (value >=54)
                    thermo_bearing.level55.visible = (value >=55)
                    thermo_bearing.level56.visible = (value >=56)
                    thermo_bearing.level57.visible = (value >=57)
                    thermo_bearing.level58.visible = (value >=58)
                    thermo_bearing.level59.visible = (value >=59)
                    thermo_bearing.level60.visible = (value >=60)
                    thermo_bearing.level61.visible = (value >=61)
                    thermo_bearing.level62.visible = (value >=62)
                    thermo_bearing.level63.visible = (value >=63)
                    thermo_bearing.level64.visible = (value >=64)
                    thermo_bearing.level65.visible = (value >=65)
                    thermo_bearing.level66.visible = (value >=66)
                    thermo_bearing.level67.visible = (value >=67)
                    thermo_bearing.level68.visible = (value >=68)
                    thermo_bearing.level69.visible = (value >=69)
                    thermo_bearing.level70.visible = (value >=70)
                    thermo_bearing.level71.visible = (value >=71)
                    thermo_bearing.level72.visible = (value >=72)
                    thermo_bearing.level73.visible = (value >=73)
                    thermo_bearing.level74.visible = (value >=74)
                    thermo_bearing.level75.visible = (value >=75)
                    thermo_bearing.level76.visible = (value >=76)
                    thermo_bearing.level77.visible = (value >=77)
                    thermo_bearing.level78.visible = (value >=78)
                    thermo_bearing.level79.visible = (value >=79)
                    thermo_bearing.level80.visible = (value >=80)
                    thermo_bearing.level81.visible = (value >=81)
                    thermo_bearing.level82.visible = (value >=82)
                    thermo_bearing.level83.visible = (value >=83)
                    thermo_bearing.level84.visible = (value >=84)
                    thermo_bearing.level85.visible = (value >=85)
                    thermo_bearing.level86.visible = (value >=86)
                    thermo_bearing.level87.visible = (value >=87)
                    thermo_bearing.level88.visible = (value >=88)
                    thermo_bearing.level89.visible = (value >=89)
                    thermo_bearing.level90.visible = (value >=90)
                    thermo_bearing.level91.visible = (value >=91)
                    thermo_bearing.level92.visible = (value >=92)
                    thermo_bearing.level93.visible = (value >=93)
                    thermo_bearing.level94.visible = (value >=94)
                    thermo_bearing.level95.visible = (value >=95)
                    thermo_bearing.level96.visible = (value >=96)
                    thermo_bearing.level97.visible = (value >=97)
                    thermo_bearing.level98.visible = (value >=98)
                    thermo_bearing.level99.visible = (value >=99)
                    thermo_bearing.level100.visible = (value >=100)


                }*/

            }
        }

        AccelerometerHandler {
            id: accelxHandler


        }


        SerialPortHandler {
            id: serialPortHandler
            signal changeToGreen()
            signal changeToYellow()
            signal changeToRed()
            /*
            onNewPortDetected: serialPortsComboBox.addPort(portName)
            onNewTemperatureData: function(widgetNum, value) {
                if(widgetNum === 0) {
                    thermometer_bearing_1.tempValue(value)
                    changeToGreen()
                }
                else if(widgetNum === 1) {
                    thermometer_bearing_2.tempValue(value)
                    changeToYellow()
                }
                else if(widgetNum === 2) {
                    thermometer_bearing_3.tempValue(value)
                    changeToRed()
                }
            }

            onNewAccelerometerData: function(widgetNum, value) {
                if(widgetNum === 0) {
                    accelx_item.add_value(value)
                }
                else if(widgetNum === 1) {
                    accely_item.add_value(value)
                }
                else if(widgetNum === 2) {
                    accelz_item.add_value(value)
                }
            }

            onNewRPMData: function(widgetNum, value) {
                if(widgetNum === 0) {
                    gyro.needleValue(value)
                }
            }

            onNewLEDData: function(widgetNum, value) {
                if(widgetNum === 0) {
                    led_ir_bearing.setState(value)
                }
                else if(widgetNum === 1) {
                    led_therm_bearing.setState(value)
                }
                else if(widgetNum === 2) {
                    led_roller.setState(value)
                }
                else if(widgetNum === 3) {
                    led_shock_1.setState(value)
                }

            }*/
        }


        StatusLED {
            id: bearing_status_0
            y: 170
            width: (parent.height - 25 - (height*0.20))/3
            height: width
            anchors.left: accel_y_background.right
            anchors.leftMargin: 5
            anchors.verticalCenter: accel_y_background.verticalCenter


        }

        Rectangle {
            id: accel_x_background
            width: parent.width - 20 - (height*2)
            height: (parent.height - 25 - (height*0.20))/3
            color: "#2c2a2a"
            anchors.bottom: accel_y_background.top
            anchors.bottomMargin: 5
            border.color: "#2c2a2a"
            anchors.horizontalCenter: parent.horizontalCenter

            Item {
                id: accelx_item

                ChartView {
                    ValueAxis {
                        id: accelX_xAxis
                        min: 0
                        max: 5
                    }

                    ValueAxis {
                        id: accelX_yAxis
                        min: 0.0
                        max: 5.0
                    }

                    objectName: "AccelX_Chart"
                    id:accelx_chart
                    width: parent.width
                    height: parent.height
                    anchors.fill: parent
                    animationOptions: ChartView.SeriesAnimations
                    backgroundColor: "#000d0d0d"
                    antialiasing: true
                    legend.visible: false
                    margins.bottom: 0
                    margins.top: 0
                    margins.left: 0
                    margins.right: 0

                    LineSeries {
                        id: accelx_series
                        /*name: "Accel X"*/
                        color: "#ffff0000"
                    }
                }


                property real largestY:0.0;
                width: parent.width
                height: parent.height - accel_x_label.height
                anchors.top: accel_x_label.bottom
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.topMargin: 5

                /*
                function add_value(x) {
                    if(x >= largestY) {
                        largestY = x
                    }



                    //console.log("Point(" + accelx_series.count + "," + x + ")");
                    accelx_series.append(accelx_series.count,x)

                    accelX_xAxis.min = accelx_series.count - 5
                    accelX_xAxis.max = accelx_series.count

                    accelX_yAxis.min = 0
                    accelX_yAxis.max = largestY

                    accelx_chart.setAxisX(accelX_xAxis, accelx_series)
                    accelx_chart.setAxisY(accelX_yAxis, accelx_series)
                    //accelx_chart.update()
                }
                */
            }

            Text {
                id: accel_x_label
                height: parent.height*0.10
                color: "#ffffff"
                text: qsTr("Accel X")
                font.pixelSize: 12 + (12*((height - 15)/15))
                anchors.right: parent.right
                anchors.rightMargin: 0
                anchors.left: parent.left
                anchors.leftMargin: 0
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }
        }

        Rectangle {
            id: accel_y_background
            width: parent.width - 20 - (height*2)
            height: (parent.height - 25 - (height*0.20))/3
            color: "#2c2a2a"
            anchors.bottom: accel_z_background.top
            anchors.bottomMargin: 5
            anchors.horizontalCenter: parent.horizontalCenter
            border.color: "#2c2a2a"

            Item {
                id: accely_item
                x: 0
                y: 20
                width: parent.width
                height: parent.height - accel_y_label.height
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 0
                anchors.top: accel_y_label.bottom
                anchors.topMargin: 5
                anchors.horizontalCenter: parent.horizontalCenter


                property real largestY:0.0;
                /*
                function add_value(x) {
                    if(x >= largestY) {
                        largestY = x
                    }

                    //console.log("Point(" + accely_series.count + "," + x + ")");
                    accely_series.append(accely_series.count,x)

                    accelY_xAxis.min = accely_series.count - 5
                    accelY_xAxis.max = accely_series.count
                    accelY_yAxis.min = 0
                    accelY_yAxis.max = largestY

                    accely_chart.setAxisX(accelY_xAxis, accely_series)
                    accely_chart.setAxisY(accelY_yAxis, accely_series)

                }*/


                ChartView {
                    ValueAxis {
                        id: accelY_xAxis
                        min: 0
                        max: 5
                    }

                    ValueAxis {
                        id: accelY_yAxis
                        min: 0
                        max: 5
                    }

                    objectName: "AccelY_Chart"
                    id:accely_chart
                    width: parent.width
                    height: parent.height
                    anchors.fill: parent
                    animationOptions: ChartView.SeriesAnimations
                    backgroundColor: "#000d0d0d"
                    legend.visible: false
                    antialiasing: true
                    margins.bottom: 0
                    margins.top: 0
                    margins.left: 0
                    margins.right: 0

                    LineSeries {
                        id: accely_series
                        name: "Accel Y"
                        color: "#ff00ff00"
                    }
                }
            }

            Text {
                id: accel_y_label
                width: parent.width
                height: parent.height*0.10
                color: "#ffffff"
                text: qsTr("Accel Y")
                font.pixelSize: 12 + (12*((height - 15)/15))
                anchors.leftMargin: 0
                anchors.left: parent.left
                anchors.rightMargin: 0
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                anchors.right: parent.right
            }



        }


        Rectangle {
            id: accel_z_background
            width: parent.width - 20 - (height*2)
            height: (parent.height - 25 - (height*0.20))/3
            color: "#2c2a2a"
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 5
            anchors.horizontalCenter: parent.horizontalCenter
            border.color: "#2c2a2a"

            Item {
                id: accelz_item
                x: 0
                width: parent.width
                height: parent.height - accel_z_label.height
                anchors.top: accel_z_label.bottom
                anchors.topMargin: 5
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 0
                anchors.horizontalCenter: parent.horizontalCenter

                ChartView {
                    ValueAxis {
                        id: accelZ_xAxis
                        min: 0
                        max: 5
                    }

                    ValueAxis {
                        id: accelZ_yAxis
                        min: 0
                        max: 5
                    }

                    objectName: "AccelZ_Chart"
                    id:accelz_chart
                    width: parent.width
                    height: parent.height
                    anchors.fill: parent
                    animationOptions: ChartView.SeriesAnimations
                    backgroundColor: "#000d0d0d"
                    legend.visible: false
                    antialiasing: true
                    margins.bottom: 0
                    margins.top: 0
                    margins.left: 0
                    margins.right: 0

                    LineSeries {
                        id: accelz_series
                        name: "Accel Z"
                        color: "#ff0000ff"
                    }
                }

                property real largestY:0.0;
                /*
                function add_value(x) {
                    if(x >= largestY) {
                        largestY = x
                    }

                    //console.log("Point(" + accely_series.count + "," + x + ")");
                    accelz_series.append(accelz_series.count,x)

                    accelZ_xAxis.min = accelz_series.count - 5
                    accelZ_xAxis.max = accelz_series.count
                    accelZ_yAxis.min = 0
                    accelZ_yAxis.max = largestY

                    accelz_chart.setAxisX(accelZ_xAxis, accelz_series)
                    accelz_chart.setAxisY(accelZ_yAxis, accelz_series)

                }*/
            }

            Text {
                id: accel_z_label
                height: parent.height*0.10
                color: "#ffffff"
                text: qsTr("Accel Z")
                font.pixelSize: 12 + (12*((height - 15)/15))
                anchors.leftMargin: 0
                anchors.left: parent.left
                anchors.rightMargin: 0
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                anchors.right: parent.right
            }
        }



        Slider {
            id: slider
            x: 14
            y: 719
            stepSize: 1
            to: 100
            snapMode: Slider.SnapAlways
            from: 0

            onValueChanged: thermometer_bearing_1.tempValue(value)


        }









        Slider {
            id: slider1
            x: 22
            y: 765
            stepSize: 1
            snapMode: Slider.SnapAlways
            to: 300
            value: 0
            from: 0

            onValueChanged: gyro.needleValue(value)
        }






















        RowLayout {
        }


















        ColumnLayout {
            x: 858
            y: 530





        }















        RowLayout {
            x: 14
            y: 901
            anchors.right: parent.right
            anchors.rightMargin: 25

            ComboBox {
                id: serialPortsComboBox
                Layout.preferredHeight: 40
                Layout.preferredWidth: 126
                textRole: "text"
                editable: false


                model: ListModel
                {
                    id: portListItems

                }


                /*
                function addPort(portName) {
                    //console.log("New Port Received:" + portName)
                    if(serialPortsComboBox.find(portName) === -1) {
                        //console.log("Adding Port:" + portName)
                        portListItems.append({text: portName})
                        serialPortsComboBox.currentIndex = serialPortsComboBox.find(portName)
                    }
                }*/

                onCurrentIndexChanged: console.debug(portListItems.get(currentIndex).text + ", " + portListItems.get(currentIndex).color)
                Component.onCompleted: serialPortHandler.availablePorts()
            }

            ComboBox {
                id: baudRateComboBox
                Layout.preferredHeight: 40
                Layout.preferredWidth: 152
                textRole: "text"
                editable: false
                currentIndex: 5
                model: ListModel {
                    id: baudRateItems
                    ListElement{text: "110" ; value: 110}
                    ListElement{text: "300" ; value: 300}
                    ListElement{text: "600" ; value: 600}
                    ListElement{text: "1200" ; value: 1200}
                    ListElement{text: "2400" ; value: 2400}
                    ListElement{text: "9600" ; value: 9600}
                    ListElement{text: "14400" ; value: 14400}
                    ListElement{text: "19200" ; value: 19200}
                    ListElement{text: "38400" ; value: 38400}
                    ListElement{text: "57600" ; value: 57600}
                    ListElement{text: "115200" ; value: 115200}
                    ListElement{text: "230400" ; value: 230400}
                    ListElement{text: "460800" ; value: 460800}
                    ListElement{text: "921600" ; value: 921600}
                }
            }

            Button {
                id: button
                text: qsTr("Connect")
                Layout.preferredHeight: 40
                Layout.preferredWidth: 108
                onClicked: function() {
                    console.debug("Connect to serial " +
                                  portListItems.get(serialPortsComboBox.currentIndex).text +
                                  " with baud rate of " +
                                  baudRateItems.get(baudRateComboBox.currentIndex).value)

                    serialPortHandler.portName = portListItems.get(serialPortsComboBox.currentIndex).text
                    serialPortHandler.baudRate = baudRateItems.get(baudRateComboBox.currentIndex).value
                    serialPortHandler.startSerialPort()
                }
            }


        }

        Rectangle {
            id: thermo_bearing_background_2
            x: 3
            y: 7
            width: (parent.height - 25 - (height*0.20))/3
            height: width
            color: "#2c2a2a"
            anchors.verticalCenter: accel_y_background.verticalCenter
            Image {
                id: thermometer_bearing_2
                width: parent.width
                height: parent.height
                Image {
                    id: thermo_level_0_2
                    width: parent.width
                    height: parent.height
                    Text {
                        id: thermo_value_2
                        y: (parent.height)*0.74666667
                        width: parent.width
                        height: (parent.height)*0.133333
                        color: "#f1eeee"
                        text: qsTr("100<br><sup>o</sup>C")
                        anchors.leftMargin: 0
                        anchors.left: parent.left
                        anchors.rightMargin: 0
                        font.pixelSize: 8 + (8*((parent.width-150)/150))
                        textFormat: Text.RichText
                        wrapMode: Text.WordWrap
                        horizontalAlignment: Text.AlignHCenter
                        anchors.right: parent.right
                        font.bold: true
                    }
                    source: "Images/Thermometer Level/0-01.png"
                    mipmap: true
                    anchors.fill: parent
                    fillMode: Image.PreserveAspectFit
                }

                ThermometerLevel {
                    id: thermo_bearing1
                    width: parent.width
                    height: parent.height
                }
                clip: false
                sourceSize.height: 0
                source: "Images/Thermometer Background.png"
                mipmap: true
                anchors.fill: parent
                fillMode: Image.PreserveAspectFit
            }
            border.color: "#2c2a2a"
            anchors.rightMargin: 5
            anchors.right: accel_y_background.left
        }

        Rectangle {
            id: rectangle1
            width: (parent.height - 25 - (height*0.20))/3
            height: width
            color: "#2c2a2a"
            border.color: "#2c2a2a"
            anchors.left: accel_z_background.right
            anchors.leftMargin: 5
            anchors.verticalCenter: accel_z_background.verticalCenter
        }


        Rectangle {
            id: thermo_bearing_background_3
            x: 11
            width: (parent.height - 25 - (height*0.20))/3
            height: width
            color: "#2c2a2a"
            anchors.verticalCenter: accel_z_background.verticalCenter
            Image {
                id: thermometer_bearing_3
                width: parent.width
                height: parent.height
                Image {
                    id: thermo_level_0_3
                    width: parent.width
                    height: parent.height
                    Text {
                        id: thermo_value_3
                        y: (parent.height)*0.74666667
                        width: parent.width
                        height: (parent.height)*0.133333
                        color: "#f1eeee"
                        text: qsTr("100<br><sup>o</sup>C")
                        anchors.leftMargin: 0
                        anchors.left: parent.left
                        anchors.rightMargin: 0
                        font.pixelSize: 8 + (8*((parent.width-150)/150))
                        textFormat: Text.RichText
                        horizontalAlignment: Text.AlignHCenter
                        wrapMode: Text.WordWrap
                        anchors.right: parent.right
                        font.bold: true
                    }
                    source: "Images/Thermometer Level/0-01.png"
                    mipmap: true
                    anchors.fill: parent
                    fillMode: Image.PreserveAspectFit
                }

                ThermometerLevel {
                    id: thermo_bearing2
                    width: parent.width
                    height: parent.height
                }
                clip: false
                sourceSize.height: 0
                source: "Images/Thermometer Background.png"
                mipmap: true
                anchors.fill: parent
                fillMode: Image.PreserveAspectFit
            }
            border.color: "#2c2a2a"
            anchors.rightMargin: 5
            anchors.right: accel_z_background.left
        }


        Button {
            id: back_button
            width: height
            text: qsTr("<")
            anchors.bottom: thermo_bearing_background_1.top
            anchors.bottomMargin: 5
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 5
            onClicked: {
                swipeView.currentIndex = 0
            }
        }



        Text {
            id: roller_form_title_id
            color: "#ffffff"
            text: qsTr("Roller 0")
            font.bold: true
            fontSizeMode: Text.Fit
            wrapMode: Text.WordWrap
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.right: accel_x_background.right
            anchors.rightMargin: 0
            anchors.left: accel_x_background.left
            anchors.leftMargin: 0
            anchors.bottom: accel_x_background.top
            anchors.bottomMargin: 5
            anchors.top: parent.top
            anchors.topMargin: 5
            font.pixelSize: 20
        }
    }
}







/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:71;anchors_x:508;anchors_y:383}
}
 ##^##*/
