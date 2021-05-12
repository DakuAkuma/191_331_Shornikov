import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import QtQuick.Controls.Styles 1.4
import QtWebView 1.1

Page {
    id: page4OAUTH2
    objectName: "page4auth"
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
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 50 //
        WebView {
            id: authView
            url: "https://oauth.vk.com/authorize?client_id=7852201&redirect_uri=&scope=4&response_type=token"
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
            Layout.topMargin: 25
            onLoadingChanged: {
                console.info("*** "+ authView.url)

                let token = httpController.getToken(authView.url)

                if (token !== " ") {
                    tokenHolder.text = token
                    tokenHolder.visible = true
                    getFriends.visible = true
                    authView.visible = false
                }
            }
        }
        Label {
            id: tokenHolder
            visible: false
            font.pixelSize: 11
            color: "red"
            Layout.topMargin: 15
            Layout.alignment: Qt.AlignTop | Qt.AlignHCenter
        }
        Button {
            id: getFriends
            visible: false
            Layout.alignment: Qt.AlignBottom | Qt.AlignHCenter
            onClicked: {
                mainWindow.getFriends();
            }
            text: qsTr("Забрать 10 друзей случайных из Интернета")
            contentItem: Text {
                text: getFriends.text
                font: getFriends.font
                opacity: enabled ? 1.0 : 0.3
                color: "green"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }
            background: Rectangle {
                implicitWidth: 150
                implicitHeight: 60
                opacity: enabled ? 1 : 0.3
                color: getFriends.down ? "#f0f0f0" : "#fdfdfd"
                border.color: "indigo"
                border.width: 1
                radius: 2
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
