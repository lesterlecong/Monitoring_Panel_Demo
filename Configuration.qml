import QtQuick 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls 2.5
import QtQuick.LocalStorage 2.12

Item {

    id: root
    width: 512
    height: 384

    signal close()

    Rectangle {
        id: configuration_background
        anchors.fill: parent
        width: parent.width
        height: parent.height
        color: "#2c2a2a"
        border.color: "#2c2a2a"

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
                                                     sample_cycle_time DEC(10,2) DEFAULT 0.00,
                                                     temperature_cycle_time DEC(10,2) DEFAULT 0.00)');



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
                           double_tap_duration_value.currentText = result.rows.item(i).double_tap_duration
                           double_tap_intensity_value.value = result.rows.item(i).double_tap_intensity
                           double_tap_6_scal_value.currentText = result.rows.item(i).double_tap_6_scale
                           sample_cycle_time_value.text = result.rows.item(i).sample_cycle_time
                           temperature_cycle_time_value.text = result.rows.item(i).temperature_cycle_time
                       }
                    }
                )
            } catch(err) {
                console.log("Error accessing database: " + err)
            }
        }

        Component.onCompleted: accessDatabase()

        Text {
            id: configuration_title
            width: configuration_background.width
            height: parent.height * 0.12
            color: "#ffffff"
            text: qsTr("Configuration")
            anchors.topMargin: configuration_background.height*0.01
            font.pixelSize: 40 + (40*((width - 512)/512))
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
            id: belt_system_number_label
            width: configuration_background.width*0.2
            height: configuration_background.height*0.08
            color: "#ffffff"
            text: qsTr("Belt System Number")
            font.bold: true
            font.pixelSize: 10 + (10*((width - 102)/102))
            anchors.topMargin: configuration_background.height*0.09
            anchors.top: configuration_title.bottom
            anchors.leftMargin: configuration_background.width*0.02
            anchors.left: parent.left
            Layout.preferredHeight: 30
            Layout.preferredWidth: 135
            fontSizeMode: Text.Fit
            textFormat: Text.RichText
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.WordWrap
        }

        TextField {
            id: belt_system_number_value
            y: 71.2
            width: configuration_background.width*0.25
            height: belt_system_number_label.height
            text: qsTr("")
            font.pointSize: 8 + (8*((width - 128)/128))
            anchors.verticalCenter: belt_system_number_label.verticalCenter
            anchors.leftMargin: configuration_background.width*0.02
            anchors.left: belt_system_number_label.right
            Layout.preferredHeight: 30
            Layout.preferredWidth: 133
            validator : RegExpValidator { regExp : /[0-9]+/ }
        }

        Text {
            id: double_tap_duration_label
            x: 308.8
            y: 71.2
            width: configuration_background.width*0.2
            height: belt_system_number_label.height
            color: "#ffffff"
            text: qsTr("Double Tap Duration")
            font.bold: true
            font.pixelSize: 10 + (10*((width - 102)/102))
            anchors.rightMargin: configuration_background.width*0.02
            anchors.right: double_tap_duration_value.left
            anchors.verticalCenter: belt_system_number_label.verticalCenter
            Layout.preferredHeight: 30
            Layout.preferredWidth: 135
            verticalAlignment: Text.AlignVCenter
            fontSizeMode: Text.Fit
            textFormat: Text.RichText
            wrapMode: Text.WordWrap
        }

        ComboBox {
            id: double_tap_duration_value
            x: 485.8
            y: 71.2
            width: configuration_background.width*0.25
            height: belt_system_number_label.height
            font.pointSize: 8 + (8*((width - 128)/128))
            anchors.verticalCenter: belt_system_number_label.verticalCenter
            anchors.rightMargin: configuration_background.width*0.02
            anchors.right: parent.right
            Layout.preferredHeight: 30
            Layout.preferredWidth: 140
            textRole: "text"
            editable: false
            currentIndex: 0
            model: ListModel {
                id: double_tap_duration_items
                ListElement{text: "0.25" ; value: 0.25}
                ListElement{text: "0.50" ; value: 0.5}
                ListElement{text: "0.75" ; value: 0.75}
            }
        }

        Text {
            id: belt_line_number_label
            width: configuration_background.width*0.2
            height: belt_system_number_label.height
            color: "#ffffff"
            text: qsTr("Belt Line Number")
            font.bold: true
            font.pixelSize: 10 + (10*((width - 102)/102))
            anchors.topMargin: configuration_background.height*0.032
            anchors.top: belt_system_number_label.bottom
            anchors.leftMargin: configuration_background.width*0.02
            anchors.left: parent.left
            Layout.preferredHeight: 30
            Layout.preferredWidth: 113
            verticalAlignment: Text.AlignVCenter
            fontSizeMode: Text.Fit
            textFormat: Text.RichText
            wrapMode: Text.WordWrap
        }

        TextField {
            id: belt_line_number_value
            y: 141.2
            width: configuration_background.width*0.25
            height: belt_system_number_label.height
            text: qsTr("")
            font.pointSize: 8 + (8*((width - 128)/128))
            anchors.verticalCenter: belt_line_number_label.verticalCenter
            anchors.leftMargin: configuration_background.width*0.02
            anchors.left: belt_line_number_label.right
            Layout.preferredHeight: 30
            Layout.preferredWidth: 133
            validator : RegExpValidator { regExp : /[0-9]+/ }
        }

        Text {
            id: double_tap_intensity_label
            x: 308.8
            y: 141.2
            width: configuration_background.width*0.2
            height: belt_system_number_label.height
            color: "#ffffff"
            text: qsTr("Double Tap Intensity")
            font.bold: true
            font.pixelSize: 10 + (10*((width - 102)/102))
            anchors.rightMargin: configuration_background.width*0.02
            anchors.right: double_tap_intensity_value.left
            anchors.verticalCenter: belt_line_number_label.verticalCenter
            Layout.preferredHeight: 30
            Layout.preferredWidth: 137
            verticalAlignment: Text.AlignVCenter
            fontSizeMode: Text.Fit
            textFormat: Text.RichText
            wrapMode: Text.WordWrap
        }

        SpinBox {
            id: double_tap_intensity_value
            x: 485.8
            y: 141.2
            width: configuration_background.width*0.25
            height: belt_system_number_label.height
            font.pointSize: 8 + (8*((width - 128)/128))
            anchors.verticalCenter: belt_line_number_label.verticalCenter
            anchors.rightMargin: configuration_background.width*0.02
            anchors.right: parent.right
            Layout.preferredHeight: 30
            Layout.preferredWidth: 140
            to: 15
        }

        Text {
            id: row_number_label
            width: configuration_background.width*0.2
            height: belt_system_number_label.height
            color: "#ffffff"
            text: qsTr("Row Number")
            font.bold: true
            font.pixelSize: 10 + (10*((width - 102)/102))
            anchors.topMargin: configuration_background.height*0.032
            anchors.top: belt_line_number_label.bottom
            anchors.leftMargin: configuration_background.width*0.02
            anchors.left: parent.left
            Layout.preferredHeight: 30
            Layout.preferredWidth: 85
            verticalAlignment: Text.AlignVCenter
            fontSizeMode: Text.Fit
            textFormat: Text.RichText
            wrapMode: Text.WordWrap
        }

        TextField {
            id: row_number_value
            y: 212.2
            width: configuration_background.width*0.25
            height: belt_system_number_label.height
            text: qsTr("")
            font.pointSize: 8 + (8*((width - 128)/128))
            anchors.verticalCenter: row_number_label.verticalCenter
            anchors.leftMargin: configuration_background.width*0.02
            anchors.left: row_number_label.right
            Layout.preferredHeight: 30
            Layout.preferredWidth: 133
            validator : RegExpValidator { regExp : /[0-9]+/ }
        }

        Text {
            id: double_tap_6_scale_label
            x: 308.8
            y: 212.2
            width: configuration_background.width*0.2
            height: belt_system_number_label.height
            color: "#ffffff"
            text: qsTr("Double Tap 6 Scale")
            font.bold: true
            font.pixelSize: 10 + (10*((width - 102)/102))
            anchors.rightMargin: configuration_background.width*0.02
            anchors.right: double_tap_6_scal_value.left
            anchors.verticalCenter: row_number_label.verticalCenter
            Layout.preferredHeight: 30
            Layout.preferredWidth: 127
            verticalAlignment: Text.AlignVCenter
            fontSizeMode: Text.Fit
            textFormat: Text.RichText
            wrapMode: Text.WordWrap
        }

        ComboBox {
            id: double_tap_6_scal_value
            x: 485.8
            y: 212.2
            width: configuration_background.width*0.25
            height: belt_system_number_label.height
            font.pointSize: 8 + (8*((width - 128)/128))
            anchors.verticalCenter: row_number_label.verticalCenter
            anchors.rightMargin: configuration_background.width*0.02
            anchors.right: parent.right
            Layout.preferredHeight: 30
            Layout.preferredWidth: 140

            textRole: "text"
            editable: false
            currentIndex: 0
            model: ListModel {
                id: double_tap_6_scale_items
                ListElement{text: "2" ; value: 2}
                ListElement{text: "4" ; value: 4}
                ListElement{text: "8" ; value: 8}
                ListElement{text: "16" ; value: 16}
            }
        }

        Text {
            id: roller_number_label
            width: parent.width*0.2
            height: belt_system_number_label.height
            color: "#ffffff"
            text: qsTr("Roller Number")
            font.bold: true
            font.pixelSize: 10 + (10*((width - 102)/102))
            anchors.topMargin: configuration_background.height*0.032
            anchors.top: row_number_label.bottom
            anchors.leftMargin: configuration_background.width*0.02
            anchors.left: parent.left
            Layout.preferredHeight: 30
            Layout.preferredWidth: 93
            verticalAlignment: Text.AlignVCenter
            fontSizeMode: Text.Fit
            textFormat: Text.RichText
            wrapMode: Text.WordWrap
        }

        TextField {
            id: roller_number_value
            y: 282.2
            width: configuration_background.width*0.25
            height: belt_system_number_label.height
            text: qsTr("")
            font.pointSize: 8 + (8*((width - 128)/128))
            anchors.verticalCenter: roller_number_label.verticalCenter
            anchors.leftMargin: configuration_background.width*0.02
            anchors.left: roller_number_label.right
            Layout.preferredHeight: 30
            Layout.preferredWidth: 133
            validator : RegExpValidator { regExp : /[0-9]+/ }
        }

        Text {
            id: sample_cycle_time_label
            x: 308.8
            y: 282.2
            width: configuration_background.width*0.2
            height: belt_system_number_label.height
            color: "#ffffff"
            text: qsTr("Sample Cycle Time")
            font.bold: true
            font.pixelSize: 10 + (10*((width - 102)/102))
            anchors.rightMargin: configuration_background.width*0.02
            anchors.right: sample_cycle_time_value.left
            anchors.verticalCenter: roller_number_label.verticalCenter
            Layout.preferredHeight: 30
            Layout.preferredWidth: 125
            verticalAlignment: Text.AlignVCenter
            fontSizeMode: Text.Fit
            textFormat: Text.RichText
            wrapMode: Text.WordWrap
        }

        TextField {
            id: sample_cycle_time_value
            x: 485.8
            y: 282.2
            width: configuration_background.width*0.25
            height: belt_system_number_label.height
            text: qsTr("")
            placeholderText: "sec"
            font.pointSize: 8 + (8*((width - 128)/128))
            anchors.verticalCenter: roller_number_label.verticalCenter
            anchors.rightMargin: configuration_background.width*0.02
            anchors.right: parent.right
            Layout.preferredHeight: 30
            Layout.preferredWidth: 140
            validator : RegExpValidator { regExp : /[0-9]+\.[0-9]+/ }
        }

        Text {
            id: temperature_cycle_time_label
            x: 308.8
            width: configuration_background.width*0.2
            height: belt_system_number_label.height
            color: "#ffffff"
            text: qsTr("Temperature Cycle Time")
            font.bold: true
            font.pixelSize: 10 + (10*((width - 102)/102))
            anchors.topMargin: configuration_background.height*0.032
            anchors.top: sample_cycle_time_label.bottom
            anchors.rightMargin: configuration_background.width*0.02
            anchors.right: temperature_cycle_time_value.left
            Layout.preferredHeight: 30
            Layout.preferredWidth: 162
            verticalAlignment: Text.AlignVCenter
            fontSizeMode: Text.Fit
            textFormat: Text.RichText
            wrapMode: Text.WordWrap
        }

        TextField {
            id: temperature_cycle_time_value
            x: 485.8
            y: 353.2
            width: configuration_background.width*0.25
            height: belt_system_number_label.height
            text: qsTr("")
            placeholderText: "sec"
            font.pointSize: 8 + (8*((width - 128)/128))
            anchors.verticalCenter: temperature_cycle_time_label.verticalCenter
            anchors.rightMargin: configuration_background.width*0.02
            anchors.right: parent.right
            Layout.preferredHeight: 30
            Layout.preferredWidth: 140
            validator : RegExpValidator { regExp : /[0-9]+\.[0-9]+/ }
        }

        Button {
            id: configure_button
            x: 150
            y: 410
            width: configuration_background.width*0.3
            height: configuration_background.height*0.12
            text: qsTr("Configure")
            font.pointSize: 10 + (10*((width - 154)/154))
            anchors.horizontalCenterOffset: ((width/2) + (configuration_background.width*0.02))*(-1)
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottomMargin: configuration_background.height*0.032
            anchors.bottom: parent.bottom
            Layout.preferredHeight: 40
            Layout.preferredWidth: 167
            font.bold: true
            onClicked: {
                var db = LocalStorage.openDatabaseSync("ConfigurationDB", "1.0", "Configuration Database", 1000000)
                try {
                    db.transaction(
                       function(tx){
                           tx.executeSql('UPDATE Configuration SET belt_system_number = ?,
                                                                   belt_line_number = ?,
                                                                   row_number = ?,
                                                                   roller_number = ?,
                                                                   double_tap_duration = ?,
                                                                   double_tap_intensity = ?,
                                                                   double_tap_6_scale = ?,
                                                                   sample_cycle_time = ?,
                                                                   temperature_cycle_time = ?',[
                                                                   belt_system_number_value.text,
                                                                   belt_line_number_value.text,
                                             row_number_value.text,
                                             roller_number_value.text,
                                             double_tap_duration_items.get(double_tap_duration_value.currentIndex).text,
                                             double_tap_intensity_value.value,
                                             double_tap_6_scale_items.get(double_tap_duration_value.currentIndex).text,
                                             sample_cycle_time_value.text,
                                             temperature_cycle_time_value.text
                                         ])
                       }
                    )
                }
                catch(err) {
                                console.log("Error accessing database: " + err)
                            }

                root.close()
            }
        }

        Button {
            id: cancel_button
            x: 323
            y: 410
            width: configuration_background.width*0.3
            height: configuration_background.height*0.12
            text: qsTr("Cancel")
            font.pointSize: 10 + (10*((width - 154)/154))
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.horizontalCenterOffset: ((width/2) + (configuration_background.width*0.02))
            anchors.bottomMargin: configuration_background.height*0.032
            anchors.bottom: parent.bottom
            Layout.preferredHeight: 40
            Layout.preferredWidth: 167
            font.bold: true
            onClicked: root.close()
        }
    }

}































































































/*##^## Designer {
    D{i:5;anchors_x:161.8}D{i:4;anchors_x:12.8;anchors_y:71.2}D{i:8;anchors_width:137.6;anchors_x:485.8}
D{i:7;anchors_x:308.8}D{i:14;anchors_x:161.8}D{i:13;anchors_x:12.8;anchors_y:141.2}
D{i:16;anchors_x:308.8}D{i:19;anchors_x:161.8}D{i:18;anchors_x:12.8;anchors_y:212.2}
D{i:21;anchors_x:308.8}D{i:29;anchors_x:161.8}D{i:28;anchors_x:12.8;anchors_y:282.2}
D{i:31;anchors_x:308.8}D{i:34;anchors_y:353.2}
}
 ##^##*/
