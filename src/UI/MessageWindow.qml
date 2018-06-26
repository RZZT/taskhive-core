import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Controls 2.0
import "Components/"
Window {
    id: messageWindow
    width: 700
    height: 800
    minimumHeight: 800
    minimumWidth: 700
    color: "#3D3D3D"
    /// property ListModel messages: ListModel {}
    property var msg
    property string user: "Client"
    Item {
        anchors.fill: parent
        anchors.leftMargin: 30
        anchors.rightMargin: 30
        ListModel {
            id: messages
            ListElement {
                public_key: "TEST"
                date: "April 4, 2018"
                message: "Cras finibus viverra venenatis. Suspendisse fuegiat gravida dui id tempor. Fusce egestas tempor leo a venenatis. Phasellus elemntum non sem ac imperdiet."
            }
        }

        Text {
            id: title
            text: qsTr("Private Message with ") + messageWindow.user
            anchors.topMargin: 20
            anchors.horizontalCenter: parent.horizontalCenter
            font { family: localFont.name; pixelSize: 16; bold: true }
            color: "#FFFFFF"
            anchors.top: parent.top
        }
        Component {
            id: headerItem
            Rectangle {
                anchors.left: parent.left
                anchors.right: parent.right
                height: 25
                color: "#CCCCCC"
                Text {
                    text: qsTr("Load Older Messages")
                    font { family: localFont.name; pixelSize: 16; bold: true }
                    color: "#000000"
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        print("expand")
                    }
                    cursorShape: Qt.PointingHandCursor
                }
            }
        }

        ListView {
            id: listView
            anchors.bottomMargin: 20
            anchors.top: title.bottom
            anchors.topMargin: 20
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.bottom: messageBody.top
            delegate: message
            spacing: 10
            model: messages
            header: headerItem
            ScrollBar.vertical: ScrollBar {
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 0
                anchors.right: parent.right
                anchors.rightMargin: 0

            }
        }
        Component {
            id: message
            Column{
                anchors.right: parent.right
                anchors.left: parent.left
                readonly property bool sentByMe: public_key === window.userData.public_key
                spacing: 10
                anchors.rightMargin: 10
                Text {
                    id: msgTitle
                    text: sentByMe ? "You - " + date: public_key + " - " + date
                    color: "#fff"
                    font { family: localFont.name; pixelSize: 16; bold: true }
                    anchors.left: sentByMe ? parent.left: undefined
                    anchors.leftMargin: 20
                    anchors.right: !sentByMe ? parent.right: undefined
                    anchors.rightMargin: 20

                }
                Rectangle {
                    height: 1
                    width: parent.width
                    color: "#FFFFFF"
                }
                Text {
                    text: message
                    anchors.right: parent.right
                    anchors.left: parent.left
                    font { family: localFont.name; pixelSize: 16; }
                    color: "#FFFFFF"
                    wrapMode: Text.WordWrap
                }
            }
        }
        TextArea {
            id: messageBody
            height: 150
            anchors.left: parent.left
            anchors.right: parent.right
            font { family: localFont.name; pixelSize: 16}
            anchors.bottom: buttons.top
            background: Rectangle {
                anchors.fill: parent
            }
        }

        Rectangle {
            id: buttons
            height: 100
            width: parent.width
            anchors.bottom: parent.bottom
            color: "transparent"
            Button {
                text: qsTr("Send Message")
                anchors.verticalCenter: parent.verticalCenter
                anchors.rightMargin: 30
                height: 30
                width: 150
                anchors.right: cancel.left
            }
            Button {
                id: cancel
                text: qsTr("Cancel")
                anchors.verticalCenter: parent.verticalCenter
                anchors.rightMargin: 40
                height: 30
                width: 100
                anchors.right: parent.right
                font { family: localFont.name; pixelSize: 16; bold: true }
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
