import QtQuick 2.6
import QtQuick.Controls 2.3

TabButton {
    id: control
    text: qsTr("Requests")

    contentItem: Text {
        text: control.text
        font: control.font
        opacity: enabled ? 1.0 : 0.3
        color: control.down ? "#666666" : "#ffffff"
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
    }
    background: Rectangle {
        implicitWidth: 100
        width: control.width
        implicitHeight: 40
        opacity: enabled ? 1 : 0.3
        border.color: control.down ? "#666666" : "#ffffff"
        border.width: 1
        radius: 2

    }
}

