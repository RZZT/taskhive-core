import QtQuick 2.6
import "Components/"
SplashScreen {
    id: splash
    property int timeoutInterval: 2000
        signal timeout
        x: (Screen.width - splashImage.width) / 2
        y: (Screen.height - splashImage.height) / 2
        width: splashImage.width
        height: splashImage.height

        Image {
            id: splashImage
            source: "images/taskhive-symbol-yellow.svg"
            MouseArea {
                anchors.fill: parent
                onClicked: Qt.quit()
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
