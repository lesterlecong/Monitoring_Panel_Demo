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
    width: 1280
    height: 960
    color: "#2c2a2a"
    title: qsTr("Monitoring Panel")


    AccelerometerHandler {
        id: accelxHandler


    }

    SerialPortHandler {
        id: serialPortHandler
        onNewPortDetected: serialPortsComboBox.addPort(portName)
        onNewTemperatureData: function(widgetNum, value) {
            if(widgetNum === 0) {
                thermometer_bearing_1.tempValue(value)
            }
            else if(widgetNum === 1) {
                thermometer_bearing_2.tempValue(value)
            }
            else if(widgetNum === 2) {
                thermometer_bearing_3.tempValue(value)
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
                led_bearing_1.setState(value)
            }
            else if(widgetNum === 1) {
                led_bearing_2.setState(value)
            }
            else if(widgetNum === 2) {
                led_tube_1.setState(value)
            }
            else if(widgetNum === 3) {
                led_shock_1.setState(value)
            }

        }
    }


    Image {
        id: thermometer_bearing_1
        width: 250
        height: 250
        anchors.top: parent.top
        anchors.topMargin: 25
        anchors.left: parent.left
        anchors.leftMargin: 25
        fillMode: Image.PreserveAspectFit
        source: "Images/Thermometer Background.png"

        Image {
            id: thermometer_first_level_1
            anchors.fill: parent
            fillMode: Image.PreserveAspectFit
            source: "Images/Thermometer first_level.png"

            ColumnLayout {
                y: 189
                anchors.right: parent.right
                anchors.rightMargin: 0
                anchors.left: parent.left
                anchors.leftMargin: 0
                spacing: 0

                Text {
                    id: thermo_value_1
                    color: "#eae6e6"
                    text: qsTr("100")
                    wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                    Layout.fillWidth: true
                    Layout.preferredHeight: 17
                    Layout.preferredWidth: 41
                    lineHeight: 0
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Courier"
                    horizontalAlignment: Text.AlignHCenter
                    fontSizeMode: Text.Fit
                    font.pointSize: 20
                    font.bold: true
                }

                ColumnLayout {
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    spacing: 0

                    Text {
                        id: degree_1
                        color: "#eae6e6"
                        text: qsTr("o")
                        Layout.preferredHeight: 11
                        Layout.preferredWidth: 22
                        lineHeight: 1
                        verticalAlignment: Text.AlignVCenter
                        font.family: "Courier"
                        wrapMode: Text.WrapAnywhere
                        horizontalAlignment: Text.AlignLeft
                        fontSizeMode: Text.Fit
                        font.pointSize: 10
                        font.bold: true
                    }

                    Text {
                        id: thermo_unit_1
                        color: "#eae6e6"
                        text: qsTr("C")
                        Layout.preferredHeight: 17
                        Layout.preferredWidth: 22
                        renderType: Text.NativeRendering
                        wrapMode: Text.WrapAnywhere
                        lineHeight: 0
                        font.family: "Courier"
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        fontSizeMode: Text.Fit
                        font.pointSize: 50
                        font.bold: true
                    }
                }
            }
        }

        Image {
            id: thermometer_second_level_1
            visible: false
            anchors.fill: parent
            fillMode: Image.PreserveAspectFit
            source: "Images/Thermometer second_level.png"
        }

        Image {
            id: thermometer_third_level_1
            visible: false
            anchors.fill: parent
            fillMode: Image.PreserveAspectFit
            source: "Images/Thermometer third_level.png"
        }

        Image {
            id: thermometer_fourth_level_1
            visible: false
            anchors.fill: parent
            fillMode: Image.PreserveAspectFit
            source: "Images/Thermometer fourth_level.png"
        }

        Image {
            id: thermometer_fifth_level_1
            visible: false
            anchors.fill: parent
            fillMode: Image.PreserveAspectFit
            source: "Images/Thermometer fifth_level.png"
        }

        Image {
            id: thermometer_sixth_level_1
            visible: false
            anchors.fill: parent
            fillMode: Image.PreserveAspectFit
            source: "Images/Thermometer sixth_level.png"
        }


        function tempValue(value) {
            //console.log("Value:" + value)
            thermo_value_1.text = value;

            thermometer_second_level_1.visible = (value >= 20);
            thermometer_third_level_1.visible = (value >= 30);
            thermometer_fourth_level_1.visible = (value >= 40);
            thermometer_fifth_level_1.visible = (value >= 50);
            thermometer_sixth_level_1.visible = (value >= 60);
        }
    }

    Image {
        id: thermometer_bearing_2
        x: 7
        y: -6
        width: 250
        height: 250
        fillMode: Image.PreserveAspectFit
        anchors.top: thermometer_bearing_1.bottom
        Image {
            id: thermometer_first_level_2
            fillMode: Image.PreserveAspectFit
            anchors.fill: parent
            ColumnLayout {
                y: 189
                Text {
                    id: thermo_value_2
                    color: "#eae6e6"
                    text: qsTr("100")
                    lineHeight: 0
                    font.bold: true
                    wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                    Layout.preferredWidth: 41
                    Layout.fillWidth: true
                    verticalAlignment: Text.AlignVCenter
                    fontSizeMode: Text.Fit
                    font.pointSize: 20
                    font.family: "Courier"
                    horizontalAlignment: Text.AlignHCenter
                    Layout.preferredHeight: 17
                }

                ColumnLayout {
                    Text {
                        id: degree_2
                        color: "#eae6e6"
                        text: qsTr("o")
                        lineHeight: 1
                        font.bold: true
                        Layout.preferredWidth: 22
                        wrapMode: Text.WrapAnywhere
                        verticalAlignment: Text.AlignVCenter
                        fontSizeMode: Text.Fit
                        font.pointSize: 10
                        font.family: "Courier"
                        horizontalAlignment: Text.AlignLeft
                        Layout.preferredHeight: 11
                    }

                    Text {
                        id: thermo_unit_2
                        color: "#eae6e6"
                        text: qsTr("C")
                        lineHeight: 0
                        font.bold: true
                        Layout.preferredWidth: 22
                        wrapMode: Text.WrapAnywhere
                        renderType: Text.NativeRendering
                        verticalAlignment: Text.AlignVCenter
                        fontSizeMode: Text.Fit
                        font.pointSize: 50
                        font.family: "Courier"
                        horizontalAlignment: Text.AlignHCenter
                        Layout.preferredHeight: 17
                    }
                    spacing: 0
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                }
                spacing: 0
                anchors.rightMargin: 0
                anchors.leftMargin: 0
                anchors.right: parent.right
                anchors.left: parent.left
            }
            source: "Images/Thermometer first_level.png"
        }

        Image {
            id: thermometer_second_level_2
            fillMode: Image.PreserveAspectFit
            anchors.fill: parent
            visible: false
            source: "Images/Thermometer second_level.png"
        }

        Image {
            id: thermometer_third_level_2
            fillMode: Image.PreserveAspectFit
            anchors.fill: parent
            visible: false
            source: "Images/Thermometer third_level.png"
        }

        Image {
            id: thermometer_fourth_level_2
            fillMode: Image.PreserveAspectFit
            anchors.fill: parent
            visible: false
            source: "Images/Thermometer fourth_level.png"
        }

        Image {
            id: thermometer_fifth_level_2
            fillMode: Image.PreserveAspectFit
            anchors.fill: parent
            visible: false
            source: "Images/Thermometer fifth_level.png"
        }

        Image {
            id: thermometer_sixth_level_2
            fillMode: Image.PreserveAspectFit
            anchors.fill: parent
            visible: false
            source: "Images/Thermometer sixth_level.png"
        }
        anchors.topMargin: 25
        anchors.leftMargin: 25
        source: "Images/Thermometer Background.png"
        anchors.left: parent.left

        function tempValue(value) {
            //console.log("Value:" + value)
            thermo_value_2.text = value;

            thermometer_second_level_2.visible = (value >= 20);
            thermometer_third_level_2.visible = (value >= 30);
            thermometer_fourth_level_2.visible = (value >= 40);
            thermometer_fifth_level_2.visible = (value >= 50);
            thermometer_sixth_level_2.visible = (value >= 60);
        }
    }

    Image {
        id: thermometer_bearing_3
        x: 7
        y: -9
        width: 250
        height: 250
        fillMode: Image.PreserveAspectFit
        anchors.top: thermometer_bearing_2.bottom
        Image {
            id: thermometer_first_level_3
            fillMode: Image.PreserveAspectFit
            anchors.fill: parent
            ColumnLayout {
                y: 189
                Text {
                    id: thermo_value_3
                    color: "#eae6e6"
                    text: qsTr("100")
                    font.bold: true
                    lineHeight: 0
                    Layout.preferredWidth: 41
                    wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                    Layout.fillWidth: true
                    verticalAlignment: Text.AlignVCenter
                    fontSizeMode: Text.Fit
                    font.pointSize: 20
                    font.family: "Courier"
                    horizontalAlignment: Text.AlignHCenter
                    Layout.preferredHeight: 17
                }

                ColumnLayout {
                    Text {
                        id: degree_3
                        color: "#eae6e6"
                        text: qsTr("o")
                        font.bold: true
                        lineHeight: 1
                        wrapMode: Text.WrapAnywhere
                        Layout.preferredWidth: 22
                        verticalAlignment: Text.AlignVCenter
                        fontSizeMode: Text.Fit
                        font.pointSize: 10
                        font.family: "Courier"
                        horizontalAlignment: Text.AlignLeft
                        Layout.preferredHeight: 11
                    }

                    Text {
                        id: thermo_unit_3
                        color: "#eae6e6"
                        text: qsTr("C")
                        font.bold: true
                        lineHeight: 0
                        wrapMode: Text.WrapAnywhere
                        Layout.preferredWidth: 22
                        renderType: Text.NativeRendering
                        verticalAlignment: Text.AlignVCenter
                        fontSizeMode: Text.Fit
                        font.pointSize: 50
                        font.family: "Courier"
                        horizontalAlignment: Text.AlignHCenter
                        Layout.preferredHeight: 17
                    }
                    spacing: 0
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                }
                spacing: 0
                anchors.rightMargin: 0
                anchors.leftMargin: 0
                anchors.left: parent.left
                anchors.right: parent.right
            }
            source: "Images/Thermometer first_level.png"
        }

        Image {
            id: thermometer_second_level_3
            fillMode: Image.PreserveAspectFit
            anchors.fill: parent
            visible: false
            source: "Images/Thermometer second_level.png"
        }

        Image {
            id: thermometer_third_level_3
            fillMode: Image.PreserveAspectFit
            anchors.fill: parent
            visible: false
            source: "Images/Thermometer third_level.png"
        }

        Image {
            id: thermometer_fourth_level_3
            fillMode: Image.PreserveAspectFit
            anchors.fill: parent
            visible: false
            source: "Images/Thermometer fourth_level.png"
        }

        Image {
            id: thermometer_fifth_level_3
            fillMode: Image.PreserveAspectFit
            anchors.fill: parent
            visible: false
            source: "Images/Thermometer fifth_level.png"
        }

        Image {
            id: thermometer_sixth_level_3
            fillMode: Image.PreserveAspectFit
            anchors.fill: parent
            visible: false
            source: "Images/Thermometer sixth_level.png"
        }
        anchors.topMargin: 25
        source: "Images/Thermometer Background.png"
        anchors.leftMargin: 25
        anchors.left: parent.left

        function tempValue(value) {
            //console.log("Value:" + value)
            thermo_value_3.text = value;

            thermometer_second_level_3.visible = (value >= 20);
            thermometer_third_level_3.visible = (value >= 30);
            thermometer_fourth_level_3.visible = (value >= 40);
            thermometer_fifth_level_3.visible = (value >= 50);
            thermometer_sixth_level_3.visible = (value >= 60);
        }
    }

    Image {
        id: gyro
        x: 1042
        width: 400
        height: 400
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
            width: 480
            height: 480
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
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
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
                height: 25
                color: "#c5bebe"
                text: qsTr("RPM")
                anchors.right: rpm_value.right
                anchors.rightMargin: 0
                anchors.left: rpm_value.left
                anchors.leftMargin: 0
                anchors.top: rpm_value.bottom
                anchors.topMargin: 0
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
            //console.log("Rotation:" + value)
            gyro_needle.rotation = value * 1
            rpm_value.text = value
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
                min: 0.0
                max: 5.0
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


        property real largestY:0.0;

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

        property real largestY:0.0;

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

        property real largestY:0.0;

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

        }
    }


    RowLayout {
    }


    GridLayout {
        x: 858
        y: 370
        rows: 1
        columns: 2

        ColumnLayout {

            Image {
                id: led_bearing_1
                Layout.preferredHeight: 80
                Layout.preferredWidth: 80
                sourceSize.height: 800
                sourceSize.width: 800
                fillMode: Image.PreserveAspectFit
                source: "Images/LED green.svg"
                mipmap: true

                function setState(state) {
                    if(state > 0) {
                        led_bearing_1.source = "Images/LED green.svg"
                    }
                    else {
                        led_bearing_1.source = "Images/LED red.png"
                    }
                }
            }

            Image {
                id: led_bearing_2
                Layout.preferredHeight: 80
                Layout.preferredWidth: 80
                fillMode: Image.PreserveAspectFit
                sourceSize.width: 800
                source: "Images/LED green.png"
                sourceSize.height: 800
                mipmap: true

                function setState(state) {
                    if(state > 0) {
                        led_bearing_2.source = "Images/LED green.svg"
                    }
                    else {
                        led_bearing_2.source = "Images/LED red.png"
                    }
                }
            }

            Image {
                id: led_tube_1
                Layout.preferredHeight: 80
                Layout.preferredWidth: 80
                sourceSize.width: 800
                fillMode: Image.PreserveAspectFit
                source: "Images/LED green.png"
                sourceSize.height: 800

                function setState(state) {
                    if(state > 0) {
                        led_tube_1.source = "Images/LED green.svg"
                    }
                    else {
                        led_tube_1.source = "Images/LED red.png"
                    }
                }
            }

            Image {
                id: led_shock_1
                Layout.preferredHeight: 80
                Layout.preferredWidth: 80
                fillMode: Image.PreserveAspectFit
                sourceSize.width: 800
                source: "Images/LED green.png"
                sourceSize.height: 800

                function setState(state) {
                    if(state > 0) {

                        led_shock_1.source = "Images/LED green.svg"
                    }
                    else {
                        led_shock_1.source = "Images/LED red.png"
                    }
                }
            }
        }

        ColumnLayout {

            Label {
                id: led_label_bearing_1
                color: "#6f7479"
                text: qsTr("Bearing 1")
                Layout.preferredHeight: 80
                Layout.preferredWidth: 200
                font.bold: true
                font.pixelSize: 20
                font.family: "Courier"
                verticalAlignment: Text.AlignVCenter
            }

            Label {
                id: led_label_bearing_2
                color: "#6f7479"
                text: qsTr("Bearing 2")
                Layout.preferredHeight: 80
                Layout.preferredWidth: 200
                font.bold: true
                verticalAlignment: Text.AlignVCenter
                font.family: "Courier"
                font.pixelSize: 20
            }

            Label {
                id: led_tube_bearing_1
                color: "#6f7479"
                text: qsTr("Tube")
                Layout.preferredHeight: 80
                Layout.preferredWidth: 200
                font.bold: true
                verticalAlignment: Text.AlignVCenter
                font.family: "Courier"
                font.pixelSize: 20
            }

            Label {
                id: led_label_shock_1
                color: "#6f7479"
                text: qsTr("Shock")
                Layout.preferredHeight: 80
                Layout.preferredWidth: 200
                font.bold: true
                verticalAlignment: Text.AlignVCenter
                font.family: "Courier"
                font.pixelSize: 20
            }
        }
    }


    ComboBox {
        id: serialPortsComboBox
        x: 14
        y: 901
        width: 126
        height: 40
        textRole: "text"
        editable: false


        model: ListModel
        {
            id: portListItems

        }



        function addPort(portName) {
            //console.log("New Port Received:" + portName)
            if(serialPortsComboBox.find(portName) === -1) {
                //console.log("Adding Port:" + portName)
                portListItems.append({text: portName})
                serialPortsComboBox.currentIndex = serialPortsComboBox.find(portName)
            }
        }

        onCurrentIndexChanged: console.debug(portListItems.get(currentIndex).text + ", " + portListItems.get(currentIndex).color)
        Component.onCompleted: serialPortHandler.availablePorts()
    }


    Button {
        id: button
        x: 304
        y: 901
        width: 108
        height: 40
        text: qsTr("Connect")
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


    ComboBox {
        id: baudRateComboBox
        x: 146
        y: 901
        width: 152
        height: 40
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





}





































































































































/*##^## Designer {
    D{i:6;anchors_width:126;anchors_x:177;anchors_y:245}D{i:9;anchors_x:104}D{i:7;anchors_height:100;anchors_width:100;anchors_x:25;anchors_y:350}
D{i:4;anchors_x:104}D{i:12;anchors_y:85}D{i:13;anchors_height:12;anchors_width:40;anchors_x:0;anchors_y:0}
D{i:14;anchors_height:12;anchors_width:40;anchors_x:0;anchors_y:12}D{i:3;anchors_height:100;anchors_width:100;anchors_x:25;anchors_y:350}
D{i:18;anchors_height:12;anchors_width:40;anchors_x:0;anchors_y:0}D{i:20;anchors_height:12;anchors_width:40;anchors_x:0;anchors_y:0}
D{i:19;anchors_height:12;anchors_width:40;anchors_x:0;anchors_y:12}D{i:17;anchors_y:85}
D{i:16;anchors_x:104}D{i:23;anchors_height:200;anchors_width:200}D{i:24;anchors_y:85}
D{i:25;anchors_height:12;anchors_width:40;anchors_x:0;anchors_y:0}D{i:26;anchors_height:12;anchors_width:40;anchors_x:0;anchors_y:12}
D{i:28;anchors_x:104}D{i:36;anchors_y:85}D{i:37;anchors_height:12;anchors_width:40;anchors_x:0;anchors_y:0}
D{i:38;anchors_height:12;anchors_width:40;anchors_x:0;anchors_y:12}D{i:42;anchors_width:126;anchors_x:177;anchors_y:245}
D{i:43;anchors_height:100;anchors_width:100;anchors_x:25;anchors_y:350}D{i:39;anchors_height:100;anchors_width:100;anchors_x:25;anchors_y:350}
D{i:44;anchors_height:12;anchors_width:40;anchors_x:0;anchors_y:0}D{i:47;anchors_height:200;anchors_width:200}
D{i:70;anchors_x:104}D{i:79;anchors_height:12;anchors_width:40;anchors_x:0;anchors_y:0}
D{i:80;anchors_height:12;anchors_width:40;anchors_x:0;anchors_y:12}D{i:82;anchors_x:104}
D{i:90;anchors_y:85}D{i:91;anchors_height:12;anchors_width:40;anchors_x:0;anchors_y:0}
D{i:92;anchors_height:12;anchors_width:40;anchors_x:0;anchors_y:12}D{i:78;anchors_y:85}
}
 ##^##*/
