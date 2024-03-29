import QtQuick 2.12
import QtQuick.Window 2.12
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
    signal btnHTTPResponse()
    signal requestMessage()
    signal getFriends()
    signal fillCrypto()
    signal fillDeCrypto()

    SwipeView {
        id: swipeView
        objectName: "swipeView"
        anchors.fill: parent
        //currentIndex: tabBar.currentIndex

        Page1GUI {
            id: page1GUI
        }

        Page2Media {
            id: page2Media
        }

        Page3Network {
            id: page3Network
            objectName: "page3Network"
        }

        Page4OAUTH2 {
            id: page4OAUTH2
        }

        Page5download {
            id: page5download
        }

        Page6crypto {
            id: page6crypto
        }
        /*
        Page {
        }

        Page {
        }

        Page {
        }

        Page {
        }
        */
    }
    /*
    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex

        background: Rectangle {
            anchors.fill: parent
            color: "green"
        }

        TabButton {
            id: buttonLab1
            text: qsTr("Lab 1")
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
            text: qsTr("Lab 2")
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
            text: qsTr("Lab 3")
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

        TabButton {
            id: buttonLab4
            text: qsTr("Lab 4")
            font.pixelSize: Qt.application.font.pixelSize * 1.5
            contentItem: Text {
                text: buttonLab4.text
                font: buttonLab4.font
                opacity: enabled ? 1.0 : 0.3
                color: buttonLab4.checked ? "indigo" : buttonLab4.down ? "f0f0f0" : "white"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }
        }

        TabButton {
            id: buttonLab5
            text: qsTr("Lab 5")
            font.pixelSize: Qt.application.font.pixelSize * 1.5
            contentItem: Text {
                text: buttonLab5.text
                font: buttonLab5.font
                opacity: enabled ? 1.0 : 0.3
                color: buttonLab5.checked ? "indigo" : buttonLab5.down ? "f0f0f0" : "white"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }
        }

        TabButton {
            id: buttonLab6
            text: qsTr("Lab 6")
            font.pixelSize: Qt.application.font.pixelSize * 1.5
            contentItem: Text {
                text: buttonLab6.text
                font: buttonLab6.font
                opacity: enabled ? 1.0 : 0.3
                color: buttonLab6.checked ? "indigo" : buttonLab6.down ? "f0f0f0" : "white"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }
        }
        /*
        TabButton {
            id: buttonLab7
            text: qsTr("Lab 7")
            font.pixelSize: Qt.application.font.pixelSize * 1.5
            contentItem: Text {
                text: buttonLab7.text
                font: buttonLab7.font
                opacity: enabled ? 1.0 : 0.3
                color: buttonLab7.checked ? "indigo" : buttonLab7.down ? "f0f0f0" : "white"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }
        }

        TabButton {
            id: buttonLab8
            text: qsTr("Lab 8")
            font.pixelSize: Qt.application.font.pixelSize * 1.5
            contentItem: Text {
                text: buttonLab8.text
                font: buttonLab8.font
                opacity: enabled ? 1.0 : 0.3
                color: buttonLab8.checked ? "indigo" : buttonLab8.down ? "f0f0f0" : "white"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }
        }

        TabButton {
            id: buttonLab9
            text: qsTr("Lab 9")
            font.pixelSize: Qt.application.font.pixelSize * 1.5
            contentItem: Text {
                text: buttonLab9.text
                font: buttonLab9.font
                opacity: enabled ? 1.0 : 0.3
                color: buttonLab9.checked ? "indigo" : buttonLab9.down ? "f0f0f0" : "white"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }
        }

        TabButton {
            id: buttonLab10
            text: qsTr("Lab 10")
            font.pixelSize: Qt.application.font.pixelSize * 1.5
            contentItem: Text {
                text: buttonLab10.text
                font: buttonLab10.font
                opacity: enabled ? 1.0 : 0.3
                color: buttonLab10.checked ? "indigo" : buttonLab10.down ? "f0f0f0" : "white"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }
        }
    }*/
    Drawer{
        id: drawer
        width: 0.45 * parent.width
        height: parent.height

        background: Rectangle {
            anchors.fill: parent
            color: "green"
        }

        GridLayout{
            width: parent.width
            columns: 1

            Label{
                id: label
                text: "Содержание"

                anchors.top: parent.top
                anchors.topMargin: 10

                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 18
                color: "indigo"
            }

            Rectangle{
                Layout.fillWidth: true
                height: 1
                color: "green"

                anchors.top: label.bottom
                anchors.topMargin: 4
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.leftMargin: 5
                anchors.rightMargin: 5
            }

            Button{
                text: "1. GUI"
                flat: true
                onClicked: {
                    swipeView.currentIndex = 0
                    drawer.close()
                }
            }

            Button{
                text: "2. Multimedia"
                flat: true
                onClicked: {
                    swipeView.currentIndex = 1
                    drawer.close()
                }
            }

            Button{
                text: "3. HTTP"
                flat: true
                onClicked: {
                    swipeView.currentIndex = 2
                    drawer.close()
                }
            }

            Button{
                text: "4. Oauth"
                flat: true
                onClicked: {
                    swipeView.currentIndex = 3
                    drawer.close()
                }
            }

            Button{
                text: "5. REST API"
                flat: true
                onClicked: {
                    swipeView.currentIndex = 4
                    drawer.close()
                }
            }

            Button{
                text: "6. SSL"
                flat: true
                onClicked: {
                    swipeView.currentIndex = 5
                    drawer.close()
                }
            }
        }
    }
}
