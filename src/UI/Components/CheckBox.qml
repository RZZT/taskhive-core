import QtQuick 2.6
import QtQuick.Controls 2.1

CheckBox {
    id: control
    text: qsTr("CheckBox")

    indicator: Rectangle {
        implicitWidth: 26
        implicitHeight: 26
        x: control.leftPadding
        y: parent.height / 2 - height / 2
        radius: 3
        border.color: control.down ? "#0c0c0c" : "#FFF"
        color: "transparent"
        Rectangle {
            width: 14
            height: 14
            x: 6
            y: 6
            color: control.down ? "#0c0c0c" : "#FFF"
            visible: control.checked
        }
    }

    contentItem: Text {
        text: control.text
        font: control.font
        opacity: enabled ? 1.0 : 0.3
        color: control.down ? "#FFF" : "#FFF"
        verticalAlignment: Text.AlignVCenter
        leftPadding: control.indicator.width + control.spacing
    }
}
