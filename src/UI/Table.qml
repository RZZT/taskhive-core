import QtQuick 2.7
import QtQuick.Controls 2.0
Item {
    id: table
    anchors.rightMargin: 20
    anchors.right: parent.right
    anchors.left: parent.left
    anchors.top: titleLayout.bottom
    anchors.bottom: parent.bottom
    anchors.leftMargin: 30
    property var model: model
    property var headerModel: [{"name":"Title", "width":185}, {"name":"Description", "width":200}, {"name":"Payment Methods", "width":150}, {"name":"Escrow Required", "width":150}, {"name":"Currency", "width":100}, {"name":"Cost", "width":100}, {"name":"Deadline", "width":100}]

    function toString(list) {
        var strn = ""
        for(var i=0;i<=list.length;i++) {
            if(i===list.length) {
                strn = strn +  list[i]
                return strn
            }

            strn = strn +  list[i] + ", "
            return strn
        }
    }

    ListView {
        id: tableList
        anchors.fill: parent
        flickableDirection: Flickable.VerticalFlick
        model: table.model
        headerPositioning: ListView.OverlayHeader
        header: Rectangle {
            color: "#cccccc"
            width: table.width
            height: 30
            Row {
                id: rowHeader
                width: parent.width
                spacing: 1
                Repeater {
                    id: repeater
                    model: table.headerModel
                    Rectangle {
                        width: modelData.width
                        height: 30
                        Label {
                            text: modelData.name
                            font { family: localFont.name; pixelSize: 14; }
                            padding: 10
                            anchors.verticalCenter: parent.verticalCenter
                        }
                    }
                }
            }
        }
        delegate: Item {
                width: parent.width
                height: 40
                id: parentContent
                Row {
                    id: rowContent
                    width: parent.width
                    spacing: 1
                    Rectangle {
                        color: "transparent"
                        width: 185
                        height: 30
                        Text {
                            text: modelData.task_title
                            font { family: localFont.name; pixelSize: 14; }
                            padding: 10
                            anchors.verticalCenter: parent.verticalCenter
                            color: "#FFFFFF"
                        }
                    }
                    Rectangle {
                        color: "transparent"
                        width: 200
                        height: 30
                        Text {
                            text: modelData.task_body
                            font { family: localFont.name; pixelSize: 14; }
                            padding: 10
                            anchors.verticalCenter: parent.verticalCenter
                            color: "#FFFFFF"
                        }
                    }
                    Rectangle {
                        color: "transparent"
                        width: 150
                        height: 30
                        Text {
                            text: toString(modelData.task_payment_methods)
                            font { family: localFont.name; pixelSize: 14; }
                            padding: 10
                            anchors.verticalCenter: parent.verticalCenter
                            color: "#FFFFFF"
                        }
                    }
                    Rectangle {
                        color: "transparent"
                        width: 150
                        height: 30
                        Text {
                            text: modelData.task_escrow_required
                            font { family: localFont.name; pixelSize: 14; }
                            padding: 10
                            anchors.verticalCenter: parent.verticalCenter
                            color: "#FFFFFF"
                        }
                    }
                    Rectangle {
                        color: "transparent"
                        width: 100
                        height: 30
                        Text {
                            text: modelData.task_currency
                            font { family: localFont.name; pixelSize: 14; }
                            padding: 10
                            anchors.verticalCenter: parent.verticalCenter
                            color: "#FFFFFF"
                        }
                    }
                    Rectangle {
                        color: "transparent"
                        width: 100
                        height: 30
                        Text {
                            text: modelData.task_cost
                            font { family: localFont.name; pixelSize: 14; }
                            padding: 10
                            anchors.verticalCenter: parent.verticalCenter
                            color: "#FFFFFF"
                        }
                    }
                    Rectangle {
                        color: "transparent"
                        width: 100
                        height: 30
                        Text {
                            text: modelData.task_deadline
                            font { family: localFont.name; pixelSize: 14; }
                            padding: 10
                            anchors.verticalCenter: parent.verticalCenter
                            color: "#FFFFFF"
                        }
                    }
                }
                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor
                    onDoubleClicked: {
                        parentContent.ListView.view.currentIndex = index
                        parentContent.forceActiveFocus()
                        window.selectedTask = parentContent.ListView.view.model[index]
                        print("JSON STRING: " +JSON.stringify(window.tasks.offers))
                        var component = Qt.createComponent("TaskInformation.qml")
                        var task_window = component.createObject(window)
                        task_window.show()
                    }
                }
        }
    }
}
