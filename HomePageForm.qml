import QtQuick 2.0
import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4
import QtCharts 2.3

Page {
    property alias serialPortsComboBox: serialPortsComboBox
    property alias bearing_status_home_0: bearing_status_home_0
    property alias bearing_status_home_1: bearing_status_home_1
    property alias bearing_status_home_2: bearing_status_home_2
    property alias bearing_status_home_3: bearing_status_home_3
    property alias bearing_status_home_4: bearing_status_home_4
    property alias bearing_status_home_5: bearing_status_home_5
    property alias bearing_status_home_6: bearing_status_home_6
    property alias bearing_status_home_7: bearing_status_home_7
    property alias bearing_status_home_8: bearing_status_home_8
    property alias bearing_status_home_9: bearing_status_home_9

    property var roller: [
        bearing_status_home_0,
        bearing_status_home_1,
        bearing_status_home_2,
        bearing_status_home_3,
        bearing_status_home_4,
        bearing_status_home_5,
        bearing_status_home_6,
        bearing_status_home_7,
        bearing_status_home_8,
        bearing_status_home_9
    ]

    //id: page
    Rectangle {
        id: home_background
        width: parent.width
        height: parent.height

        color: "#090808"
        StatusLED {
            id: bearing_status_home_0
            x: 0
            width: parent.width*0.15
            height: width
            anchors.horizontalCenter: bearing_status_home_5.horizontalCenter
            anchors.verticalCenter: bearing_status_home_2.verticalCenter

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    rollerpage.roller_number = 0
                    rollerpage.roller_form_title.text = "Roller 0"
                    swipeView.currentIndex++
                }
            }


        }

        StatusLED {
            id: bearing_status_home_1
            y: 0
            width: parent.width*0.15
            height: width
            anchors.horizontalCenter: bearing_status_home_6.horizontalCenter
            anchors.verticalCenter: bearing_status_home_2.verticalCenter

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    rollerpage.roller_number = 1
                    rollerpage.roller_form_title.text = "Roller 1"
                    swipeView.currentIndex++
                }
            }
        }

        StatusLED {
            id: bearing_status_home_2
            x: 0
            y: 0
            width: parent.width*0.15
            height: width
            anchors.bottomMargin: (parent.height - ((5* width)/2) - (2*(width*0.1)) )/4
            anchors.bottom: bearing_status_home_label_7.top
            anchors.horizontalCenter: parent.horizontalCenter

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    rollerpage.roller_number = 2
                    rollerpage.roller_form_title.text = "Roller 2"
                    swipeView.currentIndex++
                }
            }
        }

        StatusLED {
            id: bearing_status_home_3
            x: 0
            y: 0
            width: parent.width*0.15
            height: width
            anchors.horizontalCenter: bearing_status_home_8.horizontalCenter
            anchors.verticalCenter: bearing_status_home_2.verticalCenter

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    rollerpage.roller_number = 3
                    rollerpage.roller_form_title.text = "Roller 3"
                    swipeView.currentIndex++
                }
            }
        }

        StatusLED {
            id: bearing_status_home_4
            x: 0
            y: 0
            width: parent.width*0.15
            height: width
            anchors.horizontalCenter: bearing_status_home_9.horizontalCenter
            anchors.verticalCenter: bearing_status_home_2.verticalCenter

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    rollerpage.roller_number = 4
                    rollerpage.roller_form_title.text = "Roller 4"
                    swipeView.currentIndex++
                }
            }
        }

        StatusLED {
            id: bearing_status_home_5
            x: 1
            y: 0
            width: parent.width*0.15
            height: width
            anchors.verticalCenter: bearing_status_home_7.verticalCenter
            anchors.rightMargin: parent.width*0.041667
            anchors.right: bearing_status_home_6.left

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    rollerpage.roller_number = 5
                    rollerpage.roller_form_title.text = "Roller 5"
                    swipeView.currentIndex++
                }
            }
        }

        StatusLED {
            id: bearing_status_home_6
            x: 0
            y: 0
            width: parent.width*0.15
            height: width
            anchors.verticalCenter: bearing_status_home_7.verticalCenter
            anchors.rightMargin: parent.width*0.041667
            anchors.right: bearing_status_home_7.left

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    rollerpage.roller_number = 6
                    rollerpage.roller_form_title.text = "Roller 6"
                    swipeView.currentIndex++
                }
            }
        }

        StatusLED {
            id: bearing_status_home_7
            x: 0
            y: 0
            width: parent.width*0.15
            height: width
            anchors.bottomMargin: (parent.height - ((5* width)/2) - (2*(width*0.1)) )/4
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    rollerpage.roller_number = 7
                    rollerpage.roller_form_title.text = "Roller 7"
                    swipeView.currentIndex++
                }
            }
        }

        StatusLED {
            id: bearing_status_home_8
            x: 0
            y: 0
            width: parent.width * 0.15
            height: width
            anchors.verticalCenter: bearing_status_home_7.verticalCenter
            anchors.leftMargin: parent.width*0.041667
            anchors.left: bearing_status_home_7.right

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    rollerpage.roller_number = 8
                    rollerpage.roller_form_title.text = "Roller 8"
                    swipeView.currentIndex++
                }
            }
        }


        StatusLED {
            id: bearing_status_home_9
            y: 0
            width: parent.width * 0.15
            height: width
            anchors.verticalCenter: bearing_status_home_7.verticalCenter
            anchors.leftMargin: parent.width*0.041667
            anchors.left: bearing_status_home_8.right

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    rollerpage.roller_number = 9
                    rollerpage.roller_form_title.text = "Roller 9"
                    swipeView.currentIndex++
                }
            }
        }


        Text {
            id: bearing_status_home_label_0
            y: 3
            height: bearing_status_home_7.width*0.1
            color: "#ffffff"
            text: qsTr("Roller 0")
            font.pixelSize: 12 + (12*((parent.height - 640)/640))
            anchors.leftMargin: 0
            fontSizeMode: Text.Fit
            anchors.rightMargin: 0
            anchors.bottomMargin: 0
            font.family: "Courier"
            anchors.left: bearing_status_home_0.left
            horizontalAlignment: Text.AlignHCenter
            font.bold: true
            anchors.bottom: bearing_status_home_0.top
            textFormat: Text.RichText
            anchors.right: bearing_status_home_0.right
            verticalAlignment: Text.AlignBottom
            wrapMode: Text.WordWrap
        }

        Text {
            id: bearing_status_home_label_1
            y: 11
            height: bearing_status_home_7.width*0.1
            color: "#ffffff"
            text: qsTr("Roller 1")
            font.pixelSize: 12 + (12*((parent.height - 640)/640))
            anchors.leftMargin: 0
            fontSizeMode: Text.Fit
            anchors.rightMargin: 0
            anchors.bottomMargin: 0
            font.family: "Courier"
            anchors.left: bearing_status_home_1.left
            horizontalAlignment: Text.AlignHCenter
            font.bold: true
            anchors.bottom: bearing_status_home_1.top
            textFormat: Text.RichText
            anchors.right: bearing_status_home_1.right
            verticalAlignment: Text.AlignBottom
            wrapMode: Text.WordWrap
        }

        Text {
            id: bearing_status_home_label_2
            y: 9
            height: bearing_status_home_7.width*0.1
            color: "#ffffff"
            text: qsTr("Roller 2")
            font.pixelSize: 12 + (12*((parent.height - 640)/640))
            anchors.leftMargin: 0
            fontSizeMode: Text.Fit
            anchors.rightMargin: 0
            anchors.bottomMargin: 0
            font.family: "Courier"
            anchors.left: bearing_status_home_2.left
            horizontalAlignment: Text.AlignHCenter
            font.bold: true
            anchors.bottom: bearing_status_home_2.top
            textFormat: Text.RichText
            anchors.right: bearing_status_home_2.right
            verticalAlignment: Text.AlignBottom
            wrapMode: Text.WordWrap
        }

        Text {
            id: bearing_status_home_label_3
            y: 15
            height: bearing_status_home_7.width*0.1
            color: "#ffffff"
            text: qsTr("Roller 3")
            font.pixelSize: 12 + (12*((parent.height - 640)/640))
            anchors.leftMargin: 0
            fontSizeMode: Text.Fit
            anchors.rightMargin: 0
            anchors.bottomMargin: 0
            font.family: "Courier"
            anchors.left: bearing_status_home_3.left
            horizontalAlignment: Text.AlignHCenter
            font.bold: true
            anchors.bottom: bearing_status_home_3.top
            textFormat: Text.RichText
            anchors.right: bearing_status_home_3.right
            verticalAlignment: Text.AlignBottom
            wrapMode: Text.WordWrap
        }

        Text {
            id: bearing_status_home_label_4
            y: 9
            height: bearing_status_home_7.width*0.1
            color: "#ffffff"
            text: qsTr("Roller 4")
            font.pixelSize: 12 + (12*((parent.height - 640)/640))
            anchors.leftMargin: 0
            fontSizeMode: Text.Fit
            anchors.rightMargin: 0
            anchors.bottomMargin: 0
            font.family: "Courier"
            anchors.left: bearing_status_home_4.right
            horizontalAlignment: Text.AlignHCenter
            font.bold: true
            anchors.bottom: bearing_status_home_4.top
            textFormat: Text.RichText
            anchors.right: bearing_status_home_4.left
            verticalAlignment: Text.AlignBottom
            wrapMode: Text.WordWrap
        }

        Text {
            id: bearing_status_home_label_5
            y: 9
            height: bearing_status_home_7.width*0.1
            color: "#ffffff"
            text: qsTr("Roller 5")
            font.pixelSize: 12 + (12*((parent.height - 640)/640))
            anchors.leftMargin: 0
            fontSizeMode: Text.Fit
            anchors.rightMargin: 0
            anchors.bottomMargin: 0
            font.family: "Courier"
            anchors.left: bearing_status_home_5.left
            horizontalAlignment: Text.AlignHCenter
            font.bold: true
            anchors.bottom: bearing_status_home_5.top
            textFormat: Text.RichText
            anchors.right: bearing_status_home_5.right
            verticalAlignment: Text.AlignBottom
            wrapMode: Text.WordWrap
        }






        Text {
            id: bearing_status_home_label_6
            y: 9
            height: bearing_status_home_7.width*0.1
            color: "#ffffff"
            text: qsTr("Roller 6")
            font.pixelSize: 12 + (12*((parent.height - 640)/640))
            anchors.leftMargin: 0
            fontSizeMode: Text.Fit
            anchors.rightMargin: 0
            anchors.bottomMargin: 0
            font.family: "Courier"
            anchors.left: bearing_status_home_6.left
            horizontalAlignment: Text.AlignHCenter
            font.bold: true
            anchors.bottom: bearing_status_home_6.top
            textFormat: Text.RichText
            anchors.right: bearing_status_home_6.right
            verticalAlignment: Text.AlignBottom
            wrapMode: Text.WordWrap
        }







        Text {
            id: bearing_status_home_label_7
            y: 2
            width: bearing_status_home_7.width
            height: bearing_status_home_7.width*0.1
            color: "#ffffff"
            text: qsTr("Roller 7")
            font.pixelSize: 12 + (12*((parent.height - 640)/640))
            anchors.right: bearing_status_home_7.left
            anchors.rightMargin: 0
            anchors.left: bearing_status_home_7.right
            anchors.leftMargin: 0
            fontSizeMode: Text.Fit
            anchors.bottom: bearing_status_home_7.top
            textFormat: Text.RichText
            verticalAlignment: Text.AlignBottom
            horizontalAlignment: Text.AlignHCenter
            anchors.bottomMargin: 0
            font.bold: true
            font.family: "Courier"
            wrapMode: Text.WordWrap
        }








        Text {
            id: bearing_status_home_label_8
            y: 10
            height: bearing_status_home_8.width*0.1
            color: "#ffffff"
            text: qsTr("Roller 8")
            font.pixelSize: 12 + (12*((parent.height - 640)/640))
            anchors.leftMargin: 0
            fontSizeMode: Text.Fit
            anchors.rightMargin: 0
            anchors.bottomMargin: 0
            font.family: "Courier"
            anchors.left: bearing_status_home_8.left
            horizontalAlignment: Text.AlignHCenter
            font.bold: true
            anchors.bottom: bearing_status_home_8.top
            textFormat: Text.RichText
            anchors.right: bearing_status_home_8.right
            verticalAlignment: Text.AlignBottom
            wrapMode: Text.WordWrap
        }








        Text {
            id: bearing_status_home_label_9
            y: 17
            height: bearing_status_home_9.width*0.1
            color: "#ffffff"
            text: qsTr("Roller 9")
            font.pixelSize: 12 + (12*((parent.height - 640)/640))
            anchors.leftMargin: 0
            fontSizeMode: Text.Fit
            anchors.rightMargin: 0
            anchors.bottomMargin: 0
            font.family: "Courier"
            anchors.left: bearing_status_home_9.left
            horizontalAlignment: Text.AlignHCenter
            font.bold: true
            anchors.bottom: bearing_status_home_9.top
            textFormat: Text.RichText
            anchors.right: bearing_status_home_9.right
            verticalAlignment: Text.AlignBottom
            wrapMode: Text.WordWrap
        }





        Text {
            id: home_title
            color: "#ffffff"
            text: qsTr("REI Monitoring Panel")
            font.bold: true
            font.pixelSize: 40 + (40*( (parent.width-640)/640))
            anchors.topMargin: (parent.height - ((5* bearing_status_home_0.width)/2) - (2*(width*0.1)) )/4 + (parent.width*0.0625)
            anchors.top: parent.top
            textFormat: Text.RichText
            fontSizeMode: Text.FixedSize
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.bottomMargin: (parent.height - ((5* bearing_status_home_0.width)/2) - (2*(width*0.1)) )/4 + 10
            anchors.bottom: bearing_status_home_label_2.top
            wrapMode: Text.WordWrap
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
        }

        Image {
            id: settings
            x: 532
            width: parent.width * 0.0625
            height: width
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.right: parent.right
            anchors.rightMargin: 5
            fillMode: Image.PreserveAspectFit
            source: "Images/settings button-01.svg"
            mipmap: true

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    configuration_popup.open()
                }
            }
        }

        Popup {
            id: configuration_popup
            x: ((parent.width/2) - (width/2))
            y: ((parent.height/2) - (height/2))
            width: parent.width * 0.8
            height: parent.height *0.80
            modal: true
            focus: true
            closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent

            Configuration {
                id: configuration
                x: ((parent.width/2) - (width/2))
                y: ((parent.height/2) - (height/2))
                width: configuration_popup.width
                height: configuration_popup.height
                onClose: configuration_popup.close()
            }
        }

        Popup {
            id: settings_popup
            x: ((parent.width/2) - (width/2))
            y: ((parent.height/2) - (height/2))
            width: parent.width * 0.8
            height: parent.height *0.80
            modal: true
            focus: true
            closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent




            Rectangle {
                id: popup_background
                x: ((parent.width/2) - (width/2))
                y: ((parent.height/2) - (height/2))
                width: settings_popup.width
                height: settings_popup.height
                color: "#2c2a2a"
                border.color: "#2c2a2a"

                ComboBox {
                    id: serialPortsComboBox
                    x: 181
                    y: 124
                    width: parent.width*0.3
                    height: parent.height*0.15
                    font.pointSize: 8 + (8*((width-154)/154))
                    anchors.verticalCenter: baudRateComboBox.verticalCenter
                    anchors.right: baudRateComboBox.left
                    anchors.rightMargin: 5
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
                    x: 186
                    y: 172
                    width: parent.width*0.3
                    height: parent.height*0.15
                    font.pointSize: 8 + (8*((width-154)/154))
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
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
                    id: button
                    y: 124
                    width: parent.width*0.3
                    height: parent.height*0.15
                    text: qsTr("Connect")
                    font.pointSize: 8 + (8*((width-154)/154))
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: baudRateComboBox.right
                    anchors.leftMargin: 5
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

                        settings_popup.close()
                    }
                }

                Text {
                    id: settings_label
                    height: parent.height*0.1
                    color: "#ffffff"
                    text: qsTr("Settings")
                    font.pixelSize: 25 + (25*((height - 38)/38))
                    font.bold: true
                    fontSizeMode: Text.Fit
                    wrapMode: Text.WordWrap
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    anchors.top: parent.top
                    anchors.topMargin: 5
                    anchors.right: parent.right
                    anchors.rightMargin: 0
                    anchors.left: parent.left
                    anchors.leftMargin: 0
                }
            }
        }



    }
}













































































/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:4;anchors_y:170}D{i:8;anchors_x:"-6";anchors_y:170}
D{i:10;anchors_x:6;anchors_y:170}D{i:12;anchors_x:1;anchors_y:170}D{i:14;anchors_x:133;anchors_y:170}
D{i:16;anchors_x:"-3";anchors_y:8}D{i:18;anchors_x:0;anchors_y:"-4"}D{i:20;anchors_x:0;anchors_y:2}
D{i:22;anchors_x:"-9"}D{i:23;anchors_x:"-9"}D{i:27;anchors_x:"-6"}D{i:28;anchors_width:96;anchors_x:"-6"}
D{i:29;anchors_width:96;anchors_x:2}D{i:30;anchors_width:640;anchors_x:"-4"}D{i:32;anchors_width:640}
D{i:34;anchors_width:640}D{i:55;anchors_x:257}D{i:58;anchors_x:257}
}
 ##^##*/
