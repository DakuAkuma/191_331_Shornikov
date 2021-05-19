import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import QtQuick.Controls.Styles 1.4

Page {
    id: page5download

    Connections {
        target: httpController
        function onSendMessage(msg) {
            console.info("SIGNAL sendMessage");
            txt.text = msg;
        }
    }

    // Page`s background
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
            text: "<font color=\"white\">Lab No. 4. OAuth2.</font>"
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

    // Content
    ScrollView{
        anchors.fill: parent

        GridView{
            id: grid
            visible: true
            anchors.fill: parent
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 25
            anchors.leftMargin: 45
            cellWidth: 250
            cellHeight: 100
            model: modelController
            clip: true

            delegate: Rectangle {
                id: delegate
                color: "white"
                width: grid.cellWidth
                height: grid.cellHeight
                anchors.margins: 25
                anchors.rightMargin: 45
                border.color: "black"

                Image{
                    id: img
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.leftMargin: 10
                    anchors.topMargin: 10
                    source: model.u_img
                    height: 50
                    width: 50
                    fillMode: Image.PreserveAspectFit
                }

                Label { // Domain (id)
                    color: "indigo"
                    text: "Иден. пользователя: " + model.u_domain
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    anchors.topMargin: 5
                    font.family: "Helvetica"
                    font.pointSize: 9
                }

                Label{ // Name
                    color: "indigo"
                    text: "Имя: " + model.u_name
                    anchors.centerIn: parent
                    font.family: "Helvetica"
                    font.pointSize: 9
                }

                Label{ // Surname
                    color: "indigo"
                    text: "Фамилия: " + model.u_surname
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 10
                    font.family: "Helvetica"
                    font.pointSize: 9
                }

                Label {
                    color: model.u_status === "true" ? "green" : "red"
                    text: model.u_status === "true" ? "Online" : "Offline"
                    anchors.bottom: parent.bottom
                    anchors.right: parent.right
                    anchors.rightMargin: 5
                    anchors.bottomMargin: 5
                    font.family: "Helvetica"
                    font.pointSize: 7
                }
            }
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
