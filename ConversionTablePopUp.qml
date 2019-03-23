import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

Item {
    property int roller_number: 0
    property alias conversion_popup: conversion_popup
    property alias roller_conversion: roller_conversion

    Popup {
        id: conversion_popup
        x: ((parent.width/2) - (width/2))
        y: ((parent.height/2) - (height/2))
        width: parent.width
        height: parent.height *0.80
        modal: true
        focus: true
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
        background: Rectangle {
            implicitWidth: parent.width * 0.5
            implicitHeight: parent.width *0.80
            color: "#00fa00ff"
        }

        onOpened: roller_conversion.open()

        ConversionTableBase {
            id: roller_conversion
            x: ((parent.width/2) - (width/2))
            y: ((parent.height/2) - (height/2))
            width: conversion_popup.width
            height: conversion_popup.height
            onClose: conversion_popup.close()
            roller_number: roller_number
        }
    }
}

/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
 ##^##*/
