import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4
import QtCharts 2.3
import com.kmi.accelerometerhandler 1.0

ApplicationWindow {
    id: window
    visible: true
    width: 1280
    height: 960
    color: "#2c2a2a"
    title: qsTr("Monitoring Panel")

    AccelerometerHandler {
        id: accelxHandler
        onSendNewValue: accelx_item.add_accelx_value(val)
    }

    Image {
        id: gyro
        x: 1042
        width: 480
        height: 480
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0
        fillMode: Image.PreserveAspectFit
        source: "Images/Analog Meter Background.png"

        Image {
            id: gyro_needle
            rotation: -3
            anchors.fill: parent
            fillMode: Image.PreserveAspectFit
            source: "Images/Analog Meter Needle.png"
        }

        Image {
            id: gyro_inner
            anchors.fill: parent
            fillMode: Image.PreserveAspectFit
            source: "Images/Analog Meter Inner.png"

            Text {
                id: rpm_value
                x: 177
                y: 192
                width: 126
                height: 54
                color: "#c5bebe"
                text: qsTr("0")
                lineHeight: 8
                wrapMode: Text.NoWrap
                font.pointSize: 200
                fontSizeMode: Text.FixedSize
                font.weight: Font.Bold
                textFormat: Text.PlainText
                font.bold: true
                font.family: "Courier"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }

            Text {
                id: rpm_unit
                x: 177
                y: 245
                width: 126
                height: 25
                color: "#c5bebe"
                text: qsTr("RPM")
                font.pointSize: 60
                wrapMode: Text.NoWrap
                renderType: Text.QtRendering
                lineHeight: 0.8
                verticalAlignment: Text.AlignVCenter
                font.family: "Courier"
                horizontalAlignment: Text.AlignHCenter
                font.bold: true
            }
        }

        function needleValue(value) {
            console.log("Rotation:" + value)
            gyro_needle.rotation = value * 1
            rpm_value.text = value
        }
    }

    Image {
        id: thermometer_bearing_2
        x: 25
        y: 350
        width: 250
        height: 250
        fillMode: Image.PreserveAspectFit
        Image {
            id: thermometer_first_level1
            fillMode: Image.PreserveAspectFit
            anchors.fill: parent
            source: "Images/Thermometer first_level.png"
        }

        Image {
            id: thermometer_second_level1
            fillMode: Image.PreserveAspectFit
            anchors.fill: parent
            visible: false
            source: "Images/Thermometer second_level.png"
        }

        Image {
            id: thermometer_third_level1
            fillMode: Image.PreserveAspectFit
            anchors.fill: parent
            visible: false
            source: "Images/Thermometer third_level.png"
        }

        Image {
            id: thermometer_fourth_level1
            fillMode: Image.PreserveAspectFit
            anchors.fill: parent
            visible: false
            source: "Images/Thermometer fourth_level.png"
        }

        Image {
            id: thermometer_fifth_level1
            fillMode: Image.PreserveAspectFit
            anchors.fill: parent
            visible: false
            source: "Images/Thermometer fifth_level.png"
        }

        Image {
            id: thermometer_sixth_level1
            fillMode: Image.PreserveAspectFit
            anchors.fill: parent
            visible: false
            source: "Images/Thermometer sixth_level.png"
        }

        Text {
            id: thermo_unit_2
            x: 103
            y: 182
            width: 45
            height: 84
            color: "#eae6e6"
            text: qsTr("C")
            lineHeight: 50
            font.bold: true
            wrapMode: Text.WrapAnywhere
            verticalAlignment: Text.AlignVCenter
            fontSizeMode: Text.Fit
            Text {
                id: degree_2
                x: 0
                y: 10
                width: 32
                height: 34
                color: "#eae6e6"
                text: qsTr("o")
                lineHeight: 1
                font.bold: true
                wrapMode: Text.WrapAnywhere
                verticalAlignment: Text.AlignVCenter
                fontSizeMode: Text.Fit
                font.pointSize: 10
                font.family: "Courier"
                horizontalAlignment: Text.AlignHCenter
            }
            font.pointSize: 200
            font.family: "Courier"
            horizontalAlignment: Text.AlignHCenter
        }

        Text {
            id: thermo_value_2
            x: 93
            y: 165
            width: 65
            height: 57
            color: "#eae6e6"
            text: qsTr("0")
            lineHeight: 50
            font.bold: true
            verticalAlignment: Text.AlignVCenter
            fontSizeMode: Text.Fit
            font.pointSize: 200
            font.family: "Courier"
            horizontalAlignment: Text.AlignHCenter
        }
        source: "Images/Thermometer Background.png"
    }

    Image {
        id: thermometer_bearing_3
        x: 25
        y: 675
        width: 250
        height: 250
        fillMode: Image.PreserveAspectFit
        Image {
            id: thermometer_first_level2
            fillMode: Image.PreserveAspectFit
            anchors.fill: parent
            source: "Images/Thermometer first_level.png"
        }

        Image {
            id: thermometer_second_level2
            fillMode: Image.PreserveAspectFit
            anchors.fill: parent
            visible: false
            source: "Images/Thermometer second_level.png"
        }

        Image {
            id: thermometer_third_level2
            fillMode: Image.PreserveAspectFit
            anchors.fill: parent
            visible: false
            source: "Images/Thermometer third_level.png"
        }

        Image {
            id: thermometer_fourth_level2
            fillMode: Image.PreserveAspectFit
            anchors.fill: parent
            visible: false
            source: "Images/Thermometer fourth_level.png"
        }

        Image {
            id: thermometer_fifth_level2
            fillMode: Image.PreserveAspectFit
            anchors.fill: parent
            visible: false
            source: "Images/Thermometer fifth_level.png"
        }

        Image {
            id: thermometer_sixth_level2
            fillMode: Image.PreserveAspectFit
            anchors.fill: parent
            visible: false
            source: "Images/Thermometer sixth_level.png"
        }

        Text {
            id: thermo_unit_3
            x: 106
            y: 183
            width: 45
            height: 84
            color: "#eae6e6"
            text: qsTr("C")
            font.bold: true
            lineHeight: 50
            wrapMode: Text.WrapAnywhere
            verticalAlignment: Text.AlignVCenter
            fontSizeMode: Text.Fit
            Text {
                id: degree_3
                x: 0
                y: 10
                width: 32
                height: 34
                color: "#eae6e6"
                text: qsTr("o")
                font.bold: true
                lineHeight: 1
                wrapMode: Text.WrapAnywhere
                verticalAlignment: Text.AlignVCenter
                fontSizeMode: Text.Fit
                font.pointSize: 10
                font.family: "Courier"
                horizontalAlignment: Text.AlignHCenter
            }
            font.pointSize: 200
            font.family: "Courier"
            horizontalAlignment: Text.AlignHCenter
        }

        Text {
            id: thermo_value_3
            x: 93
            y: 168
            width: 65
            height: 57
            color: "#eae6e6"
            text: qsTr("0")
            font.bold: true
            lineHeight: 50
            verticalAlignment: Text.AlignVCenter
            fontSizeMode: Text.Fit
            font.pointSize: 200
            font.family: "Courier"
            horizontalAlignment: Text.AlignHCenter
        }
        source: "Images/Thermometer Background.png"
    }

    Image {
        id: thermometer_bearing_1
        x: 25
        y: 25
        width: 250
        height: 250
        fillMode: Image.PreserveAspectFit
        source: "Images/Thermometer Background.png"

        Image {
            id: thermometer_first_level
            anchors.fill: parent
            fillMode: Image.PreserveAspectFit
            source: "Images/Thermometer first_level.png"
        }

        Image {
            id: thermometer_second_level
            visible: false
            anchors.fill: parent
            fillMode: Image.PreserveAspectFit
            source: "Images/Thermometer second_level.png"
        }

        Image {
            id: thermometer_third_level
            visible: false
            anchors.fill: parent
            fillMode: Image.PreserveAspectFit
            source: "Images/Thermometer third_level.png"
        }

        Image {
            id: thermometer_fourth_level
            visible: false
            anchors.fill: parent
            fillMode: Image.PreserveAspectFit
            source: "Images/Thermometer fourth_level.png"
        }

        Image {
            id: thermometer_fifth_level
            visible: false
            anchors.fill: parent
            fillMode: Image.PreserveAspectFit
            source: "Images/Thermometer fifth_level.png"
        }

        Image {
            id: thermometer_sixth_level
            visible: false
            anchors.fill: parent
            fillMode: Image.PreserveAspectFit
            source: "Images/Thermometer sixth_level.png"
        }

        Text {
            id: thermo_unit_1
            x: 106
            y: 183
            width: 45
            height: 84
            color: "#eae6e6"
            text: qsTr("C")
            wrapMode: Text.WrapAnywhere
            lineHeight: 50
            font.family: "Courier"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            fontSizeMode: Text.Fit
            font.pointSize: 200
            font.bold: true

            Text {
                id: degree_1
                x: 0
                y: 10
                width: 32
                height: 34
                color: "#eae6e6"
                text: qsTr("o")
                lineHeight: 1
                verticalAlignment: Text.AlignVCenter
                font.family: "Courier"
                wrapMode: Text.WrapAnywhere
                horizontalAlignment: Text.AlignHCenter
                fontSizeMode: Text.Fit
                font.pointSize: 10
                font.bold: true
            }
        }

        Text {
            id: thermo_value_1
            x: 92
            y: 167
            width: 65
            height: 57
            color: "#eae6e6"
            text: qsTr("0")
            lineHeight: 50
            verticalAlignment: Text.AlignVCenter
            font.family: "Courier"
            horizontalAlignment: Text.AlignHCenter
            fontSizeMode: Text.Fit
            font.pointSize: 200
            font.bold: true
        }

        function tempValue(value) {
            console.log("Value:" + value)
            thermo_value_1.text = value;


                thermometer_second_level.visible = (value >= 20);
                thermometer_third_level.visible = (value >= 30);
                thermometer_fourth_level.visible = (value >= 40);
                thermometer_fifth_level.visible = (value >= 50);
                thermometer_sixth_level.visible = (value >= 60);


        }
    }

    Slider {
        id: slider
        x: 67
        y: 1076
        stepSize: 1
        to: 100
        snapMode: Slider.SnapAlways
        from: 0
        value: 0

        onValueChanged: thermometer_bearing_1.tempValue(value)


    }

    Connections {
        target: slider
        onMoved: print("clicked")
    }

    Slider {
        id: slider1
        x: 984
        y: 1076
        stepSize: 1
        snapMode: Slider.SnapAlways
        to: 300
        value: 0
        from: 0

        onValueChanged: gyro.needleValue(value)
    }

    Item {
       id: accelx_item
       x: 400
       y: -30
       width: 360
       height:360

       ChartView {
           ValueAxis {
               id: accelX_xAxis
               min: 0
               max: 5
           }

           ValueAxis {
               id: accelX_yAxis
               min: 0
               max: 5
           }

           objectName: "AccelX_Chart"
           id:accelx_chart
           anchors.fill: parent
           animationOptions: ChartView.SeriesAnimations
           backgroundColor: "#000d0d0d"
                    antialiasing: true

                    LineSeries {
                        id: accelx_series
                        name: "Accel X"
                        color: "#ffff0000"
                    }
       }

       function add_accelx_value(x) {
           console.log("Point(" + accelx_series.count + "," + x + ")");
           accelx_series.append(accelx_series.count,x)

           accelX_xAxis.min = accelx_series.count - 5
           accelX_xAxis.max = accelx_series.count

           accelx_chart.setAxisX(accelX_xAxis, accelx_series)
           accelx_chart.setAxisY(accelX_yAxis, accelx_series)
           //accelx_chart.update()
       }
    }

    Item {
        id: accely_item
        x: 400
        y: 280
        width: 360
        height:360

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
            anchors.fill: parent
            animationOptions: ChartView.SeriesAnimations
            backgroundColor: "#000d0d0d"

            antialiasing: true

            LineSeries {
                id: accely_series
                name: "Accel Y"
                color: "#ff00ff00"
            }
        }

        function add_accely_value(x) {
            console.log("Point(" + accely_series.count + "," + x + ")");
            accely_series.append(accely_series.count,x)

            accelY_xAxis.min = accely_series.count - 5
            accelY_xAxis.max = accely_series.count

            accely_chart.setAxisX(accelY_xAxis, accely_series)
            accely_chart.setAxisY(accelY_yAxis, accely_series)

        }
    }

    Item {
        id: accelz_item
        x: 400
        y: 590
        width: 360
        height:360

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

            objectName: "AccelY_Chart"
            id:accelz_chart
            anchors.fill: parent
            animationOptions: ChartView.SeriesAnimations
            backgroundColor: "#000d0d0d"

            antialiasing: true

            LineSeries {
                id: accelz_series
                name: "Accel Z"
                color: "#ff0000ff"
            }
        }

        function add_accelz_value(x) {
            console.log("Point(" + accely_series.count + "," + x + ")");
            accelz_series.append(accelz_series.count,x)

            accelZ_xAxis.min = accelz_series.count - 5
            accelZ_xAxis.max = accelz_series.count

            accelz_chart.setAxisX(accelZ_xAxis, accelz_series)
            accelz_chart.setAxisY(accelZ_yAxis, accelz_series)

        }
    }



}













































































/*##^## Designer {
    D{i:7;anchors_height:100;anchors_width:100;anchors_x:38;anchors_y:"-4"}D{i:22;anchors_y:85;invisible:true}
D{i:23;anchors_height:12;anchors_width:40;anchors_x:0;anchors_y:0}D{i:24;anchors_height:12;anchors_width:40;anchors_x:0;anchors_y:12}
D{i:26;anchors_height:12;anchors_width:40;anchors_x:0;anchors_y:0}D{i:32;anchors_y:85;invisible:true}
D{i:33;anchors_height:12;anchors_width:40;anchors_x:0;anchors_y:0}D{i:34;anchors_height:12;anchors_width:40;anchors_x:0;anchors_y:12}
D{i:36;anchors_height:12;anchors_width:40;anchors_x:0;anchors_y:0}D{i:37;anchors_height:12;anchors_width:40;anchors_x:0;anchors_y:12}
D{i:38;anchors_height:12;anchors_width:40;anchors_x:0;anchors_y:0}D{i:41;anchors_height:200;anchors_width:200}
}
 ##^##*/
