import QtQuick 2.0
import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4
import QtCharts 2.3

Page {
    id: page

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
    property alias serial_configuration: serial_configuration

    //id: page




    Rectangle {
        id: home_background
        width: parent.width
        height: parent.height

        color: "#262d37"
        border.color: "#262d37"
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
            height: bearing_status_home_7.width*0.2
            color: "#ffffff"
            text: qsTr("Roller 0")
            anchors.right: roller_0_settings.left
            anchors.rightMargin: 0
            font.pixelSize: 12 + (12*((parent.height - 640)/640))
            anchors.leftMargin: 0
            fontSizeMode: Text.Fit
            anchors.bottomMargin: 0
            font.family: "Courier"
            anchors.left: bearing_status_home_0.left
            horizontalAlignment: Text.AlignHCenter
            font.bold: true
            anchors.bottom: bearing_status_home_0.top
            textFormat: Text.RichText
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.WordWrap
        }

        Text {
            id: bearing_status_home_label_1
            y: 11
            height: bearing_status_home_7.width*0.2
            color: "#ffffff"
            text: qsTr("Roller 1")
            anchors.right: roller_1_settings.left
            anchors.rightMargin: 0
            font.pixelSize: 12 + (12*((parent.height - 640)/640))
            anchors.leftMargin: 0
            fontSizeMode: Text.Fit
            anchors.bottomMargin: 0
            font.family: "Courier"
            anchors.left: bearing_status_home_1.left
            horizontalAlignment: Text.AlignHCenter
            font.bold: true
            anchors.bottom: bearing_status_home_1.top
            textFormat: Text.RichText
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.WordWrap
        }

        Text {
            id: bearing_status_home_label_2
            y: 9
            height: bearing_status_home_7.width*0.2
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
            anchors.right: roller_2_settings.left
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.WordWrap
        }

        Text {
            id: bearing_status_home_label_3
            y: 15
            height: bearing_status_home_7.width*0.2
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
            anchors.right: roller_3_settings.left
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.WordWrap
        }

        Text {
            id: bearing_status_home_label_4
            y: 9
            height: bearing_status_home_7.width*0.2
            color: "#ffffff"
            text: qsTr("Roller 4")
            font.pixelSize: 12 + (12*((parent.height - 640)/640))
            anchors.leftMargin: 0
            fontSizeMode: Text.Fit
            anchors.rightMargin: 0
            anchors.bottomMargin: 0
            font.family: "Courier"
            anchors.left: bearing_status_home_4.left
            horizontalAlignment: Text.AlignHCenter
            font.bold: true
            anchors.bottom: bearing_status_home_4.top
            textFormat: Text.RichText
            anchors.right: roller_4_settings.left
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.WordWrap
        }

        Text {
            id: bearing_status_home_label_5
            y: 9
            height: bearing_status_home_7.width*0.2
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
            anchors.right: roller_5_settings.left
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.WordWrap
        }






        Text {
            id: bearing_status_home_label_6
            y: 9
            height: bearing_status_home_7.width*0.2
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
            anchors.right: roller_6_settings.left
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.WordWrap
        }







        Text {
            id: bearing_status_home_label_7
            y: 2
            width: bearing_status_home_7.width
            height: bearing_status_home_7.width*0.2
            color: "#ffffff"
            text: qsTr("Roller 7")
            font.pixelSize: 12 + (12*((parent.height - 640)/640))
            anchors.right: roller_7_settings.left
            anchors.rightMargin: 0
            anchors.left: bearing_status_home_7.left
            anchors.leftMargin: 0
            fontSizeMode: Text.Fit
            anchors.bottom: bearing_status_home_7.top
            textFormat: Text.RichText
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.bottomMargin: 0
            font.bold: true
            font.family: "Courier"
            wrapMode: Text.WordWrap
        }








        Text {
            id: bearing_status_home_label_8
            y: 10
            height: bearing_status_home_8.width*0.2
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
            anchors.right: roller_8_settings.left
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.WordWrap
        }








        Text {
            id: bearing_status_home_label_9
            y: 17
            height: bearing_status_home_9.width*0.2
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
            anchors.right: roller_9_settings.left
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.WordWrap
        }





        Image {
            id: roller_0_settings
            x: 98
            y: -289
            width: bearing_status_home_label_0.height
            height: bearing_status_home_label_0.height
            anchors.verticalCenter: bearing_status_home_label_0.verticalCenter
            anchors.right: bearing_status_home_0.right
            anchors.rightMargin: 0
            anchors.bottom: bearing_status_home_0.top
            anchors.bottomMargin: 0
            fillMode: Image.PreserveAspectFit
            source: "Images/conversion_setting_button-01.svg"
            mipmap: true

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    conversion_popup.roller_conversion.roller_number = 0
                    conversion_popup.conversion_popup.open()
                }
            }

        }

        Image {
            id: roller_1_settings
            x: 98
            y: -289
            width: bearing_status_home_label_1.height
            height: bearing_status_home_label_1.height
            anchors.verticalCenter: bearing_status_home_label_1.verticalCenter
            anchors.right: bearing_status_home_1.right
            anchors.rightMargin: 0
            anchors.bottom: bearing_status_home_1.top
            anchors.bottomMargin: 0
            fillMode: Image.PreserveAspectFit
            source: "Images/conversion_setting_button-01.svg"
            mipmap: true

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    conversion_popup.roller_conversion.roller_number = 1
                    conversion_popup.conversion_popup.open()
                }
            }

        }

        Image {
            id: roller_2_settings
            x: 98
            y: -289
            width: bearing_status_home_label_2.height
            height: bearing_status_home_label_2.height
            anchors.verticalCenter: bearing_status_home_label_2.verticalCenter
            anchors.right: bearing_status_home_2.right
            anchors.rightMargin: 0
            anchors.bottom: bearing_status_home_2.top
            anchors.bottomMargin: 0
            fillMode: Image.PreserveAspectFit
            source: "Images/conversion_setting_button-01.svg"
            mipmap: true

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    conversion_popup.roller_conversion.roller_number = 2
                    conversion_popup.conversion_popup.open()
                }
            }

        }

        Image {
            id: roller_3_settings
            x: 98
            y: -289
            width: bearing_status_home_label_3.height
            height: bearing_status_home_label_3.height
            anchors.verticalCenter: bearing_status_home_label_3.verticalCenter
            anchors.right: bearing_status_home_3.right
            anchors.rightMargin: 0
            anchors.bottom: bearing_status_home_3.top
            anchors.bottomMargin: 0
            fillMode: Image.PreserveAspectFit
            source: "Images/conversion_setting_button-01.svg"
            mipmap: true

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    conversion_popup.roller_conversion.roller_number = 3
                    conversion_popup.conversion_popup.open()
                }
            }

        }

        Image {
            id: roller_4_settings
            x: 98
            y: -289
            width: bearing_status_home_label_4.height
            height: bearing_status_home_label_4.height
            anchors.verticalCenter: bearing_status_home_label_4.verticalCenter
            anchors.right: bearing_status_home_4.right
            anchors.rightMargin: 0
            anchors.bottom: bearing_status_home_4.top
            anchors.bottomMargin: 0
            fillMode: Image.PreserveAspectFit
            source: "Images/conversion_setting_button-01.svg"
            mipmap: true

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    conversion_popup.roller_conversion.roller_number = 4
                    conversion_popup.conversion_popup.open()
                }
            }

        }

        Image {
            id: roller_5_settings
            x: 98
            y: -289
            width: bearing_status_home_label_5.height
            height: bearing_status_home_label_5.height
            anchors.verticalCenter: bearing_status_home_label_5.verticalCenter
            anchors.right: bearing_status_home_5.right
            anchors.rightMargin: 0
            anchors.bottom: bearing_status_home_5.top
            anchors.bottomMargin: 0
            fillMode: Image.PreserveAspectFit
            source: "Images/conversion_setting_button-01.svg"
            mipmap: true

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    conversion_popup.roller_conversion.roller_number = 5
                    conversion_popup.conversion_popup.open()
                }
            }

        }

        Image {
            id: roller_6_settings
            x: 98
            y: -289
            width: bearing_status_home_label_6.height
            height: bearing_status_home_label_6.height
            anchors.verticalCenter: bearing_status_home_label_6.verticalCenter
            anchors.right: bearing_status_home_6.right
            anchors.rightMargin: 0
            anchors.bottom: bearing_status_home_6.top
            anchors.bottomMargin: 0
            fillMode: Image.PreserveAspectFit
            source: "Images/conversion_setting_button-01.svg"
            mipmap: true

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    conversion_popup.roller_conversion.roller_number = 6
                    conversion_popup.conversion_popup.open()
                }
            }

        }

        Image {
            id: roller_7_settings
            x: 98
            y: -289
            width: bearing_status_home_label_7.height
            height: bearing_status_home_label_7.height
            anchors.verticalCenter: bearing_status_home_label_7.verticalCenter
            anchors.right: bearing_status_home_7.right
            anchors.rightMargin: 0
            anchors.bottom: bearing_status_home_7.top
            anchors.bottomMargin: 0
            fillMode: Image.PreserveAspectFit
            source: "Images/conversion_setting_button-01.svg"
            mipmap: true

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    conversion_popup.roller_conversion.roller_number = 7
                    conversion_popup.conversion_popup.open()
                }
            }

        }

        Image {
            id: roller_8_settings
            x: 98
            y: -289
            width: bearing_status_home_label_8.height
            height: bearing_status_home_label_8.height
            anchors.verticalCenter: bearing_status_home_label_8.verticalCenter
            anchors.right: bearing_status_home_8.right
            anchors.rightMargin: 0
            anchors.bottom: bearing_status_home_8.top
            anchors.bottomMargin: 0
            fillMode: Image.PreserveAspectFit
            source: "Images/conversion_setting_button-01.svg"
            mipmap: true

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    conversion_popup.roller_conversion.roller_number = 8
                    conversion_popup.conversion_popup.open()
                }
            }

        }

        Image {
            id: roller_9_settings
            x: 98
            y: -289
            width: bearing_status_home_label_9.height
            height: bearing_status_home_label_9.height
            anchors.verticalCenter: bearing_status_home_label_9.verticalCenter
            anchors.right: bearing_status_home_9.right
            anchors.rightMargin: 0
            anchors.bottom: bearing_status_home_9.top
            anchors.bottomMargin: 0
            fillMode: Image.PreserveAspectFit
            source: "Images/conversion_setting_button-01.svg"
            mipmap: true

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    conversion_popup.roller_conversion.roller_number = 9
                    conversion_popup.conversion_popup.open()
                }
            }

             Component.onCompleted: conversion_popup

        }

        ConversionTablePopUp {
            property int roller_num: roller_num
            id: conversion_popup
            x: ((parent.width/2) - (width/2))
            y: ((parent.height/2) - (height/2))
            width: parent.width
            height: parent.height *0.80
            roller_number: roller_num
        }

        Text {
            id: home_title
            color: "#ffffff"
            text: qsTr("REI Monitoring Panel")
            font.bold: true
            font.pixelSize: 40 + (40*( (parent.width-640)/640))
            anchors.topMargin: (parent.height - ((5* bearing_status_home_0.width)/2) - (2*(width*0.1)) )/4 + (parent.width*0.0625)-50
            anchors.top: parent.top
            textFormat: Text.RichText
            fontSizeMode: Text.FixedSize
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.bottomMargin: (parent.height - ((5* bearing_status_home_0.width)/2) - (2*(width*0.1)) )/4 + 50
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
            source: "Images/settings.svg"
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
            background: Rectangle {
                implicitWidth: parent.width * 0.5
                implicitHeight: parent.width *0.80
                color: "#00fa00ff"
            }

            Configuration {
                id: configuration
                x: ((parent.width/2) - (width/2))
                y: ((parent.height/2) - (height/2))
                width: configuration_popup.width
                height: configuration_popup.height
                onClose: configuration_popup.close()
            }
        }

        Image {
            id: serial_button
            x: 524
            y: 2
            width: parent.width * 0.0625
            height: width
            anchors.rightMargin: 5
            anchors.top: parent.top
            anchors.topMargin: 5
            mipmap: true

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    serial_configuration_popup.open()
                }
            }
            source: "Images/usb.svg"
            anchors.right: settings.left
            fillMode: Image.PreserveAspectFit
        }

        Popup {
            id: serial_configuration_popup
            x: ((parent.width/2) - (width/2))
            y: ((parent.height/2) - (height/2))
            width: parent.width * 0.5
            height: parent.height *0.80
            modal: true
            focus: true
            closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
            background: Rectangle {
                implicitWidth: parent.width * 0.5
                implicitHeight: parent.width *0.80
                color: "#00fa00ff"
            }

            SerialConfiguration{
                id: serial_configuration
                x: ((parent.width/2) - (width/2))
                y: ((parent.height/2) - (height/2))
                width: serial_configuration_popup.width
                height: serial_configuration_popup.height
                onClose: serial_configuration_popup.close()
            }
        }












    }
}















































































































































/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:4;anchors_y:170}D{i:8;anchors_x:"-6";anchors_y:170}
D{i:10;anchors_x:6;anchors_y:170}D{i:12;anchors_x:1;anchors_y:170}D{i:14;anchors_x:133;anchors_y:170}
D{i:16;anchors_x:"-3";anchors_y:8}D{i:18;anchors_x:0;anchors_y:"-4"}D{i:20;anchors_x:0;anchors_y:2}
D{i:22;anchors_x:"-9"}D{i:23;anchors_x:"-9"}D{i:24;anchors_x:"-9"}D{i:27;anchors_x:"-6"}
D{i:28;anchors_width:96;anchors_x:"-6"}D{i:29;anchors_width:96;anchors_x:"-6"}D{i:30;anchors_width:96;anchors_x:2}
D{i:31;anchors_width:640;anchors_x:"-4"}D{i:33;anchors_width:640}D{i:35;anchors_width:640}
D{i:34;anchors_width:640}
}
 ##^##*/
