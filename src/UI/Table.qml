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
        delegate: Row {
            id: rowContent
            width: parent.width
            spacing: 1
            Repeater {
                id: repeaterContent
                model: modelData
                Rectangle {
                    color: "transparent"
                    width: headerModel[index].width
                    height: 30
                    Label {
                        text: modelData
                        font { family: localFont.name; pixelSize: 14; }
                        padding: 10
                        anchors.verticalCenter: parent.verticalCenter
                        color: "#FFFFFF"
                    }
                }
            }
        }
    }
}
