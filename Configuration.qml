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

    MessageDialog {
        id: informationMessage
        title: ""
        text: "Strike the roller twice hard in the middle of the drum with in a 1/4 second."
        icon: StandardIcon.Information
        standardButtons: StandardButton.Ok

        Component.onCompleted: visible = false


    }

    Rectangle {
        id: configuration_background
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

        Component.onCompleted: accessDatabase()

        Rectangle {
            id: top_level_design
            width: parent.width
            height: parent.height*0.15
            color: "#5ad9a4"
            radius: configuration_background.radius
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
            id: configuration_title
            width: configuration_background.width
            height: parent.height * 0.12
            color: "#ffffff"
            text: qsTr("Configuration")
            anchors.topMargin: configuration_background.height*0.01
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
            id: belt_system_number_label
            width: configuration_background.width*0.2
            height: configuration_background.height*0.08
            color: "#ffffff"
            text: qsTr("Belt System Number")
            font.bold: true
            font.pixelSize: height*0.30
            anchors.topMargin: configuration_background.height*0.065
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
            font.pointSize: height*0.30
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
            font.pixelSize: height*0.30
            minimumPixelSize: 6
            font.bold: true
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
            font.bold: true
            font.pointSize: height*0.30
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
                ListElement{text: "0.5" ; value: 0.5}
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
            font.pixelSize: height*0.30
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
            font.pointSize: height*0.30
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
            font.pixelSize: height*0.30
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
            font.bold: true
            font.pointSize: height*0.30
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
            font.pixelSize: height*0.30
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
            font.pointSize: height*0.30
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
            font.pixelSize: height*0.30
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
            font.bold: true
            font.pointSize: height*0.30
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
            font.pixelSize: height*0.30
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
            anchors.leftMargin: configuration_background.width*0.02
            font.pointSize: height*0.30
            anchors.verticalCenter: roller_number_label.verticalCenter
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
            text: "Sample Cycle Time (seconds)"
            font.bold: true
            font.pixelSize: height*0.30
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
            font.bold: true
            placeholderText: "sec"
            font.pointSize: height*0.30
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
            text: "Temperature Cycle Time (seconds)"
            font.bold: true
            font.pixelSize: height*0.30
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
            font.bold: true
            placeholderText: "sec"
            font.pointSize: height*0.30
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
            width: configuration_background.width
            height: configuration_background.height*0.12
            text: qsTr("Configure")
            anchors.bottomMargin: parent.height*0.01
            anchors.horizontalCenterOffset: 0
            font.pointSize: height*0.30
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: cancel_button_background_top.top
            Layout.preferredHeight: 40
            Layout.preferredWidth: 167
            font.bold: true

            contentItem: Text {
                text: configure_button.text
                font.bold: configure_button.font.bold
                font.pointSize: configure_button.font.pointSize
                opacity: enabled? 1.0:0.3
                color: "#ffffff"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }

            background: Rectangle {
                id: configure_button_background
                color: "#59c8d9"
                radius: 0
            }

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

                informationMessage.open()

                root.close()
            }
        }


        Rectangle {
            id: cancel_button_background_top
            width: parent.width
            height: cancel_button.height/2
            color: "#e74c3c"
            anchors.top: cancel_button.top
            anchors.topMargin: 0
        }


        Button {
            id: cancel_button
            x: 323
            y: 410
            width: configuration_background.width
            height: configuration_background.height*0.12
            text: qsTr("Cancel")
            anchors.bottomMargin: 0
            anchors.horizontalCenterOffset: 0
            font.pointSize: height*0.30
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            Layout.preferredHeight: 40
            Layout.preferredWidth: 167
            font.bold: true
            onClicked: root.close()

            contentItem: Text {
                text: cancel_button.text
                font.bold: cancel_button.font.bold
                font.pointSize: cancel_button.font.pointSize
                opacity: enabled? 1.0:0.3
                color: "#ffffff"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }

            background: Rectangle {
                id: cancel_button_background
                color: "#e74c3c"
                radius: configuration_background.radius
            }
        }



    }

}












































































































































