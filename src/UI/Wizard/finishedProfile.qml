import QtQuick 2.0
import "../"
Item {
    id: item1
    Text {
            id: title
            anchors.left: parent.left
            anchors.top: parent.top
            text: qsTr("Congratulations! You've completed your profile.")
            anchors.leftMargin: 40
            anchors.right: parent.right
            anchors.rightMargin: 40
            anchors.topMargin: 60
            font.pixelSize: 32
            font.bold: true
            wrapMode: Text.WordWrap
            color: "#fff"
        }
    Text {
            id: title2
            anchors.top: title.bottom
            text: qsTr("You can now create your own tasks and offers and become part of the hive.\n\n Please restart the Taskhive application to apply these changes.")
            anchors.right: parent.right
            anchors.rightMargin: 40
            anchors.left: parent.left
            anchors.leftMargin: 40
            anchors.topMargin: 10
            wrapMode: Text.WordWrap
            font.pixelSize: 28
            font.bold: true
            color: "#fff"
    }
    ForwardButton {
        height: 40
        width: 40
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 40
        anchors.horizontalCenter: parent.horizontalCenter

        onClicked: {
            wizard.close()
        }
    }
}
