import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4
import QtCharts 2.3

Item {

    property alias ir_bearing_green: ir_bearing_green_id
    property alias ir_bearing_yellow: ir_bearing_yellow_id
    property alias ir_bearing_red: ir_bearing_red_id

    property alias thermo_bearing_green: thermo_bearing_green_id
    property alias thermo_bearing_yellow: thermo_bearing_yellow_id
    property alias thermo_bearing_red: thermo_bearing_red_id

    property alias roller_bearing_green: roller_bearing_green_id
    property alias roller_bearing_yellow: roller_bearing_yellow_id
    property alias roller_bearing_red: roller_bearing_red_id

    property alias shock_green: shock_green_id
    property alias shock_yellow: shock_yellow_id
    property alias shock_red: shock_red_id
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
            id: led_ir_background
            width: (parent.width)*(0.20)
            height: width
            color: "#00ffffff"
            anchors.bottomMargin: (parent.height - (4*height) )/5
            anchors.leftMargin: 5+( 5*((parent.width-150)/150))
            anchors.bottom: led_therm_background.top
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
        }


        Rectangle {
            id: led_therm_background
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
        }





        Rectangle {
            id: led_roller_background
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


        }

        Rectangle {
            id: led_shock_background
            width: (parent.width)*(0.20)
            height: width
            color: "#00ffffff"
            anchors.topMargin: (parent.height - (4*height) )/5
            anchors.top: led_roller_background.bottom
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


        }

        Label {
            id: led_label_shock_1
            y: 30
            width: parent.width-40
            height: led_shock_background.height
            color: "#6f7479"
            text: qsTr("Shock")
            font.pixelSize: 10+(10*((width-110)/110))
            anchors.right: parent.right
            anchors.rightMargin: 5
            anchors.left: led_shock_background.right
            anchors.leftMargin: 5
            anchors.verticalCenter: led_shock_background.verticalCenter
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
            height: led_roller_background.height
            color: "#6f7479"
            text: qsTr("Roller")
            font.pixelSize: 10+(10*((width-110)/110))
            anchors.right: parent.right
            anchors.rightMargin: 5
            anchors.left: led_roller_background.right
            anchors.leftMargin: 5
            anchors.verticalCenter: led_roller_background.verticalCenter
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
            height: led_therm_background.height
            color: "#6f7479"
            text: qsTr("Therm Bearing")
            font.pixelSize: 10+(10*((width-110)/110))
            anchors.right: parent.right
            anchors.rightMargin: 5
            anchors.left: led_therm_background.right
            anchors.leftMargin: 5
            anchors.verticalCenter: led_therm_background.verticalCenter
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
            height: led_ir_background.height
            color: "#6f7479"
            text: qsTr("IR Bearing")
            font.pixelSize: 10+(10*((width-110)/110))
            anchors.right: parent.right
            anchors.rightMargin: 5
            anchors.verticalCenter: led_ir_background.verticalCenter
            anchors.left: led_ir_background.right
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
