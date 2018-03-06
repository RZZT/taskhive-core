import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.3
Rectangle {

    color: "transparent"
    Text {
            id: title
            anchors.left: parent.left
            anchors.top: parent.top
            text: qsTr("Startup Wizard")
            font.pixelSize: 42
            font.bold: true
            color: "#fff"
            anchors.margins: {
                left: 20
                right: 20
            }
        }
    Text {
        id: title2
        anchors.top: title.bottom
        anchors.left: parent.left
        text: qsTr("Control the volume")
        font.pixelSize: 36
        color: "#fff"
        anchors.margins: {
            left: 20
            right: 20
        }
    }
    Text {
        id: uniqueCustomizeText
        text: qsTr("Customize your experience")
        font.pixelSize: 32
        color: "#fff"
        anchors.left: parent.left
        anchors.top: title2.bottom
        anchors.margins: {
            left: 20
            right: 20
        }
    }
    Rectangle {
        id: radioRectangle
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: uniqueCustomizeText.bottom
        anchors.bottom: buttons.top
        color: "transparent"
        Rectangle {
            id: rectangle
            anchors.fill: parent
            color: "transparent"
            ExclusiveGroup { id: experienceGroup }
            RowLayout {
                id: noisy1
                height: parent.height * 0.25
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.right: parent.right
                spacing: 20
                RadioButton {
                    id: noisy
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    Layout.preferredWidth: 170
                    exclusiveGroup: experienceGroup
                    anchors.margins: {
                        left: 20
                    }
                    style: RadioButtonStyle {
                        label: Text {
                            font.pixelSize: 22
                            text: "Noisy"
                            color: "#fff"
                        }
                        indicator: Image {
                            source: control.checked ? "../images/07.svg" : "../images/10.svg"
                            sourceSize.width: 30
                            sourceSize.height: 30
                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    if(control.checked === true)
                                        control.checked = false
                                    control.checked = true
                                }
                            }
                        }
                    }
                }
                Text {
                    width: 528
                    font.pixelSize: 18
                    color: "#fff"
                    text: qsTr("You will see <i>all</i> posts from <i>all</i> users, except the ones you manually ignore. This includes spam and attempted scams.")
                    Layout.fillWidth: true
                    anchors.verticalCenter: parent.verticalCenter
                    verticalAlignment: Text.AlignTop
                    wrapMode: Text.WordWrap
                    anchors.right: parent.right
                    anchors.rightMargin: 20
                }

            }
            Rectangle {
                color: "#00B4A1"
                id: modest1
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: noisy1.bottom
                height: parent.height * 0.25
                RowLayout {
                    anchors.fill: parent
                                   spacing: 20
                        RadioButton {
                            id: modest
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: parent.left
                            Layout.preferredWidth: 170
                            exclusiveGroup: experienceGroup
                            anchors.margins: {
                                left: 20
                                right: 20
                            }
                            style: RadioButtonStyle {
                                label: Column {
                                    spacing: 5
                                    Text{
                                    font.pixelSize: 22
                                    text: "Modest"
                                    color: "#fff"
                                    }
                                    Text {
                                        font.pixelSize: 12
                                        text: "Recommended."
                                        color: "#fff"
                                    }
                                }
                                indicator: Image {
                                    source: control.checked ? "../images/07.svg" : "../images/10.svg"
                                    sourceSize.width: 30
                                    sourceSize.height: 30
                                    MouseArea {
                                        anchors.fill: parent
                                        onClicked: {
                                            if(control.checked === true)
                                                control.checked = false
                                            control.checked = true
                                        }
                                    }
                                }
                            }
                        }
                        Text {
                            width: 530
                            font.pixelSize:  18
                            color: "#fff"
                            text: qsTr("You will see all posts <i>except</i> those flagged by you and the users you follow.")
                            anchors.verticalCenter: parent.verticalCenter
                            verticalAlignment: Text.AlignTop
                            wrapMode: Text.WordWrap
                            anchors.right: parent.right
                            Layout.fillWidth: true
                            anchors.margins: {
                                left: 20
                            }
                        }

                }

            }
               RowLayout {
                id: quiet1
                anchors.top: modest1.bottom
                anchors.left: parent.left
                anchors.right: parent.right
                height: parent.height * 0.25
                spacing: 20
                RadioButton {
                    id: quiet
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    exclusiveGroup: experienceGroup
                    anchors.margins: {
                        left: 20
                    }
                    Layout.preferredWidth: 170
                    style: RadioButtonStyle {
                        label: Text {
                            font.pixelSize: 22
                            text: "Quiet"
                            color: "#fff"
                        }
                        indicator: Image {
                            source: control.checked ? "../images/07.svg" : "../images/10.svg"
                            sourceSize.width: 30
                            sourceSize.height: 30
                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    if(control.checked === true)
                                        control.checked = false
                                    control.checked = true
                                }
                            }
                        }
                    }
                 }
                Text {
                    width: 530
                    font.pixelSize: 18
                    color: "#fff"
                    text: qsTr( "Posts and user flagged by top trusted users will automatically be hidden.")
                    anchors.verticalCenter: parent.verticalCenter
                    verticalAlignment: Text.AlignTop
                    wrapMode: Text.WordWrap
                    anchors.right: parent.right
                    Layout.fillWidth: true
                    anchors.margins: {
                        left: 20
                    }
                }
            }
               Rectangle {
                   id: muted1
                   anchors.top: quiet1.bottom
                   anchors.left: parent.left
                   anchors.right: parent.right
                   height: parent.height * 0.25
                                      color: "#902514"

           RowLayout {
               anchors.fill: parent
               spacing: 20
               RadioButton {
                   id: muted
                   anchors.verticalCenter: parent.verticalCenter
                   anchors.left: parent.left
                   exclusiveGroup: experienceGroup
                   anchors.margins: {
                       left: 20
                   }
                   Layout.preferredWidth: 170
                       style: RadioButtonStyle {
                           label: Text {
                               font.pixelSize: 24
                               text: "Muted"
                               color: "#fff"
                           }
                           indicator: Image {
                               source: control.checked ? "../images/07.svg" : "../images/10.svg"
                               sourceSize.width: 30
                               sourceSize.height: 30
                               MouseArea {
                                   anchors.fill: parent
                                   onClicked: {
                                       if(control.checked === true)
                                           control.checked = false
                                       control.checked = true
                                   }
                               }
                           }
                       }
                   }
               Column {
                       anchors.verticalCenter: parent.verticalCenter
                       spacing: 5
                       anchors.right: parent.right
                       Layout.fillWidth: true
                       anchors.margins: {
                           left: 20
                       }
                       Text {
                           font.pixelSize: 18
                           color: "#fff"
                           text: qsTr("Only posts made by those you follow and whom they follow (and so on) will be shown.")
                           fontSizeMode: Text.FixedSize
                           verticalAlignment: Text.AlignTop
                           wrapMode: Text.WordWrap
                           width: parent.width
                        }
                       Text {
                           id: warningMuted
                           font.pixelSize: 14
                           color: "#fff"
                           text: qsTr("<i>This mode is very limiting and is not recommended.</i>")
                           verticalAlignment: Text.AlignTop
                           wrapMode: Text.WordWrap
                           width: parent.width
                       }
                   }
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
        anchors.margins: {
            left: 20
            right: 20
        }
        color: "transparent"
        ForwardButton {
            id: confirmButton
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            onClicked: {
                wizardStack.push(Qt.resolvedUrl('privacySetting.qml'))
                profileStack.push(Qt.resolvedUrl('profilePrivacy.qml'))
            }

        }

        BackButton {
            id: back
            anchors.left: parent.left
        }
    }

}
