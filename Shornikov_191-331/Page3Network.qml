import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import QtQuick.Controls.Styles 1.4

Page {
    id: page3Network
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
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 20
        spacing: 15
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
            id: btnResponse
            onClicked: {
                mainWindow.btnHTTPResponse();
            }
            text: qsTr("Получить ответ")
            contentItem: Text {
                text: btnResponse.text
                font: btnResponse.font
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
                color: btnResponse.down ? "#f0f0f0" : "#fdfdfd"
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
        anchors.leftMargin: parent.width*0.035
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
            text: qsTr("Нажмите на кнопку \"Отправить запрос\", после чего получите ответ")
            color: "green"
            readOnly: true
            textFormat: "RichText"
            anchors.fill: parent
            background: Rectangle {
                // Background of text area.
                border.color: pageCode.enabled ? "green" : "transparent"
            }
        }
    }

    Label {
        id: valueKeeperLabel
        anchors.top: pageContainer.bottom
        anchors.topMargin: parent.height*0.1
        anchors.horizontalCenter: parent.horizontalCenter
        color: "green"
        text: qsTr("Стоимость 2 Долларов США в Российских рублях на данный момент.")
        font.pixelSize: Qt.application.font.pixelSize*1.65
    }

    Label {
        id: valueKeeper
        objectName: "valueKeeper"
        anchors.top: valueKeeperLabel.bottom
        anchors.topMargin: 3
        anchors.horizontalCenter: parent.horizontalCenter
        color: "green"
        text: qsTr("Запросите информацую с сервера!")
        font.pixelSize: Qt.application.font.pixelSize*1.85
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

    //    Connections {
    //        target: httpController
    //        function onToQML(htmlCode, parsedValue) {
    //            pageCode.text = htmlCode;
    //            valueKeeper.text = "1$ = " + parsedValue + " руб.";
    //        }
    //    }
}
