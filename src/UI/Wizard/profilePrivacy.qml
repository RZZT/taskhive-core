import QtQuick 2.0
import QtGraphicalEffects 1.0
Item {
    property variant selected: 'Private'
    Text {
        id: profileTitle
        anchors.left: parent.left
        anchors.leftMargin: 30
        text: selected
        font.pixelSize: 24
        color: "#fff"
    }
    Rectangle {
        height: 1
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: profileTitle.bottom
        anchors.topMargin: 5
    }
    Image {
        id: privacyIcon
        source: "../images/12.svg"
        sourceSize.height: 300
        sourceSize.width: 300
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        opacity: 0.3
    }
    ColorOverlay {
        anchors.fill: privacyIcon
        source: privacyIcon
        color: "grey"
        opacity: 0.3
    }
}
