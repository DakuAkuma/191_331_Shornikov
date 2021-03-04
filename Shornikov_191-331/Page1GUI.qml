import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import QtQuick.Controls.Styles 1.4

Page { // Lab No.1. GUI elements.
    // Page ID.
    id: page1GUI
    // Page backgroung.
    background: Rectangle {
        anchors.fill: parent
        color: "#fdfdfd"
    }

    // Haeder
    header: ToolBar {
        // Header`s background color.
        background: Rectangle {
            id: bg
            anchors.fill: parent
            color: "green"
        }
        // Header`s title
        Label {
            id: headText
            color: "#7734ad"
            text: "<font color=\"white\">Lab No. 1. GUI elements.</font>"
            font.pixelSize: Qt.application.font.pixelSize * 1.5
            anchors.verticalCenter: parent.verticalCenter
            // Header`s figures.
            Rectangle {
                id: circ1
                width: Qt.application.font.pixelSize*1.5
                height: width
                radius: width/2
                color: "white"
                anchors.left: headText.right
                anchors.verticalCenter: parent.verticalCenter
                anchors.leftMargin: defMargin
            }
            Rectangle {
                id: circ2
                width: Qt.application.font.pixelSize*1.5
                height: width
                radius: width/2
                color: "white"
                anchors.left: circ1.right
                anchors.verticalCenter: parent.verticalCenter
                anchors.leftMargin: defMargin
            }
            Rectangle {
                width: Qt.application.font.pixelSize*1.5
                height: width
                radius: width/2
                color: "indigo"
                anchors.left: circ2.right
                anchors.verticalCenter: parent.verticalCenter
                anchors.leftMargin: defMargin
            }
        }
    }
    // Just a notice.
    /*
            Label {
                color: "black"
                text: qsTr("There will be Lab No.1 soon.")
                anchors.centerIn: parent
            }
            */
    // All GUI elements represented as a table. Main content.
    GridLayout {
        id: grid
        // Set fill and some margins
        anchors.fill: parent
        anchors.margins: defMargin
        rowSpacing: defMargin
        columnSpacing: defMargin
        // Custom Dial style (custom handle and background).
        Dial{
            Layout.row: 0
            Layout.column: 0
            Layout.maximumWidth: 250
            Layout.alignment: Qt.AlignCenter
            from: 0
            to: 100
            stepSize: 1
            id: controlDial
            background: Rectangle {
                anchors.centerIn: controlDial
                x: controlDial.width / 2 - width / 2
                y: controlDial.height / 2 - height / 2
                width: 120
                height: width
                color: "transparent"
                radius: width / 2
                border.color: "brown"
                opacity: controlDial.enabled ? 1 : 0.3
            }
            // Custom handle
            handle: Rectangle {
                id: dialHandle
                x: controlDial.background.x + controlDial.background.width / 2 - width / 2
                y: controlDial.background.y + controlDial.background.height / 2 - height / 2
                width: 14
                height: width
                color: "indigo"
                radius: width / 2
                antialiasing: true
                opacity: controlDial.enabled ? 1 : 0.3
                transform: [
                    Translate {
                        y: -Math.min(controlDial.background.width, controlDial.background.height) * 0.4 + dialHandle.height / 2
                    },
                    Rotation {
                        angle: controlDial.angle
                        origin.x: dialHandle.width / 2
                        origin.y: dialHandle.height / 2
                    }
                ]
            }
        }
        // Custom RangeSlider style (custom slide line),
        RangeSlider{
            id: range
            first.value: 1
            second.value: 100
            background: Rectangle {
                x: range.leftPadding
                y: range.topPadding + range.availableHeight / 2 - height / 2
                implicitWidth: 200
                implicitHeight: 4
                width: range.availableWidth
                height: implicitHeight
                radius: 2
                color: "#931124"
                // Making of a custom slide
                Rectangle {
                    x: range.first.visualPosition * parent.width
                    width: range.second.visualPosition * parent.width - x
                    height: parent.height
                    color: "#21be2b"
                    radius: 2
                }
            }
            from: 1
            to: 100
            Layout.row: 1
            Layout.column: 0
            Layout.maximumWidth: 300
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignCenter
        }
        // Custom CheckBox
        CheckBox{
            id: checkBox
            text: checkBox.checked ? qsTr("Вы с нами?") : qsTr("А ну верни")
            checked: true
            // Custom indicator (shows checked box or not)
            indicator: Rectangle {
                implicitWidth: 26
                implicitHeight: 26
                x: checkBox.leftPadding
                y: parent.height / 2 - height / 2
                radius: 3
                border.color: checkBox.checked ? "#3eb489" : "red"
                Rectangle {
                    width: 14
                    height: 14
                    x: 6
                    y: 6
                    radius: 2
                    color: checkBox.checked ? "darkgreen" : "red"
                    visible: checkBox.checked
                }
            }
            // Custom text
            contentItem: Text {
                text: checkBox.text
                font: checkBox.font
                opacity: enabled ? 1.0 : 0.3
                color: checkBox.checked ? "#3eb489" : "red"
                verticalAlignment: Text.AlignVCenter
                leftPadding: checkBox.indicator.width + checkBox.spacing
            }
            Layout.row: 2
            Layout.column: 0
            Layout.alignment: Qt.AlignCenter
        }
        // Custom TextArea integrated into ScrollView for more comfortable work.
        ScrollView {
            id: view
            // Streamline the text
            clip: true
            // Turn on interactive showing of scroll bars.
            ScrollBar.horizontal.interactive: true
            ScrollBar.vertical.interactive: true
            Layout.row: 0
            Layout.column: 1
            // Let the text area take 250 px in width and 100 px in height.
            Layout.fillWidth: true
            Layout.maximumWidth: 250
            Layout.maximumHeight: 100
            // Align on right side.
            Layout.alignment: Qt.AlignRight
            TextArea{
                id: control
                // Just a placeholder
                placeholderText: qsTr("Введите текст...")
                placeholderTextColor: "darkgray"
                background: Rectangle {
                    // Background of text area.
                    border.color: control.enabled ? "red" : "transparent"
                }
            }
        }
        // Custom Slider.
        Slider{
            id: slider
            // Place handler at the middle of values.
            value: to/2
            from: 1
            to: 50
            // Slider`s background settings.
            background: Rectangle {
                x: slider.leftPadding
                y: slider.topPadding + slider.availableHeight / 2 - height / 2
                implicitWidth: 200
                implicitHeight: 4
                width: slider.availableWidth
                height: implicitHeight
                radius: 2
                color: "#931124"
                Rectangle {
                    width: slider.visualPosition * parent.width
                    height: parent.height
                    color: "green"
                    radius: 2
                }
            }
            // Custom handler
            handle: Rectangle {
                x: slider.leftPadding + slider.visualPosition * (slider.availableWidth - width)
                y: slider.topPadding + slider.availableHeight / 2 - height / 2
                implicitWidth: 26
                implicitHeight: 26
                radius: 13
                color: slider.pressed ? "#f0f0f0" : "#f6f6f6"
                border.color: "#bdbebf"
            }
            Layout.row: 1
            Layout.column: 1
            Layout.alignment: Qt.AlignRight
        }
        // Custom RadioButtons (They are same)
        RadioButton{
            id: radio1
            text: qsTr("Легкая суета")
            checked: true
            // Custom indicator
            indicator: Rectangle {
                implicitWidth: 26
                implicitHeight: 26
                x: radio1.leftPadding
                y: parent.height / 2 - height / 2
                radius: 13
                border.color: radio1.checked ? "green" : "blue"
                Rectangle {
                    width: 14
                    height: 14
                    x: 6
                    y: 6
                    radius: 7
                    color: radio1.checked ? "green" : "blue"
                    visible: radio1.checked
                }
            }
            // Custom text
            contentItem: Text {
                text: radio1.text
                font: radio1.font
                opacity: enabled ? 1.0 : 0.3
                color: radio1.checked ? "green" : "blue"
                verticalAlignment: Text.AlignVCenter
                leftPadding: radio1.indicator.width + radio1.spacing
            }
            Layout.row: 3
            Layout.column: 0
            Layout.alignment: Qt.AlignRight
        }
        RadioButton{
            id: radio2
            text: qsTr("Серьёзная суета")
            checked: false
            indicator: Rectangle {
                implicitWidth: 26
                implicitHeight: 26
                x: radio2.leftPadding
                y: parent.height / 2 - height / 2
                radius: 13
                border.color: radio2.checked ? "green" : "blue"
                Rectangle {
                    width: 14
                    height: 14
                    x: 6
                    y: 6
                    radius: 7
                    color: radio2.checked ? "green" : "blue"
                    visible: radio2.checked
                }
            }
            contentItem: Text {
                text: radio2.text
                font: radio2.font
                opacity: enabled ? 1.0 : 0.3
                color: radio2.checked ? "green" : "blue"
                verticalAlignment: Text.AlignVCenter
                leftPadding: radio2.indicator.width + radio2.spacing
            }
            Layout.row: 3
            Layout.column: 1
        }
    }
    // Footer.
    footer: Label {
        id: footer
        // Footer`s background
        background: Rectangle {
            anchors.fill: parent
            color: "green"
        }
        // Footer`s text.
        horizontalAlignment: "AlignHCenter"
        text: qsTr("Made by Andrey \"Akuma\" Shornikov in 2021.")
        color: "indigo"
    }
}
