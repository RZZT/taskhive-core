import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3
Item {
    Text {
        id: profileTitle
        anchors.left: parent.left
        anchors.leftMargin: 30
        text: qsTr("Following")
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
        Item {
            id: item1
            anchors.fill: parent
            ListView {
                id: profileList
                anchors.top: parent.top
                anchors.topMargin: 0
                anchors.right: parent.right
                anchors.left: parent.left
                height: profileList.contentHeight
                model: [{"link":"sn0wmonster", "fingerprint":"8c380fa68a3f"}]
                spacing: 10
                delegate: RowLayout {
                        anchors.left: parent.left
                        anchors.right: parent.right
                        spacing: 20
                        height: 60
                        Rectangle {
                            id: securityIcon
                            height: 50
                            width: 50
                        }
                        Column {
                            spacing: 2
                            anchors.left: securityIcon.right
                            anchors.leftMargin: 20
                            Text {
                                id: textLink
                                text: "sn0wmonster"
                                font.pixelSize: 18
                                color: "#fff"
                            }
                            Text {
                                id: fingerprintText
                                text: "8c380fa68a3f"
                                font.pixelSize: 14
                                color: "#fff"
                            }
                        }
                        Image {
                            source: "../images/05.svg"
                            Layout.fillHeight: true

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
            Image {
                anchors.top: profileList.bottom
                source: "../images/08.svg"
                sourceSize.width: 50
                sourceSize.height: 50
                MouseArea {
                    anchors.fill: parent
                }

            }
        }
    }
}
