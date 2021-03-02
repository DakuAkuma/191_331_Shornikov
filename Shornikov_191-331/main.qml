import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import QtQuick.Controls.Styles 1.4

ApplicationWindow {
    width: 640
    height: 480
    visible: true
    title: qsTr("Mobile development")

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        Page { // ЛР_1. Введение. Элементы GUI.
            // Page backgroung.
            background: Rectangle {
                anchors.fill: parent
                color: "yellow"
            }

            header: Rectangle {
                // Background color.
                color: "black"
                width: parent.width
                height: parent.height*0.09
                Rectangle {
                    // Choose "width" out of smallest value of parent.width and parent.height.
                    width: (parent.width < parent.height ? parent.width : parent.height)*0.85
                    height: width
                    color: "black"
                    border.color: "gray"
                    border.width: 1
                    radius: width*0.5
                    anchors.verticalCenter: parent.verticalCenter
                    Text {
                        anchors.centerIn: parent
                        color: "yellow"
                        text: "Yay"
                    }
                }
                Label {
                    leftPadding: parent.width < parent.height ? parent.width : parent.height + 5
                    Layout.column: 2
                    color: "yellow"
                    text: qsTr("Lab No.1. GUI elements")
                    font.pixelSize: Qt.application.font.pixelSize * 2
                    anchors.verticalCenter: parent.verticalCenter
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

            // Our "GUI elements table" which presented as GridLayout object.
            GridLayout {
                anchors.fill: parent
                Dial{
                    Layout.row: 0
                    Layout.column: 0
                }
                TextArea{
                    Layout.row: 0
                    Layout.column: 1
                }
                RangeSlider{
                    Layout.row: 1
                    Layout.column: 0
                }
                Slider{
                    Layout.row: 1
                    Layout.column: 1
                }
                CheckBox{
                    Layout.row: 2
                    Layout.column: 0
                }
                RadioButton{
                    Layout.row: 2
                    Layout.column: 1
                }
                RadioButton{
                    Layout.row: 2
                    Layout.column: 2
                }
            }

            footer: Label {
                // Footer background
                background: Rectangle {
                    anchors.fill: parent
                    color: "black"
                }
                horizontalAlignment: "AlignHCenter"
                text: qsTr("Made by Andrey \"Akuma\" Shornikov in 2021.")
            }
        }

        Page {
            header: Label {
                color: "#7734ad"
                text: qsTr("Lab No.2. Recording and playing photo and video")
                font.pixelSize: Qt.application.font.pixelSize * 2
                padding: 10
            }

            Label {
                text: qsTr("There will be Lab No.2 soon.")
                anchors.centerIn: parent
            }

            footer: Label {
                horizontalAlignment: "AlignHCenter"
                text: qsTr("Made by Andrey \"Akuma\" Shornikov in 2021.")
            }
        }

        Page {
            header: Label {
                color: "#a4f25f"
                text: qsTr("Lab No.3. Graphical effects")
                font.pixelSize: Qt.application.font.pixelSize * 2
                padding: 10
            }

            Label {
                text: qsTr("There will be Lab No.3 soon.")
                anchors.centerIn: parent
            }

            footer: Label {
                horizontalAlignment: "AlignHCenter"
                text: qsTr("Made by Andrey \"Akuma\" Shornikov in 2021.")
            }
        }
    }

    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex

        TabButton {
            text: qsTr("Lab No.1")
        }
        TabButton {
            text: qsTr("Lab No.2")
        }
        TabButton {
            text: qsTr("Lab No.3")
        }
    }
}
