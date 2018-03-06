import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.2
import QtQuick.Window 2.2
import "Components/"
Window {
    id: inboxWindow
    width: 600
    height: 400
    color: "#3D3D3D"

    property variant messages: []
    property variant selectedMessage: ListModel
    property variant parent
    Rectangle {
        anchors.fill: parent
        color: "transparent"

        Component {
            id: headerInbox
            Rectangle {
                anchors.right: parent.right
                anchors.left: parent.left
                height: 50
                color: "transparent"
                Row {
                    anchors.fill: parent
                    spacing: 10
                    Text {
                        font.pixelSize: 18
                        wrapMode: Text.WordWrap
                        color: "#FFF"
                        text: "Sender"
                    }
                    Item {
                        width: 2
                        height: parent.height  - 25
                    }
                    Rectangle {
                        width: 2
                        height: parent.height  - 25
                        color: "#fff"
                    }
                    Text {
                        font.pixelSize: 18
                        wrapMode: Text.WordWrap
                        color: "#FFF"
                        text: "Message"
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
                    Text {
                        font.pixelSize: 18
                        wrapMode: Text.WordWrap
                        color: "#FFF"
                        text: modelData.fromAddress
                    }
                    Item {
                        width: 4
                        height: parent.height  - 25
                    }
                    Text {
                        font.pixelSize: 18
                        wrapMode: Text.WordWrap
                        color: "#FFF"
                        text: modelData.body
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
            anchors.fill: parent
            anchors.topMargin: 10
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
