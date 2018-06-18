import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.2
import QtQuick.Window 2.2
import "Components/"
Window {
    id: inboxWindow
    width: 800
    height: 600
    color: "#3D3D3D"

    property variant messages: []
    property variant selectedMessage: ListModel
    property variant parent

    Rectangle {
        id: rectangle
        width: 800
        height: 600
        anchors.fill: parent
        color: "transparent"
        Rectangle {
            id: row
            color: "transparent"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.topMargin: 30
            height: 30
            Text {
                text: qsTr("Messages")
                color: "#FFFFFF"
                font { family: localFont.name; pixelSize: 16; bold:true }
                anchors.left: parent.left
                anchors.leftMargin: 30
            }
            Image {
                source: "images/09.svg"
                height: 30
                anchors.rightMargin: 30
                width: 30
                anchors.right: parent.right
            }
        }

        Component {
            id: headerInbox
            Rectangle {
                anchors.right: parent.right
                anchors.left: parent.left
                height: 25
                color: "#CCCCCC"
                Rectangle {
                    id: empty
                    color: "transparent"
                    width: 50
                    height: parent.height
                }

                Rectangle {
                    id: subject
                    color: "transparent"
                    width: 150
                    height: parent.height
                    anchors.left: empty.right
                    Text {
                        wrapMode: Text.WordWrap
                        color: "#3D3D3D"
                        text: qsTr("Subject")
                        font { family: localFont.name; pixelSize: 16}
                    }
                }
                Rectangle {
                    id: content
                    color: "transparent"
                    width: 200
                    height: parent.height
                    anchors.left: subject.right
                    Text {
                        wrapMode: Text.WordWrap
                        color: "#3D3D3D"
                        text: qsTr("Content")
                        font { family: localFont.name; pixelSize: 16}
                    }
                }
                Rectangle {
                    id: task
                    color: "transparent"
                    width: 200
                    height: parent.height
                    anchors.left: content.right
                    Text {
                        wrapMode: Text.WordWrap
                        color: "#3D3D3D"
                        text: qsTr("Task")
                        font { family: localFont.name; pixelSize: 16}
                    }
                }
                Rectangle {
                    id: from
                    color: "transparent"
                    width: 100
                    height: parent.height
                    anchors.left: task.right
                    Text {
                        wrapMode: Text.WordWrap
                        color: "#3D3D3D"
                        text: qsTr("FROM")
                        font { family: localFont.name; pixelSize: 16}
                    }
                }
            }
        }
        Component {
            id: inboxList
            Rectangle {
                id: parentContent
                anchors.right: parent.right
                anchors.left: parent.left
                height: 50
                color: "transparent"
                Row {
                    anchors.fill: parent
                    CheckBox {
                        width: 40
                        height: 40
                    }
                    Text {
                        font { family: localFont.name; pixelSize: 16}
                        wrapMode: Text.WordWrap
                        color: "#FFF"
                        text: modelData.fromAddress
                        width: 150
                    }
                    Text {
                        font { family: localFont.name; pixelSize: 16}
                        wrapMode: Text.WordWrap
                        color: "#FFF"
                        text: modelData.body
                        width: 200
                    }
                }
                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor
                    onDoubleClicked: {
                        parentContent.ListView.view.currentIndex = index
                        parentContent.forceActiveFocus()
                        inboxWindow.selectedMessage = parentContent.ListView.view.model[index]
                        print("JSON STRING: " +JSON.stringify(inboxWindow.selectedMessage))
                        var component = Qt.createComponent("MessageWindow.qml")
                        var task_window = component.createObject(inboxWindow)
                        print(component.errorString())
                        task_window.show()

                    }
                }
            }
        }
        ListView {
            id: msgList
            anchors.rightMargin: 30
            anchors.topMargin: 20
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            anchors.top: row.bottom
            anchors.left: parent.left
            anchors.leftMargin: 30
            delegate: inboxList
            spacing: 10
            header: headerInbox
            model: inboxWindow.messages
            focus: true
        }
    }

    Connections {
        target: Message
        onMsgThread: {
            for(var i=0;i<msg.length;i++){
                inboxWindow.messages.push({"fromAddress": msg[i].fromAddress, "body": msg[i].messageThread[0].payload.body})
            }
            msgList.model = inboxWindow.messages;
        }
    }
    Component.onCompleted: {
        print(window.inboxOpen)
        if(window.inboxOpen){
            Message.getMessageThread('EMPTY')
        }
        else {
            Message.getMessageThread(window.selectedTask.task_id)
        }
    }
    onClosing: {
        window.inboxOpen = false
    }
}
