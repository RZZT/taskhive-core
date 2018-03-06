import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import "Components/"
Window {
    id: taskWindow
    modality: Qt.WindowModal
    height: 800
    width: 1200
    property variant task: window.selectedTask
    color: "#0c0c0c"
    Rectangle {
        id: taskSide
        width: parent.width * 0.50
        height: parent.height
        color: "transparent"
        Column {
            id: topBarContent
            anchors.top: parent.top
            anchors.topMargin: 20
            anchors.right: parent.right
            anchors.left: parent.left

            Item {
                id: item1
                height: 60
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.leftMargin: 20
                anchors.rightMargin: 10
                Text {
                    text: task.task_type
                    anchors.verticalCenter: parent.verticalCenter
                    color: "#fff"
                    font.pixelSize: 26
                    verticalAlignment: Text.AlignVCenter
                }
                Row {
                    anchors.right: parent.right
                    anchors.rightMargin: 20
                    spacing: 5
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.topMargin: 2
                    anchors.bottomMargin: 2
                    Rectangle {
                        height: 40
                        width: 40
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                print(taskWindow.task.task_owner)
                                print(window.userData.public_key)
                                if(taskWindow.task.task_owner === window.userData.public_key){
                                    var inboxComponent = Qt.createComponent("InboxWindow.qml")
                                    var inbox_window = inboxComponent.createObject(taskWindow)
                                    print(inboxComponent.errorString())
                                    inbox_window.show()
                                }
                                else {
                                    var component = Qt.createComponent("MessageWindow.qml")
                                    var message_window = component.createObject(taskWindow)
                                    message_window.show()
                                }
                            }
                        }
                    }
                    Rectangle {
                        height: 40
                        width: 40
                    }
                }

            }
            Rectangle {
                height: 50
                anchors.left: parent.left
                anchors.right: parent.right
                Text {
                    text: task.task_title
                    anchors.left: parent.left
                    anchors.leftMargin: 20
                    anchors.verticalCenter: parent.verticalCenter
                    color: "#3F3F3F"
                    font.pixelSize: 18
                    verticalAlignment: Text.AlignVCenter
                }

            }


        }
        Item {
            anchors.top: topBarContent.bottom
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.leftMargin: 20
            anchors.rightMargin: 10
            Text {
                id: textBody
                width: parent.width - 20
                wrapMode: Text.WordWrap
                text: task.task_body
                color: "#FFF"
                font.pixelSize: 18
                anchors.top: parent.top
                anchors.topMargin: 20
            }
            Row {
                id: moneyRelated
                anchors.top: textBody.bottom
                anchors.topMargin: 20
                anchors.left: parent.left
                anchors.right: parent.right
                Column {
                    spacing: 10
                    width: parent.width / 3
                    Text {
                        id: taskCostTitle
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: "Task Cost"
                        font.pixelSize: 18
                        color: "#FFF"
                    }
                    Rectangle {
                        height: 2
                        width: parent.width

                    }
                    Text {
                        id: taskCost
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: task.task_cost
                        font.pixelSize: 18
                        color: "#FFF"
                    }
                }
                Column {
                    id: column
                    spacing: 10
                    width: parent.width / 3
                    Text {
                        id: paymentMethodTitle
                        text: "Payment Methods"
                        anchors.horizontalCenter: parent.horizontalCenter
                        font.pixelSize: 18
                        color: "#FFF"
                    }
                    Rectangle {
                        height: 2
                        width: parent.width

                    }
                    Text {
                        id: paymentMethod
                        text: "BTC, DOGE, XMR"
                        font.pixelSize: 18
                        anchors.horizontalCenter: parent.horizontalCenter
                        color: "#FFF"
                    }
                }
                Column {
                    spacing: 10
                    width: parent.width / 3
                    Text {
                        id: taskCurrencyTitle
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: "Currency"
                        font.pixelSize: 18
                        color: "#FFF"
                    }
                    Rectangle {
                        height: 2
                        width: parent.width

                    }
                    Text {
                        id: taskCurrency
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: task.task_currency
                        font.pixelSize: 18
                        color: "#FFF"
                    }
                }
            }
            Text {
                id: attTitle
                text: "Attachments"
                font.pixelSize: 18
                color: "#FFF"
                anchors.top: moneyRelated.bottom
                anchors.topMargin: 20
            }
            Rectangle {
                height: 2
                width: parent.width
                anchors.top: attTitle.bottom
                anchors.topMargin: 2
            }
            ListView {
            }
        }

    }
    Rectangle {
        id: separator
        anchors.left: taskSide.right
        width: 2
        height: parent.height
    }
    Rectangle {
        id: profileSide
        width: (parent.width * 0.50) - 2
        height: parent.height
        color: "transparent"
        anchors.left: separator.right
        Rectangle {
            id: profilePicture
            anchors.topMargin: 15
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.leftMargin: 10
            width: 100
            height: 100
        }
        Column {
            id: column1
            anchors.right: parent.right
            anchors.left: parent.left
            spacing: 10
            anchors.top: parent.top
            anchors.topMargin: 5
            topPadding: 5
            RatingHoneycomb {
                anchors.right: parent.right
                anchors.rightMargin: 20
                visible: true
                clip: false
                Layout.fillHeight: false
                Layout.fillWidth: false
            }
            Rectangle {
                id: rectangle
                height: 50
                anchors.left: parent.left
                anchors.right: parent.right

                Text {
                    text: "vfxmaster"
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 20
                    anchors.left: parent.left
                    anchors.leftMargin: 120
                    verticalAlignment: Text.AlignVCenter
                }
            }
        }

    }
}
