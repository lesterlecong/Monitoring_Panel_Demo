import QtQuick 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls 2.5
import QtQuick.LocalStorage 2.12
import QtQuick.Dialogs 1.1

Item {

    id: root
    width: 502
    height: 316
    property alias unit_2_max_label: unit_2_max_label
    property alias unit_2_min_label: unit_2_min_label
    property alias unit_1_max_label: unit_1_max_label
    property alias unit_1_min_label: unit_1_min_label
    property alias conversion_type_title: conversion_type_title

    signal close()


    Rectangle {
        id: conversion_background
        anchors.fill: parent
        width: parent.width
        height: parent.height
        color: "#39414e"
        radius: 0
        border.color: "#39414e"

        function accessDatabase() {
            console.log("Access Database....")
            var db = LocalStorage.openDatabaseSync("ConfigurationDB", "1.0", "Configuration Database", 1000000)
            try {
                db.transaction(
                   function(tx){
                        tx.executeSql('CREATE TABLE IF NOT EXISTS
                                       Configuration(belt_system_number INTEGER DEFAULT 0,
                                                     belt_line_number INTEGER DEFAULT 0,
                                                     row_number INTEGER DEFAULT 0,
                                                     roller_number INTEGER DEFAULT 0,
                                                     double_tap_duration DEC(10,2) DEFAULT 0.25,
                                                     double_tap_intensity INTEGER DEFAULT 0,
                                                     double_tap_6_scale INTEGER DEFAULT 2,
                                                     sample_cycle_time DEC(10,2) DEFAULT 60.00,
                                                     temperature_cycle_time DEC(10,2) DEFAULT 30.00)');

                       var check_count = tx.executeSql('SELECT * FROM Configuration')
                       if(check_count.rows.length === 0) {
                            tx.executeSql('INSERT INTO Configuration VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)',
                                                                          [ 0, 0, 0, 0, 0.25, 0, 2, 60.00, 30.00 ]);
                       }


                       var result = tx.executeSql('SELECT * FROM Configuration')



                       for(var i = 0; i < result.rows.length; i++) {
                           console.log("Belt System Number:" + result.rows.item(i).belt_system_number)
                           console.log("Belt Line Number:" + result.rows.item(i).belt_line_number)
                           console.log("Row Number:" + result.rows.item(i).row_number)
                           console.log("Roller Number:" + result.rows.item(i).roller_number)
                           console.log("Double Tap Duration:" + result.rows.item(i).double_tap_duration)
                           console.log("Double Tap Intensity:" + result.rows.item(i).double_tap_intensity)
                           console.log("Double Tap 6 Scale:" + result.rows.item(i).double_tap_6_scale)
                           console.log("Sample Cycle Time:" + result.rows.item(i).sample_cycle_time)
                           console.log("Temperature Cycle Time:" + result.rows.item(i).temperature_cycle_time)

                           belt_system_number_value.text = result.rows.item(i).belt_system_number
                           belt_line_number_value.text = result.rows.item(i).belt_line_number
                           row_number_value.text = result.rows.item(i).row_number
                           roller_number_value.text = result.rows.item(i).roller_number

                           double_tap_duration_value.currentIndex = double_tap_duration_value.find(result.rows.item(i).double_tap_duration)

                           double_tap_intensity_value.value = result.rows.item(i).double_tap_intensity

                           double_tap_6_scal_value.currentIndex = double_tap_6_scal_value.find(result.rows.item(i).double_tap_6_scale)

                           sample_cycle_time_value.text = result.rows.item(i).sample_cycle_time
                           temperature_cycle_time_value.text = result.rows.item(i).temperature_cycle_time
                       }
                    }
                )
            } catch(err) {
                console.log("Error accessing database: " + err)
            }
        }

        //Component.onCompleted: accessDatabase()

        Rectangle {
            id: top_level_design
            width: parent.width
            height: parent.height*0.15
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
            width: conversion_background.width
            height: parent.height * 0.12
            color: "#ffffff"
            text: qsTr("ADC to Celcius")
            anchors.topMargin: conversion_background.height*0.01
            font.pixelSize: height*0.8
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
            width: conversion_background.width*0.2
            height: conversion_background.height*0.08
            color: "#ffffff"
            text: "Min ADC"
            anchors.leftMargin: 5
            anchors.topMargin: 5
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
            width: conversion_background.width*0.2
            height: conversion_background.height*0.08
            color: "#ffffff"
            text: "Max ADC"
            anchors.leftMargin: 5
            fontSizeMode: Text.Fit
            verticalAlignment: Text.AlignVCenter
            Layout.preferredHeight: 30
            textFormat: Text.RichText
            Layout.preferredWidth: 135
            font.bold: true
            wrapMode: Text.WordWrap
            anchors.left: parent.left
            anchors.topMargin: 5
            anchors.top: unit_1_min_label.bottom
            font.pixelSize: height*0.30
        }

        Text {
            id: unit_2_min_label
            x: -5
            y: 1
            width: conversion_background.width*0.2
            height: conversion_background.height*0.08
            color: "#ffffff"
            text: "Min Celcius"
            anchors.leftMargin: 5
            fontSizeMode: Text.Fit
            verticalAlignment: Text.AlignVCenter
            Layout.preferredHeight: 30
            textFormat: Text.RichText
            Layout.preferredWidth: 135
            font.bold: true
            wrapMode: Text.WordWrap
            anchors.left: parent.left
            anchors.topMargin: 5
            anchors.top: unit_1_max_label.bottom
            font.pixelSize: height*0.30
        }

        Text {
            id: unit_2_max_label
            x: -4
            y: -1
            width: conversion_background.width*0.2
            height: conversion_background.height*0.08
            color: "#ffffff"
            text: "Max Celcius"
            anchors.leftMargin: 5
            fontSizeMode: Text.Fit
            verticalAlignment: Text.AlignVCenter
            Layout.preferredHeight: 30
            textFormat: Text.RichText
            Layout.preferredWidth: 135
            font.bold: true
            wrapMode: Text.WordWrap
            anchors.left: parent.left
            anchors.topMargin: 5
            anchors.top: unit_2_min_label.bottom
            font.pixelSize: height*0.30
        }

        TextField {
            id: belt_system_number_value
            y: 71.2
            width: conversion_background.width*0.25
            height: unit_1_min_label.height
            text: qsTr("")
            anchors.leftMargin: 10
            font.pointSize: height*0.30
            anchors.verticalCenter: unit_1_min_label.verticalCenter
            anchors.left: unit_1_min_label.right
            Layout.preferredHeight: 30
            Layout.preferredWidth: 133
            validator : RegExpValidator { regExp : /[0-9]+/ }
        }



    }

}
















































































































































