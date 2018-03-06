import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Controls 2.0
import "Components/"
Window {
    id: messageWindow
    width: 400
    height: 600
    minimumHeight: 600
    minimumWidth: 400
    color: "#3D3D3D"
    property ListModel messages: ListModel {}
    property var msg
    Rectangle {
        anchors.top: parent.top
        anchors.bottom: rectRow.top
        anchors.right: parent.right
        anchors.left: parent.left
        color: "transparent"
        ListView {
            anchors.fill: parent
            anchors.topMargin: 10
            delegate: message
            spacing: 10
            model: messageWindow.messages
        }
        Component {
            id: message
            Column{
                anchors.right: parent.right
                anchors.left: parent.left
                readonly property bool sentByMe: modelData.public_key === window.userData.public_key
                spacing: 10
                Text {
                    text: sentByMe ? "You": public_key
                    font.pixelSize: 18
                    color: "#fff"
                    anchors.left: sentByMe ? parent.left: undefined
                    anchors.leftMargin: 20
                    anchors.right: !sentByMe ? parent.right: undefined
                    anchors.rightMargin: 20

                }
                Rectangle {
                    anchors.right: parent.right
                    anchors.left: parent.left
                    height: childrenRect.height

                    radius: 4
                    anchors.rightMargin: 20
                    anchors.leftMargin: 20
                    Text {
                        text: body
                        anchors.right: parent.right
                        anchors.rightMargin: 10
                        anchors.leftMargin: 10
                        anchors.left: parent.left
                        font.pixelSize: 18
                        wrapMode: Text.WordWrap
                    }
                }
            }
        }
    }
    Row {
        id: rectRow
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.bottomMargin: 20
        anchors.bottom: parent.bottom
        anchors.leftMargin: 20
        anchors.rightMargin: 20
        spacing: 10
        TextArea {
            id: messageText
            height: 150
            font.pixelSize: 12
            width: rectRow.width - 50
            background: Rectangle {
                anchors.fill: parent
            }

        }
        Button {
            height: 40
            width: 40
            text: "Send"
            onClicked: {
                messageWindow.messages.append({"body": messageText.text, "public_key": window.userData.public_key })
                if(window.selectedTask.task_owner === window.userData.public_key){
                    var messageInfo = {
                    "bit_address": inboxWindow.selectedMessage.fromAddress,
                    "task_id": taskWindow.task.task_id,
                    "body": messageText.text,
                    "public_key": window.userData.public_key
                    }
                }
                else {
                    var messageInfo = {
                    "bit_address": taskWindow.task.task_address,
                    "task_id": taskWindow.task.task_id,
                    "body": messageText.text,
                    "public_key": window.userData.public_key
                    }
                }
                

                messageText.text = ''
                Message.sendMessage(messageInfo)
            }
        }
    }

    Connections {
        target: Message
        onMsgThread: {
            if(msg.length !== 0){
                var mes = msg[0].messageThread
                for(var i = 0; i<mes.length; i++){
                    messageWindow.messages.append(mes[i].payload)
                }
            }
        }
    }
    Component.onCompleted:  {
        if(window.selectedTask.task_owner === window.userData.public_key){
            print("OPTION 1")
            Message.getMessageThread(window.selectedTask.task_id, inboxWindow.selectedMessage.fromAddress)
        }
        else {
            Message.getMessageThread(window.selectedTask.task_id, window.selectedTask.bit_address)
        }
    }
}
