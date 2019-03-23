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
    signal open()
    property int roller_number: 0

    onOpen:{
        adc_to_celcius_1.conversion_background.accessDatabase()
        adc_to_celcius_2.conversion_background.accessDatabase()
        adc_to_celcius_3.conversion_background.accessDatabase()
        adc_to_rpm.conversion_background.accessDatabase()
        adc_to_battery_level.conversion_background.accessDatabase()

    }

    Rectangle {
        id: conversion_background
        anchors.fill: parent
        width: parent.width
        height: parent.height
        color: "#39414e"
        radius: width*0.06
        border.color: "#39414e"


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
            text: qsTr("Roller ") + roller_number.toString() + qsTr(" Conversion")
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
            anchors.topMargin: 0
            anchors.top: top_level_design_2.bottom
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0

            ConversionTableView {
                id: adc_to_celcius_1
                conversion_type_title.text: "Roller's ADC to Celcius"
                unit_1_min_label.text: "Min ADC"
                unit_1_max_label.text: "Max ADC"
                unit_2_min_label.text: "Min Celcius"
                unit_2_max_label.text: "Max Celcius"

                unit_1_min_value.validator: RegExpValidator { regExp : /[0-9]+/ }
                unit_1_max_value.validator: RegExpValidator { regExp : /[0-9]+/ }
                unit_2_min_value.validator: RegExpValidator { regExp : /[0-9]+\.[0-9]+/ }
                unit_2_max_value.validator: RegExpValidator { regExp : /[0-9]+\.[0-9]+/ }

                conversion_type_db_name: "roller_" + roller_number.toString() + "_adc_to_celcius_1"
                unit_1_min_type: "INTEGER"
                unit_1_max_type: "INTEGER"
                unit_2_min_type: "DEC(10, 2)"
                unit_2_max_type: "DEC(10, 2)"

                unit_1_min_default_value: 0
                unit_1_max_default_value: 0
                unit_2_min_default_value: 0.00
                unit_2_max_default_value: 0.00

                onClose: {
                    conversion_swipe_view.currentIndex = 0
                    root.close()
                }
            }

            ConversionTableView {
                id: adc_to_celcius_2
                conversion_type_title.text: "IR Bearing's ADC to Celcius"
                unit_1_min_label.text: "Min ADC"
                unit_1_max_label.text: "Max ADC"
                unit_2_min_label.text: "Min Celcius"
                unit_2_max_label.text: "Max Celcius"

                unit_1_min_value.validator: RegExpValidator { regExp : /[0-9]+/ }
                unit_1_max_value.validator: RegExpValidator { regExp : /[0-9]+/ }
                unit_2_min_value.validator: RegExpValidator { regExp : /[0-9]+\.[0-9]+/ }
                unit_2_max_value.validator: RegExpValidator { regExp : /[0-9]+\.[0-9]+/ }

                conversion_type_db_name: "roller_" + roller_number.toString() + "_adc_to_celcius_2"
                unit_1_min_type: "INTEGER"
                unit_1_max_type: "INTEGER"
                unit_2_min_type: "DEC(10, 2)"
                unit_2_max_type: "DEC(10, 2)"

                unit_1_min_default_value: 0
                unit_1_max_default_value: 0
                unit_2_min_default_value: 0.00
                unit_2_max_default_value: 0.00

                onClose: {
                    conversion_swipe_view.currentIndex = 0
                    root.close()
                }
            }

            ConversionTableView {
                id: adc_to_celcius_3
                conversion_type_title.text: "IR Therm's ADC to Celcius"
                unit_1_min_label.text: "Min ADC"
                unit_1_max_label.text: "Max ADC"
                unit_2_min_label.text: "Min Celcius"
                unit_2_max_label.text: "Max Celcius"

                unit_1_min_value.validator: RegExpValidator { regExp : /[0-9]+/ }
                unit_1_max_value.validator: RegExpValidator { regExp : /[0-9]+/ }
                unit_2_min_value.validator: RegExpValidator { regExp : /[0-9]+\.[0-9]+/ }
                unit_2_max_value.validator: RegExpValidator { regExp : /[0-9]+\.[0-9]+/ }

                conversion_type_db_name: "roller_" + roller_number.toString() + "_adc_to_celcius_3"
                unit_1_min_type: "INTEGER"
                unit_1_max_type: "INTEGER"
                unit_2_min_type: "DEC(10, 2)"
                unit_2_max_type: "DEC(10, 2)"

                unit_1_min_default_value: 0
                unit_1_max_default_value: 0
                unit_2_min_default_value: 0.00
                unit_2_max_default_value: 0.00

                onClose: {
                    conversion_swipe_view.currentIndex = 0
                    root.close()
                }
            }

            ConversionTableView {
                id: adc_to_rpm
                conversion_type_title.text: "ADC to RPM"
                unit_1_min_label.text: "Min ADC"
                unit_1_max_label.text: "Max ADC"
                unit_2_min_label.text: "Min RPM"
                unit_2_max_label.text: "Max RPM"

                unit_1_min_value.validator: RegExpValidator { regExp : /[0-9]+/ }
                unit_1_max_value.validator: RegExpValidator { regExp : /[0-9]+/ }
                unit_2_min_value.validator: RegExpValidator { regExp : /[0-9]+/ }
                unit_2_max_value.validator: RegExpValidator { regExp : /[0-9]+/ }

                conversion_type_db_name: "roller_" + roller_number.toString() + "_adc_to_rpm_1"
                unit_1_min_type: "INTEGER"
                unit_1_max_type: "INTEGER"
                unit_2_min_type: "INTEGER"
                unit_2_max_type: "INTEGER"

                unit_1_min_default_value: 0
                unit_1_max_default_value: 0
                unit_2_min_default_value: 0
                unit_2_max_default_value: 0

                onClose: {
                    conversion_swipe_view.currentIndex = 0
                    root.close()
                }
            }

            ConversionTableView {
                id: adc_to_battery_level
                conversion_type_title.text: "ADC to Battery Level"
                unit_1_min_label.text: "Min ADC"
                unit_1_max_label.text: "Max ADC"
                unit_2_min_label.text: "Min % Level"
                unit_2_max_label.text: "Max % Level"

                unit_1_min_value.validator: RegExpValidator { regExp : /[0-9]+/ }
                unit_1_max_value.validator: RegExpValidator { regExp : /[0-9]+/ }
                unit_2_min_value.validator: RegExpValidator { regExp : /[0-9]+/ }
                unit_2_max_value.validator: RegExpValidator { regExp : /[0-9]+/ }

                conversion_type_db_name: "roller_" + roller_number.toString() + "_adc_to_batter_level"
                unit_1_min_type: "INTEGER"
                unit_1_max_type: "INTEGER"
                unit_2_min_type: "INTEGER"
                unit_2_max_type: "INTEGER"

                unit_1_min_default_value: 0
                unit_1_max_default_value: 0
                unit_2_min_default_value: 0
                unit_2_max_default_value: 0

                onClose: {
                    conversion_swipe_view.currentIndex = 0
                    root.close()
                }
            }


        }








    }

}
















































































































































