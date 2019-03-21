import QtQuick 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls 2.5
import QtQuick.LocalStorage 2.12
import QtQuick.Dialogs 1.1

Item {

    id: root
    width: 512
    height: 420

    signal close()


    Rectangle {
        id: conversion_background
        anchors.fill: parent
        width: parent.width
        height: parent.height
        color: "#39414e"
        radius: width*0.06
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
            color: "#5ad9a4"
            radius: conversion_background.radius
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

        Text {
            id: conversion_title
            width: conversion_background.width
            height: parent.height * 0.12
            color: "#ffffff"
            text: qsTr("Conversion")
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

        SwipeView {
            id: conversion_swipe_view
            anchors.bottomMargin: 5+conversion_background.radius
            anchors.bottom: parent.bottom
            anchors.topMargin: 5
            anchors.top: top_level_design_2.bottom
            anchors.right: parent.right
            anchors.rightMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 5
        }








    }

}















































































































































/*##^## Designer {
    D{i:5;anchors_height:200;anchors_width:200;anchors_x:8;anchors_y:76}
}
 ##^##*/
