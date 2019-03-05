import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4
import QtCharts 2.3

Item {

    property alias led_ir: led_ir
    property alias led_thermo: led_thermo
    property alias led_roller: led_roller
    property alias led_shock: led_shock

    property var leds:[
        led_ir,
        led_thermo,
        led_roller,
        led_shock
    ]

    width: 150
    height: 150

    Rectangle {
        id: rectangle
        width: parent.width
        height: parent.height
        color: "#2c2a2a"
        anchors.fill: parent
        border.color: "#2c2a2a"

        Rectangle {
            id: led_ir
            width: (parent.width)*(0.20)
            height: width
            color: "#00ffffff"
            anchors.bottomMargin: (parent.height - (4*height) )/5
            anchors.leftMargin: 5+( 5*((parent.width-150)/150))
            anchors.bottom: led_thermo.top
            anchors.left: parent.left

            Image {
                id: ir_bearing_red_id
                anchors.fill: parent
                sourceSize.height: 800
                mipmap: true
                sourceSize.width: 800
                Layout.preferredWidth: 80
                source: "Images/LED red.svg"
                fillMode: Image.PreserveAspectFit
                Layout.preferredHeight: 80
            }

            Image {
                id: ir_bearing_green_id
                anchors.fill: parent
                Layout.preferredHeight: 80
                Layout.preferredWidth: 80
                sourceSize.height: 800
                sourceSize.width: 800
                fillMode: Image.PreserveAspectFit
                source: "Images/LED green.svg"
                mipmap: true
            }

            Image {
                id: ir_bearing_yellow_id
                anchors.fill: parent
                Layout.preferredHeight: 80
                Layout.preferredWidth: 80
                sourceSize.height: 800
                sourceSize.width: 800
                fillMode: Image.PreserveAspectFit
                source: "Images/LED yellow.svg"
                mipmap: true
            }

            function status(st) {
                ir_bearing_green_id.visible = (st === 0)
                ir_bearing_yellow_id.visible = (st === 1)
                ir_bearing_red_id.visible = (st === 2)
            }
        }


        Rectangle {
            id: led_thermo
            y: 40
            width: (parent.width)*(0.20)
            height: width
            color: "#00ffffff"
            anchors.verticalCenterOffset: ((height/2) + (((parent.height - (4*height))/5)/2))*(-1)
            anchors.verticalCenter: parent.verticalCenter
            anchors.leftMargin: 5+( 5*((parent.width-150)/150))
            anchors.left: parent.left

            Image {
                id: thermo_bearing_red_id
                anchors.fill: parent
                mipmap: true
                sourceSize.height: 800
                sourceSize.width: 800
                Layout.preferredWidth: 80
                source: "Images/LED red.svg"
                fillMode: Image.PreserveAspectFit
                Layout.preferredHeight: 80

            }

            Image {
                id: thermo_bearing_green_id
                x: 0
                y: 0
                width: parent.width
                height: parent.height
                sourceSize.height: 800
                mipmap: true
                sourceSize.width: 800
                Layout.preferredWidth: 80
                source: "Images/LED green.svg"
                fillMode: Image.PreserveAspectFit
                anchors.fill: parent
                Layout.preferredHeight: 80
            }

            Image {
                id: thermo_bearing_yellow_id
                x: 0
                y: 0
                width: parent.width
                height: parent.height
                sourceSize.height: 800
                mipmap: true
                sourceSize.width: 800
                Layout.preferredWidth: 80
                source: "Images/LED yellow.svg"
                fillMode: Image.PreserveAspectFit
                anchors.fill: parent
                Layout.preferredHeight: 80
            }

            function status(st) {
                thermo_bearing_green_id.visible = (st === 0)
                thermo_bearing_yellow_id.visible = (st === 1)
                thermo_bearing_red_id.visible = (st === 2)
            }
        }





        Rectangle {
            id: led_roller
            y: 80
            width: (parent.width)*(0.20)
            height: width
            color: "#00ffffff"
            anchors.verticalCenterOffset: ((height/2) + (((parent.height - (4*height))/5)/2))
            anchors.verticalCenter: parent.verticalCenter
            anchors.leftMargin: 5+( 5*((parent.width-150)/150))
            anchors.left: parent.left

            Image {
                id: roller_bearing_yellow_id
                x: 0
                y: 0
                width: parent.width
                height: parent.height
                mipmap: true
                sourceSize.height: 800
                sourceSize.width: 800
                Layout.preferredWidth: 80
                source: "Images/LED yellow.svg"
                fillMode: Image.PreserveAspectFit
                anchors.fill: parent
                Layout.preferredHeight: 80
            }

            Image {
                id: roller_bearing_green_id
                x: 0
                y: 0
                width: parent.width
                height: parent.height
                mipmap: true
                sourceSize.height: 800
                sourceSize.width: 800
                Layout.preferredWidth: 80
                source: "Images/LED green.svg"
                fillMode: Image.PreserveAspectFit
                anchors.fill: parent
                Layout.preferredHeight: 80
            }

            Image {
                id: roller_bearing_red_id
                x: 0
                y: 0
                width: parent.width
                height: parent.height
                sourceSize.height: 800
                mipmap: true
                sourceSize.width: 800
                Layout.preferredWidth: 80
                source: "Images/LED red.svg"
                fillMode: Image.PreserveAspectFit
                anchors.fill: parent
                Layout.preferredHeight: 80
            }

            function status(st) {
                roller_bearing_green_id.visible = (st === 0)
                roller_bearing_yellow_id.visible = (st === 1)
                roller_bearing_red_id.visible = (st === 2)
            }
        }

        Rectangle {
            id: led_shock
            width: (parent.width)*(0.20)
            height: width
            color: "#00ffffff"
            anchors.topMargin: (parent.height - (4*height) )/5
            anchors.top: led_roller.bottom
            anchors.leftMargin: 5+( 5*((parent.width-150)/150))
            anchors.left: parent.left

            Image {
                id: shock_yellow_id
                x: 0
                y: 0
                width: parent.width
                height: parent.height
                sourceSize.height: 800
                mipmap: true
                sourceSize.width: 800
                Layout.preferredWidth: 80
                source: "Images/LED yellow.svg"
                fillMode: Image.PreserveAspectFit
                anchors.fill: parent
                Layout.preferredHeight: 80
            }

            Image {
                id: shock_green_id
                x: 0
                y: 0
                width: parent.width
                height: parent.height
                sourceSize.height: 800
                mipmap: true
                sourceSize.width: 800
                Layout.preferredWidth: 80
                source: "Images/LED green.svg"
                fillMode: Image.PreserveAspectFit
                anchors.fill: parent
                Layout.preferredHeight: 80
            }

            Image {
                id: shock_red_id
                x: 0
                y: 0
                width: parent.width
                height: parent.height
                mipmap: true
                sourceSize.height: 800
                sourceSize.width: 800
                Layout.preferredWidth: 80
                source: "Images/LED red.svg"
                fillMode: Image.PreserveAspectFit
                anchors.fill: parent
                Layout.preferredHeight: 80
            }

            function status(st) {
                shock_green_id.visible = (st === 0)
                shock_yellow_id.visible = (st === 1)
                shock_red_id.visible = (st === 2)
            }


        }

        Label {
            id: led_label_shock_1
            y: 30
            width: parent.width-40
            height: led_shock.height
            color: "#ffffff"
            text: qsTr("Shock")
            font.pixelSize: 10+(10*((width-110)/110))
            anchors.right: parent.right
            anchors.rightMargin: 5
            anchors.left: led_shock.right
            anchors.leftMargin: 5
            anchors.verticalCenter: led_shock.verticalCenter
            Layout.preferredHeight: 80
            Layout.preferredWidth: 200
            font.bold: true
            verticalAlignment: Text.AlignVCenter
            font.family: "Courier"
        }

        Label {
            id: led_roller_bearing
            y: 172
            width: parent.width-40
            height: led_roller.height
            color: "#ffffff"
            text: qsTr("Roller")
            font.pixelSize: 10+(10*((width-110)/110))
            anchors.right: parent.right
            anchors.rightMargin: 5
            anchors.left: led_roller.right
            anchors.leftMargin: 5
            anchors.verticalCenter: led_roller.verticalCenter
            Layout.preferredHeight: 80
            Layout.preferredWidth: 200
            font.bold: true
            verticalAlignment: Text.AlignVCenter
            font.family: "Courier"
        }

        Label {
            id: led_label_therm_bearing
            y: 86
            width: parent.width-40
            height: led_thermo.height
            color: "#ffffff"
            text: qsTr("Therm Bearing")
            font.pixelSize: 10+(10*((width-110)/110))
            anchors.right: parent.right
            anchors.rightMargin: 5
            anchors.left: led_thermo.right
            anchors.leftMargin: 5
            anchors.verticalCenter: led_thermo.verticalCenter
            horizontalAlignment: Text.AlignLeft
            textFormat: Text.RichText
            wrapMode: Text.WordWrap
            Layout.preferredHeight: 80
            Layout.preferredWidth: 200
            font.bold: true
            verticalAlignment: Text.AlignVCenter
            font.family: "Courier"
        }

        Label {
            id: led_label_ir_bearing
            y: 0
            width: parent.width-40
            height: led_ir.height
            color: "#ffffff"
            text: qsTr("IR Bearing")
            font.pixelSize: 10+(10*((width-110)/110))
            anchors.right: parent.right
            anchors.rightMargin: 5
            anchors.verticalCenter: led_ir.verticalCenter
            anchors.left: led_ir.right
            anchors.leftMargin: 5
            textFormat: Text.RichText
            wrapMode: Text.WordWrap
            Layout.preferredHeight: 80
            Layout.preferredWidth: 200
            font.bold: true
            font.family: "Courier"
            verticalAlignment: Text.AlignVCenter
        }

    }
}



















/*##^## Designer {
    D{i:10;anchors_y:80}D{i:14;anchors_y:120}D{i:1;anchors_height:150;anchors_width:150;anchors_x:0;anchors_y:0}
}
 ##^##*/
