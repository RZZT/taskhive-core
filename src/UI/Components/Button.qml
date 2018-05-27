import QtQuick 2.6
import QtQuick.Controls 2.1

Button {
    id: control
    text: qsTr("Button")

    contentItem: Text {
        text: control.text
        opacity: enabled ? 1.0 : 0.3
        color: control.down ? "#0c0c0c" : "#0c0c0c"
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
        font { family: localFont.name; pixelSize: 16;}
    }

    background: Rectangle {
        implicitWidth: 100
        implicitHeight: 40
        opacity: enabled ? 1 : 0.3
        border.color: control.down ? "#3F3F3F" : "#FFF"
        border.width: 1
        radius: 2
    }
}
