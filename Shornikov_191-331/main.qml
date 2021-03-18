import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import QtQuick.Controls.Styles 1.4

ApplicationWindow {
    id: mainWindow
    width: 640
    height: 480
    visible: true
    title: qsTr("Mobile development")

    // Add this property to reduce amount of code repeats.
    property int defMargin: 5

    signal btnHTTPRequest()

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        Page1GUI {
            id: page1GUI
        }

        Page2Media {
            id: page2Media
        }

        Page {
            id: page3Network
            header: Label {
                color: "#a4f25f"
                text: qsTr("Lab No.3. Graphical effects")
                font.pixelSize: Qt.application.font.pixelSize * 2
                padding: 10
            }

            Button {
                id: btnRequest
                anchors.centerIn: parent
                onClicked: {
                    mainWindow.btnHTTPRequest();
                }
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
