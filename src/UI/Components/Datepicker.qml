import QtQuick 2.0
import QtQuick.Controls 1.4
Rectangle{
    width: 120
    height: 40
    property alias text: item2.text
    LineEdit {
        id: item2
        readOnly: true
        height: parent.height
        width: parent.width
    }
    Calendar {
        id: calendar
        visible: false
        anchors.top: parent.bottom
        anchors.left: parent.left
        z: 0
        onClicked: {
            item2.text = Qt.formatDate(calendar.selectedDate,"dd/MM/yyyy")
            print(Qt.formatDate(calendar.selectedDate,"dd/MM/yyyy"))
            calendar.visible = false
        }
    }
    MouseArea {
        anchors.fill: parent
        onClicked: {
            calendar.visible = true
        }
    }
}
