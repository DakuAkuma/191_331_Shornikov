import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import QtQuick.Controls.Styles 1.4

Page {
    id: page3Network
    Connections {
        target: httpController
        function onToQML(htmlCode, parsedValue) {
            pageCode.text = htmlCode;
            //valueKeeper.text = "1 доллар = " + parsedValue + " р.";
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
            text: "<font color=\"white\">Lab No. 3. Network.</font>"
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

    RowLayout {
        id: btnHolder
        spacing: 15
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 20
        Button {
            id: btnRequest
            onClicked: {
                mainWindow.btnHTTPRequest();
            }
            text: qsTr("Отправить запрос")
            contentItem: Text {
                text: btnRequest.text
                font: btnRequest.font
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
                color: btnRequest.down ? "#f0f0f0" : "#fdfdfd"
                border.color: "indigo"
                border.width: 1
                radius: 2
            }
        }
        Button {
            id: btnShow
            onClicked: {
                //mainWindow.btnHTTPShow();
            }
            text: qsTr("Отобразить страницу")
            contentItem: Text {
                text: btnShow.text
                font: btnShow.font
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
                color: btnShow.down ? "#f0f0f0" : "#fdfdfd"
                border.color: "indigo"
                border.width: 1
                radius: 2
            }
        }
    }

    ScrollView {
        id: pageContainer
        anchors.top: btnHolder.bottom
        anchors.topMargin: 15
        anchors.left: parent.left
        anchors.leftMargin: parent.width*0.05
        anchors.right: parent.right
        anchors.rightMargin: anchors.leftMargin
        // acnhors.bottom: id.top // W.I.P.
        clip: true
        // Turn on interactive showing of scroll bars.
        ScrollBar.horizontal.interactive: true
        ScrollBar.vertical.interactive: true
        implicitWidth: pageContainer.availableWidth-parent.width*0.1
        implicitHeight: parent.height*0.35
        TextArea{
            id: pageCode
            objectName: "pageCode"
            // Just a placeholder
            placeholderText: qsTr("Нажмите на кнопку \"Отобразить страницу\"")
            placeholderTextColor: "darkgray"
            readOnly: true
            anchors.fill: parent
            background: Rectangle {
                // Background of text area.
                border.color: pageCode.enabled ? "green" : "transparent"
            }
        }
    }

    Label {
        id: valueKeeper
        anchors.top: pageContainer.bottom
        anchors.topMargin: parent.height*0.2
        anchors.horizontalCenter: parent.horizontalCenter
        color: "green"
        text: qsTr("Запросите информацую с сервера!")
        font.pixelSize: Qt.application.font.pixelSize*1.8
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
