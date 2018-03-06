import QtQuick 2.0
import QtQuick.Controls 1.4
import "../"
Item {
    Rectangle {
        color: "transparent"
        anchors.fill: parent
        anchors.margins: {
            left: 20
            right: 20
            top: 20
            bottom: 20
        }
        Text {
            id: title
            anchors.left: parent.left
            anchors.top: parent.top
            text: qsTr("Startup Wizard")
            font.pixelSize: 42
            font.bold: true
            color: "#fff"
        }
        Text {
            id: generalText
            anchors.top: title.bottom
            text: qsTr("Known outside of Taskhive?\nLink your profiles.")
            font.pixelSize: 38
            color: "#fff"
        }
        Column {
            anchors.top: generalText.bottom
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.topMargin: 50
            spacing: 10
            Rectangle {
                id: inputProfile
                height: 50
                anchors.right: parent.right
                anchors.left: parent.left
                Image {
                    id: icon
                    anchors.left: parent.left
                    source: "../images/04.svg"
                    sourceSize.height: 40
                    sourceSize.width: 40
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.leftMargin: 12
                    anchors.rightMargin: 10
                }
                TextInput {
                    id: searchText
                    anchors.top: parent.top
                    anchors.left: icon.right
                    anchors.right: parent.right
                    height: parent.height
                    font.pixelSize: 14
                    anchors.leftMargin: 10
                    color: "#000000"
                    verticalAlignment: TextInput.AlignVCenter

                    onAccepted: profiles.append({'link':searchText.text})
                }
            }
            Text {
                id: pasteDescription
                text: qsTr("Paste this somewhere on that page.")
                font.pixelSize: 28
                color: "#fff"
            }
            TextArea {
                id: proofTextArea
                font.pixelSize: 28
                anchors.left: parent.left
                anchors.right: parent.right
                text: qsTr('{proof:"buyguy::8c380fa68a3f::bdc2870361f052aeb5987f406d7bf6eb457ef7ca17e68727"}')
                readOnly: true
                wrapMode: TextEdit.WrapAnywhere
            }
            Image {
                id: loadingIcon
                anchors.right: parent.right
                sourceSize.height: 80
                sourceSize.width: 50
                source: "../images/13.svg"
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        profiles.append({'link':searchText.text})
                        loadingIcon.source = "../images/14.svg"
                    }
                }
            }
        }


        Rectangle {
            id: buttons
            height: wizard.height * 0.10
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            color: "transparent"
                    ForwardButton {
                        id: confirmButton
                        anchors.right: parent.right
                        onClicked: {
                            wizardStack.push(Qt.resolvedUrl('customizeExperience.qml'))
                            profileStack.push(Qt.resolvedUrl('profileExperience.qml'))
                        }
                    }

                    BackButton {
                        id: back
                        anchors.left: parent.left
                    }
        }

    }

}
