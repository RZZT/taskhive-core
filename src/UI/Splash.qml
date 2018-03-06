import QtQuick 2.1
import QtQuick.Window 2.2
import "Components/"
Window {
    id: splash
    color: "transparent"
    modality: Qt.ApplicationModal
    flags: Qt.SplashScreen
    property int timeoutInterval: 2000
    signal timeout
    x: (Screen.width - splashImage.width) / 2
    y: (Screen.height - splashImage.height) / 2
    width: splashImage.width
    height: splashImage.height

    Image {
        id: splashImage
        source: "images/taskhive-symbol-yellow.svg"
        sourceSize.width: 150
        sourceSize.height: 150
        MouseArea {
            anchors.fill: parent
        }
    }
    Timer {
        interval: timeoutInterval; running: true; repeat: false
        onTriggered: {
            visible = false
            splash.timeout()
        }
    }
    Component.onCompleted: visible = true
}
