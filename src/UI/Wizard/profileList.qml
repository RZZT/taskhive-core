import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3
Item {
    Text {
        id: profileTitle
        anchors.left: parent.left
        anchors.leftMargin: 30
        text: qsTr("Profiles")
        font.pointSize: 24
        color: "#fff"
    }
    Rectangle {
        height: 1
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: profileTitle.bottom
        anchors.topMargin: 5
    }
    ScrollView {
        id: scrollView
        anchors.top: profileTitle.bottom
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.topMargin: 31
        anchors.leftMargin: 30
        horizontalScrollBarPolicy: Qt.ScrollBarAlwaysOff
        verticalScrollBarPolicy: Qt.ScrollBarAlwaysOff
        ListView {
            id: profileList
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            model: profiles
            spacing: 10
            delegate: RowLayout {
                    anchors.left: parent.left
                    anchors.right: parent.right
                    spacing: 20

                    Image {
                        id: securityIcon
                        source: "../images/security-icon-white.svg"
                        anchors.verticalCenter: parent.verticalCenter
                        sourceSize.height: 40
                        sourceSize.width: 40
                    }
                    Text {
                        id: textLink
                        anchors.left: securityIcon.right
                        text: link
                        font.pointSize: 18
                        color: "#fff"
                    }
                    Image {
                        id: deleteIcon
                        source: "../images/09.svg"
                        anchors.verticalCenter: parent.verticalCenter
                        sourceSize.height: 40
                        sourceSize.width: 40
                        MouseArea {
                            anchors.fill: parent
                            onClicked: profiles.remove(profileList.currentIndex)
                        }
                    }

            }
        }
    }
}
