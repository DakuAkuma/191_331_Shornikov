import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import QtQuick.Controls.Styles 1.4

ApplicationWindow {
    width: 640
    height: 480
    visible: true
    title: qsTr("Mobile development")

    // Add this property to reduce amount of code repeats.
    property int defMargin: 5


    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        Page1GUI {
            id: page1GUI
        }

        Page { // Lab No.2. Multimedia.
            // Page ID
            id: page2Media
            // Page`s background
            background: Rectangle {
                id: bg
                anchors.fill: parent
                color: "black"
            }
            header: ToolBar {
                // Header`s background color.
                background: Rectangle {
                    id: bg2
                    anchors.fill: parent
                    color: "black"
                }
                // Header`s title
                Label {
                    id: headText
                    color: "#7734ad"
                    text: qsTr("Lab No. 2. Multimedia.")
                    font.pixelSize: Qt.application.font.pixelSize * 1.5
                    anchors.verticalCenter: parent.verticalCenter
                    // Header`s figures.
                    Rectangle {
                        id: circ1
                        width: Qt.application.font.pixelSize*1.5
                        height: width
                        radius: width/2
                        color: "green"
                        anchors.left: headText.right
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.leftMargin: defMargin
                    }
                    Rectangle {
                        id: circ2
                        width: Qt.application.font.pixelSize*1.5
                        height: width
                        radius: width/2
                        color: "green"
                        anchors.left: circ1.right
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.leftMargin: defMargin
                    }
                    Rectangle {
                        width: Qt.application.font.pixelSize*1.5
                        height: width
                        radius: width/2
                        color: "darkviolet"
                        anchors.left: circ2.right
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.leftMargin: defMargin
                    }
                }
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

        background: Rectangle {
            anchors.fill: parent
            color: "green"
        }

        TabButton {
            id: buttonLab1
            text: qsTr("Lab No.1")
            font.pixelSize: Qt.application.font.pixelSize * 1.5
            // Custom text in button.
            contentItem: Text {
                text: buttonLab1.text
                font: buttonLab1.font
                opacity: enabled ? 1.0 : 0.3
                color: buttonLab1.checked ? "indigo" : buttonLab1.down ? "f0f0f0" : "white"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }
        }
        TabButton {
            id: buttonLab2
            text: qsTr("Lab No.2")
            font.pixelSize: Qt.application.font.pixelSize * 1.5
            contentItem: Text {
                text: buttonLab2.text
                font: buttonLab2.font
                opacity: enabled ? 1.0 : 0.3
                color: buttonLab2.checked ? "indigo" : buttonLab2.down ? "f0f0f0" : "white"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }
        }
        TabButton {
            id: buttonLab3
            text: qsTr("Lab No.3")
            font.pixelSize: Qt.application.font.pixelSize * 1.5
            contentItem: Text {
                text: buttonLab3.text
                font: buttonLab3.font
                opacity: enabled ? 1.0 : 0.3
                color: buttonLab3.checked ? "indigo" : buttonLab3.down ? "f0f0f0" : "white"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }
        }
    }
}
