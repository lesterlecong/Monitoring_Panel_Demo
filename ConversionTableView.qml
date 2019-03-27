import QtQuick 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls 2.5
import QtQuick.LocalStorage 2.12
import QtQuick.Dialogs 1.1
import "ConversionTableUtils.js" as ConversionTableUtils
import "ConversionTableDBHandler.js" as ConversionTableDBHandler
import "ConversionTableHandler.js" as CTHTest
Item {

    id: root
    width: 502
    height: 316
    property alias conversion_background: conversion_background
    property alias unit_1_min_value: unit_1_min_value
    property alias unit_2_max_value: unit_2_max_value
    property alias unit_2_min_value: unit_2_min_value
    property alias unit_1_max_value: unit_1_max_value
    property alias unit_2_max_label: unit_2_max_label
    property alias unit_2_min_label: unit_2_min_label
    property alias unit_1_max_label: unit_1_max_label
    property alias unit_1_min_label: unit_1_min_label
    property alias conversion_type_title: conversion_type_title

    property string conversion_type_db_name: "Default_Name"
    property string unit_1_min_type: "INTEGER"  //INTEGER or DEC(10, 2)
    property string unit_1_max_type: "INTEGER"  //INTEGER or DEC(10, 2)
    property string unit_2_min_type: "DEC(10, 2)"  //INTEGER or DEC(10, 2)
    property string unit_2_max_type: "DEC(10, 2)"  //INTEGER or DEC(10, 2)
    property real unit_1_min_default_value: 0
    property real unit_1_max_default_value: 0
    property real unit_2_min_default_value: 0.00
    property real unit_2_max_default_value: 0.00

    signal close()


    MessageDialog {
        id: warningExitMessage
        title: "Double check unsaved changes"
        text: "Please double check if you have unsaved changes before leaving this page! Proceed to exit?"
        icon: StandardIcon.Warning
        standardButtons: StandardButton.Yes | StandardButton.Cancel

        Component.onCompleted: visible = false
        onYes: root.close()
        onRejected: warningExitMessage.close()

    }

    Rectangle {
        id: conversion_background
        anchors.fill: parent
        width: parent.width
        height: parent.height
        color: "#39414e"
        radius: 0
        border.color: "#39414e"

        function accessDatabase() {
            ConversionTableDBHandler.initDB()
            ConversionTableDBHandler.setTableName(conversion_type_db_name)
            ConversionTableDBHandler.setDefaultValue(unit_1_min_default_value,
                                                     unit_1_max_default_value,
                                                     unit_2_min_default_value,
                                                     unit_2_max_default_value)
            ConversionTableDBHandler.setDefaultType("INTEGER", "INTEGER", "DEC(10,2)", "DEC(10,2)")
            ConversionTableDBHandler.startDB()

            var result = ConversionTableDBHandler.readAll()
            for(var i = 0; i < result.rows.length; i++) {
                console.log("unit 1 min value:" + result.rows.item(i).unit_1_min)
                console.log("unit 1 max value:" + result.rows.item(i).unit_1_max)
                console.log("unit 2 min value:" + result.rows.item(i).unit_2_min)
                console.log("unit 2 max value:" + result.rows.item(i).unit_2_max)

                console.log("slope:" + result.rows.item(i).slope)
                console.log("intercept:" + result.rows.item(i).intercept)

                unit_1_min_value.text = result.rows.item(i).unit_1_min
                unit_1_max_value.text = result.rows.item(i).unit_1_max
                unit_2_min_value.text = result.rows.item(i).unit_2_min
                unit_2_max_value.text = result.rows.item(i).unit_2_max
            }



        }

        Component.onCompleted: accessDatabase()

        Rectangle {
            id: top_level_design
            width: parent.width
            height: parent.height*0.25
            color: "#15a775"
            radius: conversion_background.radius
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0
            border.color: "#15a775"
        }




        Text {
            id: conversion_type_title
            width: parent.width
            height: parent.height * 0.25
            color: "#ffffff"
            text: qsTr("ADC to Celcius")
            anchors.topMargin: 0
            font.pixelSize: height*0.5
            font.bold: true
            fontSizeMode: Text.Fit
            textFormat: Text.RichText
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.WordWrap
        }


        Text {
            id: unit_1_min_label
            width: conversion_background.width*0.15
            height: conversion_background.height*0.15
            color: "#ffffff"
            text: "Min ADC"
            anchors.leftMargin: conversion_background.width*0.02
            anchors.topMargin: conversion_background.height*0.05
            font.bold: true
            font.pixelSize: height*0.30
            anchors.top: top_level_design.bottom
            anchors.left: parent.left
            Layout.preferredHeight: 30
            Layout.preferredWidth: 135
            fontSizeMode: Text.Fit
            textFormat: Text.RichText
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.WordWrap
        }

        Text {
            id: unit_1_max_label
            x: 1
            y: 0
            width: unit_1_min_label.width
            height: unit_1_min_label.height
            color: "#ffffff"
            text: "Max ADC"
            anchors.rightMargin: conversion_background.width*0.02
            anchors.right: unit_1_max_value.left
            anchors.verticalCenter: unit_1_min_label.verticalCenter
            fontSizeMode: Text.Fit
            verticalAlignment: Text.AlignVCenter
            Layout.preferredHeight: 30
            textFormat: Text.RichText
            Layout.preferredWidth: 135
            font.bold: true
            wrapMode: Text.WordWrap
            font.pixelSize: height*0.30
        }

        Text {
            id: unit_2_min_label
            x: -5
            y: 1
            width: unit_1_min_label.width
            height: unit_1_min_label.height
            color: "#ffffff"
            text: "Min Celcius"
            anchors.leftMargin: 0
            anchors.topMargin: conversion_background.height*0.05
            fontSizeMode: Text.Fit
            verticalAlignment: Text.AlignVCenter
            Layout.preferredHeight: 30
            textFormat: Text.RichText
            Layout.preferredWidth: 135
            font.bold: true
            wrapMode: Text.WordWrap
            anchors.left: unit_1_min_label.left
            anchors.top: unit_1_min_label.bottom
            font.pixelSize: height*0.30
        }

        Text {
            id: unit_2_max_label
            x: -4
            y: -1
            width: unit_1_min_label.width
            height: unit_1_min_label.height
            color: "#ffffff"
            text: "Max Celcius"
            anchors.rightMargin: conversion_background.width*0.02
            anchors.right: unit_2_max_value.left
            anchors.verticalCenter: unit_2_max_value.verticalCenter
            fontSizeMode: Text.Fit
            verticalAlignment: Text.AlignVCenter
            Layout.preferredHeight: 30
            textFormat: Text.RichText
            Layout.preferredWidth: 135
            font.bold: true
            wrapMode: Text.WordWrap
            font.pixelSize: height*0.30
        }

        TextField {
            id: unit_1_min_value
            y: 71.2
            width: conversion_background.width*0.25
            height: unit_1_min_label.height
            text: qsTr("")
            anchors.leftMargin: conversion_background.width*0.02
            font.pointSize: height*0.30
            anchors.verticalCenter: unit_1_min_label.verticalCenter
            anchors.left: unit_1_min_label.right
            Layout.preferredHeight: 30
            Layout.preferredWidth: 133
            validator : RegExpValidator { regExp : /[0-9]+\.[0-9]+/ }

        }

        TextField {
            id: unit_1_max_value
            x: 121
            y: 94
            width: unit_1_min_value.width
            height: unit_1_min_label.height
            text: qsTr("")
            anchors.rightMargin: conversion_background.width*0.02
            anchors.right: parent.right
            anchors.verticalCenterOffset: 1
            Layout.preferredHeight: 30
            validator: RegExpValidator {
                regExp: /[0-9]+/
            }
            anchors.verticalCenter: unit_1_min_label.verticalCenter
            font.pointSize: height*0.30
            Layout.preferredWidth: 133
        }

        TextField {
            id: unit_2_min_value
            x: 116
            y: 166
            width: unit_1_min_value.width
            height: unit_1_min_label.height
            text: qsTr("")
            anchors.leftMargin: conversion_background.width*0.02
            anchors.verticalCenterOffset: 0
            Layout.preferredHeight: 30
            anchors.left: unit_1_min_label.right
            validator: RegExpValidator {
                regExp: /[0-9]+/
            }
            anchors.verticalCenter: unit_2_min_label.verticalCenter
            font.pointSize: height*0.30
            Layout.preferredWidth: 133
        }

        TextField {
            id: unit_2_max_value
            x: 102
            y: 222
            width: unit_1_min_value.width
            height: unit_1_min_label.height
            text: qsTr("")
            anchors.rightMargin: parent.width*0.02
            anchors.right: parent.right
            anchors.verticalCenterOffset: 0
            Layout.preferredHeight: 30
            validator: RegExpValidator {
                regExp: /[0-9]+/
            }
            anchors.verticalCenter: unit_2_min_label.verticalCenter
            font.pointSize: height*0.30
            Layout.preferredWidth: 133
        }

        Button {
            id: save_button
            y: 242
            width: conversion_background.width*0.3
            height: conversion_background.height*0.2
            text: qsTr("Save")
            anchors.bottomMargin: conversion_background.height*0.02
            anchors.bottom: parent.bottom
            anchors.horizontalCenterOffset: ((width/2) + (conversion_background.width*0.05))*(-1)
            anchors.horizontalCenter: parent.horizontalCenter
            font.family: "Courier"
            font.bold: true
            font.pointSize: height*0.30

            contentItem: Text {
                text: save_button.text
                font.bold: save_button.font.bold
                font.pointSize: save_button.font.pointSize
                opacity: enabled? 1.0:0.3
                color: "#ffffff"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }

            background: Rectangle {
                id: save_button_background
                color: "#59c8d9"
                radius: width*0.05
            }

            onClicked: function() {

                var slope = ConversionTableUtils.slope(unit_1_min_value.text, unit_2_min_value.text, unit_1_max_value.text, unit_2_max_value.text)
                var intercept = ConversionTableUtils.intercept(unit_2_min_value.text, unit_2_max_value.text, slope)

                ConversionTableDBHandler.setTableName(conversion_type_db_name)
                ConversionTableDBHandler.update(unit_1_min_value.text,
                                                unit_1_max_value.text,
                                                unit_2_min_value.text,
                                                unit_2_max_value.text,
                                                slope,
                                                intercept)

            }


        }

        Button {
            id: cancel_button
            x: -5
            y: 244
            width: conversion_background.width*0.3
            height: conversion_background.height*0.2
            text: qsTr("Cancel")
            background: Rectangle {
                id: cancel_button_background1
                color: "#e74c3c"
                radius: width*0.05
            }
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            contentItem: Text {
                color: "#ffffff"
                text: cancel_button.text
                verticalAlignment: Text.AlignVCenter
                font.bold: cancel_button.font.bold
                opacity: enabled? 1.0:0.3
                horizontalAlignment: Text.AlignHCenter
                font.pointSize: cancel_button.font.pointSize
            }
            font.bold: true
            anchors.bottomMargin: conversion_background.height*0.02
            anchors.horizontalCenterOffset: ((width/2) + (conversion_background.width*0.05))
            font.pointSize: height*0.30
            font.family: "Courier"

            onClicked: function() {
                warningExitMessage.open()

            }
        }

    }

}
















































































































































