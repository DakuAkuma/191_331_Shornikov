import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import QtQuick.Controls.Styles 1.4
import QtMultimedia 5.12

Page { // Lab No.2. Multimedia.
    // Page ID
    id: page2Media
    // Page`s background
    background: Rectangle {
        anchors.fill: parent
        color: "#fdfdfd"
    }

    property bool _mediaFlag: true
    function pressMedia(eventHandler) {
       if (_mediaFlag) {
           eventHandler.play()
           _mediaFlag = false
       } else {
           eventHandler.pause()
           _mediaFlag = true
       }
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
            text: "<font color=\"white\">Lab No. 2. Multimedia.</font>"
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

    //Main content
    RowLayout {
        id: choose
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        RadioButton {
            id: mediaPlayer
            text: qsTr("MP4 Плеер")
            checked: true
            Layout.alignment: Qt.AlignCenter
            indicator: Rectangle {
                implicitWidth: 26
                implicitHeight: 26
                x: mediaPlayer.leftPadding
                y: parent.height / 2 - height / 2
                radius: 13
                border.color: mediaPlayer.checked ? "green" : "blue"
                Rectangle {
                    width: 14
                    height: 14
                    x: 6
                    y: 6
                    radius: 7
                    color: mediaPlayer.checked ? "green" : "blue"
                    visible: mediaPlayer.checked
                }
            }
            // Custom text
            contentItem: Text {
                text: mediaPlayer.text
                font: mediaPlayer.font
                opacity: enabled ? 1.0 : 0.3
                color: mediaPlayer.checked ? "green" : "blue"
                verticalAlignment: Text.AlignVCenter
                leftPadding: mediaPlayer.indicator.width + mediaPlayer.spacing
            }
        }

        RadioButton {
            id: camera
            text: qsTr("Камера")
            Layout.alignment: Qt.AlignCenter
            indicator: Rectangle {
                implicitWidth: 26
                implicitHeight: 26
                x: camera.leftPadding
                y: parent.height / 2 - height / 2
                radius: 13
                border.color: camera.checked ? "green" : "blue"
                Rectangle {
                    width: 14
                    height: 14
                    x: 6
                    y: 6
                    radius: 7
                    color: camera.checked ? "green" : "blue"
                    visible: camera.checked
                }
            }
            // Custom text
            contentItem: Text {
                text: camera.text
                font: camera.font
                opacity: enabled ? 1.0 : 0.3
                color: camera.checked ? "green" : "blue"
                verticalAlignment: Text.AlignVCenter
                leftPadding: camera.indicator.width + camera.spacing
            }
        }
    }

    //MediaPlayer
    Rectangle {
        id: playerContainer
        visible: mediaPlayer.checked
        anchors.top: choose.bottom
        width: parent.width-25
        height: parent.height-(parent.height*(1.33/6))-choose.height
        anchors.horizontalCenter: parent.horizontalCenter
        color: "black"

        MediaPlayer {
            id: player
            source: "balet.mp4"
            autoPlay: false
            volume: volumeSlider.value
            onStopped: {
                _mediaFlag = true
            }
        }

        VideoOutput {
            id: videoOutput
            source: player
            anchors.fill: parent
        }

        MouseArea {
            id: playArea
            anchors.fill: parent
            onPressed: pressMedia(player)
        }
    }

    ColumnLayout {
        visible: mediaPlayer.checked
        anchors.top: playerContainer.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        Layout.maximumWidth: parent.width
        // Track video`s position.
        Slider {
            id: positionSlider
            from: 0
            to: player.duration
            value: player.position
            stepSize: 0.001
            Layout.maximumWidth: playerContainer.width
            Layout.alignment: Qt.AlignHCenter
            background: Rectangle {
                x: positionSlider.leftPadding
                y: positionSlider.topPadding + positionSlider.availableHeight / 2 - height / 2
                implicitHeight: 4
                implicitWidth: Layout.maximumWidth
                width: positionSlider.availableWidth
                height: implicitHeight
                radius: 2
                color: "#931124"
                Rectangle {
                    width: positionSlider.visualPosition * parent.width
                    height: parent.height
                    color: "green"
                    radius: 2
                }
            }
            // Custom handler
            handle: Rectangle {
                x: positionSlider.leftPadding + positionSlider.visualPosition * (positionSlider.availableWidth - width)
                y: positionSlider.topPadding + positionSlider.availableHeight / 2 - height / 2
                implicitWidth: 26
                implicitHeight: 26
                radius: 13
                color: positionSlider.pressed ? "#f0f0f0" : "#f6f6f6"
                border.color: "#bdbebf"
            }
        }

        // Slider for volume
        Slider {
            id: volumeSlider
            from: 0.0
            to: 1.0
            stepSize: 0.1
            value: to
            Layout.maximumWidth: 200
            Layout.alignment: Qt.AlignRight
            background: Rectangle {
                x: volumeSlider.leftPadding
                y: volumeSlider.topPadding + volumeSlider.availableHeight / 2 - height / 2
                implicitWidth: 200
                implicitHeight: 4
                width: volumeSlider.availableWidth
                height: implicitHeight
                radius: 2
                color: "#931124"
                Rectangle {
                    width: volumeSlider.visualPosition * parent.width
                    height: parent.height
                    color: "green"
                    radius: 2
                }
            }
            // Custom handler
            handle: Rectangle {
                x: volumeSlider.leftPadding + volumeSlider.visualPosition * (volumeSlider.availableWidth - width)
                y: volumeSlider.topPadding + volumeSlider.availableHeight / 2 - height / 2
                implicitWidth: 26
                implicitHeight: 26
                radius: 13
                color: volumeSlider.pressed ? "#f0f0f0" : "#f6f6f6"
                border.color: "#bdbebf"
            }
        }
    }


    //Camera

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
