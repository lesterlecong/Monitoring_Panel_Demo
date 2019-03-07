import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Shapes 1.12
import QtQuick.Particles 2.0

Item {
    id: root
    height: 384
    property alias serialPortsComboBox: serialPortsComboBox

    signal close()
    width: 320

    Rectangle {
        id: serial_config_background
        width: parent.width
        height: parent.height
        color: "#39414e"
        radius: parent.width*0.1
        anchors.fill: parent
        border.color: "#39414e"

        Rectangle {
            id: top_level_design
            width: parent.width
            height: parent.height*0.15
            color: "#5ad9a4"
            radius: serial_config_background.radius
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0
            border.color: "#5ad9a4"
        }




        Rectangle {
            id: top_level_design_2
            height: top_level_design.height/2
            color: "#5ad9a4"
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.bottom: top_level_design.bottom
            anchors.bottomMargin: 0
            border.color: "#5ad9a4"
        }

        ComboBox {
            id: serialPortsComboBox
            width: parent.width*0.40

            height: parent.height*0.15
            anchors.rightMargin: parent.width*0.05
            anchors.leftMargin: parent.width*0.05
            anchors.topMargin: parent.height*0.1
            anchors.top: top_level_design_2.bottom
            font.bold: true
            anchors.left: parent.left
            font.pointSize: height*0.3
            anchors.right: parent.right
            Layout.preferredHeight: 40
            Layout.preferredWidth: 126
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


        ComboBox {
            id: baudRateComboBox
            width: parent.width*0.4
            height: parent.height*0.15
            anchors.topMargin: parent.height*0.05
            anchors.top: serialPortsComboBox.bottom
            anchors.rightMargin: parent.width*0.05
            font.bold: true
            anchors.leftMargin: parent.width*0.05
            anchors.left: parent.left
            anchors.right: parent.right
            font.pointSize: height*0.30
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
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
            id: connect_serial_button
            y: 242
            width: parent.width
            height: parent.height*0.15
            text: qsTr("Connect")
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.bottomMargin: parent.height*0.01
            font.bold: true
            anchors.bottom: cancel_serial_button_background_top.top
            font.pointSize: height*0.30

            contentItem: Text {
                text: connect_serial_button.text
                font.bold: connect_serial_button.font.bold
                font.pointSize: connect_serial_button.font.pointSize
                opacity: enabled? 1.0:0.3
                color: "#ffffff"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }

            background: Rectangle {
                id: connect_serial_button_background
                color: "#59c8d9"
                radius: 0
            }

            onClicked: function() {
                console.debug("Connect to serial " +
                              portListItems.get(serialPortsComboBox.currentIndex).text +
                              " with baud rate of " +
                              baudRateItems.get(baudRateComboBox.currentIndex).value)

                serialPortHandler.portName = portListItems.get(serialPortsComboBox.currentIndex).text
                serialPortHandler.baudRate = baudRateItems.get(baudRateComboBox.currentIndex).value
                serialPortHandler.startSerialPort()

                onClicked: root.close()
            }


        }


        Text {
            id: serial_config_label
            width: parent.width
            height: parent.height*0.1
            color: "#ffffff"
            text: qsTr("Serial Configuration")
            anchors.verticalCenter: top_level_design.verticalCenter
            font.pixelSize: height*0.50
            font.bold: true
            fontSizeMode: Text.Fit
            wrapMode: Text.WordWrap
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.right: parent.right
            anchors.rightMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 5
        }


        Rectangle {
            id: cancel_serial_button_background_top
            width: parent.width
            height: (cancel_serial_button.height)/2
            color: "#e74c3c"
            anchors.top: cancel_serial_button.top
            anchors.topMargin: 0


        }

        Button {
            id: cancel_serial_button
            x: 302
            y: 119
            width: parent.width
            height: parent.height*0.15
            text: qsTr("Cancel")
            display: AbstractButton.IconOnly
            anchors.horizontalCenterOffset: 0
            font.bold: true
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.horizontalCenter: parent.horizontalCenter
            Layout.preferredWidth: 108
            Layout.preferredHeight: 40
            font.pointSize: height*0.3

            contentItem: Text {
                text: cancel_serial_button.text
                font.bold: cancel_serial_button.font.bold
                font.pointSize: cancel_serial_button.font.pointSize
                opacity: enabled? 1.0:0.3
                color: "#ffffff"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }

            background: Rectangle {
                id: cancel_serial_button_background
                color: "#e74c3c"
                radius: serial_config_background.radius

            }


            onClicked: root.close()


        }





    }
}



















































































































/*##^## Designer {
    D{i:2;anchors_height:115.19999999999999;anchors_width:300}D{i:3;anchors_width:320}
D{i:4;anchors_y:124}D{i:6;anchors_y:172}D{i:22;anchors_width:388}D{i:1;anchors_height:384;anchors_width:512}
}
 ##^##*/
