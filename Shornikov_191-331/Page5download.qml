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

    ColumnLayout {
        anchors.centerIn: parent
        spacing: 15
        Label {
            id: txtLabel
            Layout.alignment: Qt.AlignHCenter
            Text {
                id: txt
                text: qsTr("Hello, Billy!")
                anchors.centerIn: txtLabel
                color: "green"
                font.pixelSize: 16
            }
        }
        Button {
            id: callHerrington
            Layout.preferredWidth: 125
            Layout.preferredHeight: 35
            Layout.alignment: Qt.AlignHCenter
            text: qsTr("Do NOT click!")
            contentItem: Text {
                text: callHerrington.text
                font: callHerrington.font
                opacity: enabled ? 1.0 : 0.3
                color: "green"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }
            background: Rectangle {
                implicitWidth: 100
                implicitHeight: 40
                opacity: enabled ? 1 : 0.3
                color: callHerrington.down ? "#f0f0f0" : "#fdfdfd"
                border.color: "indigo"
                border.width: 1
                radius: 2
            }
            onClicked: mainWindow.requestMessage();
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
