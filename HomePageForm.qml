import QtQuick 2.0
import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4
import QtCharts 2.3

Page {
    id: page
    Rectangle {
        id: rectangle
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
                    swipeView.currentIndex++
                }
            }
        }


        Text {
            id: bearing_status_home_label_0
            y: 3
            height: bearing_status_home_7.width*0.1
            color: "#ffffff"
            text: qsTr("Bearing 0")
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
            text: qsTr("Bearing 1")
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
            text: qsTr("Bearing 2")
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
            text: qsTr("Bearing 3")
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
            text: qsTr("Bearing 4")
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
            text: qsTr("Bearing 5")
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
            text: qsTr("Bearing 6")
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
            text: qsTr("Bearing 7")
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
            text: qsTr("Bearing 8")
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
            text: qsTr("Bearing 9")
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
            text: qsTr("REIG Monitoring Panel")
            font.bold: true
            font.pixelSize: 50 + (50*( (parent.width-640)/640))
            anchors.topMargin: (parent.height - ((5* bearing_status_home_0.width)/2) - (2*(width*0.1)) )/4
            anchors.top: parent.top
            textFormat: Text.RichText
            fontSizeMode: Text.FixedSize
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.bottomMargin: (parent.height - ((5* bearing_status_home_0.width)/2) - (2*(width*0.1)) )/4
            anchors.bottom: bearing_status_home_label_2.top
            wrapMode: Text.WordWrap
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
        }



    }
}

































/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:4;anchors_y:170}D{i:8;anchors_x:"-6";anchors_y:170}
D{i:10;anchors_x:6;anchors_y:170}D{i:12;anchors_x:1;anchors_y:170}D{i:14;anchors_x:133;anchors_y:170}
D{i:16;anchors_x:"-3";anchors_y:8}D{i:18;anchors_x:0;anchors_y:"-4"}D{i:20;anchors_x:0;anchors_y:2}
D{i:22;anchors_x:-9}D{i:27;anchors_x:-6}D{i:28;anchors_width:96;anchors_x:2}D{i:29;anchors_width:640;anchors_x:-4}
D{i:32;anchors_width:640}
}
 ##^##*/
