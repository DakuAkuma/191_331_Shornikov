import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import QtQuick.Dialogs 1.2
import QtQuick.Controls.Styles 1.4

Page {
    id: page6crypto

    // Page backgroung.
    background: Rectangle {
        anchors.fill: parent
        color: "#fdfdfd"
    }

    // Haeder
    header: ToolBar {
        id: header
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
            text: "<font color=\"white\">Lab No. 6. Crypto (AES).</font>"
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
    // Main content
    Label{
        text: "Введите ключ шифрования\n            (32 символа)"
        anchors.horizontalCenter: parent.horizontalCenter
        font.family: "Helvetica"
        font.pixelSize: 17
        color: "red"
        font.bold: true
        anchors.bottom: textforkey.bottom
        anchors.bottomMargin: 25
    }

    TextField{
        id: textforkey
        placeholderText: qsTr("Ключ писать сюда")
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        horizontalAlignment: TextInput.AlignHCenter
        width: 320
        height: 50
        font.family: "Helvetica"
        font.pixelSize: 15
        anchors.bottomMargin: 20
        maximumLength: 32
    }

    ScrollView {
        id: viewlab6
        // Streamline the text
        clip: true
        // Turn on interactive showing of scroll bars.
        ScrollBar.horizontal.interactive: true
        ScrollBar.vertical.interactive: true
        // Let the text area take 250 px in width and 100 px in height.
        width: 500
        height: 100
        anchors.topMargin: 60
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: textforkey.top
        TextArea{
            id: cryptoHolder
            // Just a placeholder
            placeholderText: qsTr("Защифруйте текст")
            readOnly: true
            placeholderTextColor: "darkgray"
            background: Rectangle {
                // Background of text area.
                border.color: cryptoHolder.enabled ? "red" : "transparent"
            }
        }
    }

    Button{
        id: chipheronlab6
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: viewlab6.bottom
        text: "Зашифровать"
        font.family: "Helvetica"
        font.pixelSize: 18
        anchors.topMargin: 15
        visible: if(fileDialoglab6.fileUrl === 0)
                     false
                 else
                     true
        onClicked: {
            cryptoController.encryptFile(textforkey.text, fileDialoglab6.fileUrls)
        }
        contentItem: Text {
            text: chipheronlab6.text
            font: chipheronlab6.font
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
            color: chipheronlab6.down ? "#f0f0f0" : "#fdfdfd"
            border.color: "indigo"
            border.width: 1
            radius: 2
        }
    }

    Button{
        id: chipherofflab6
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: chipheronlab6.bottom
        anchors.topMargin: 20
        text: "Расшифровать"
        font.family: "Helvetica"
        font.pixelSize: 18
        visible: if(fileDialoglab6.fileUrl === 0)
                     false
                 else
                     true
        onClicked: {
            cryptoHolder.text = cryptoController.decryptFile(textforkey.text, fileDialoglab6.fileUrls)
        }
        contentItem: Text {
            text: chipherofflab6.text
            font: chipherofflab6.font
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
            color: chipherofflab6.down ? "#f0f0f0" : "#fdfdfd"
            border.color: "indigo"
            border.width: 1
            radius: 2
        }
    }

    Button {
        id: btnfordialoglab6
        font.pixelSize: 18
        anchors.top: chipheronlab6.top
        anchors.left: parent.left
        anchors.right: chipheronlab6.left
        anchors.rightMargin: 10
        anchors.leftMargin: 25
        text: "Выбрать файл"
        onClicked: fileDialoglab6.open()

        FileDialog {
            id: fileDialoglab6
            folder: "/Users/Akuma/Desktop"
        }
        contentItem: Text {
            text: btnfordialoglab6.text
            font: btnfordialoglab6.font
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
            color: btnfordialoglab6.down ? "#f0f0f0" : "#fdfdfd"
            border.color: "indigo"
            border.width: 1
            radius: 2
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
