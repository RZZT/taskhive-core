import QtQuick 2.0

Item {
    id: container
    property bool selected
    property variant searchItem
    signal clicked()
    Rectangle {
        color: searchbar.resultBackgroundColor
        anchors.fill: parent
        Row {
            anchors.fill: parent
            anchors.leftMargin: 10
            anchors.rightMargin: 10
            spacing: 40
            Text {
                id: resultText
                anchors.leftMargin: 5
                height: parent.height
                font.pointSize: 14
                color: "#fff"
                text: searchItem.name
                verticalAlignment: Text.AlignVCenter
                width: repeater.columnWidths['name']
            }
            Text {
                id: category
                color: "gray"
                opacity: 0.4
                anchors.rightMargin: 5
                font.pointSize: 14
                text: searchItem.category
                height: parent.height
                verticalAlignment: Text.AlignVCenter
                width: repeater.columnWidths['category']
            }
        }

        Rectangle {
            width: parent.width
            height: 1
            anchors.bottom: parent.bottom
        }
    }
}
