import QtQuick 2.5
import QtQuick.Controls 2.3
import QtQuick.Controls.Styles 1.4
RadioButton {
    id: control
    property variant radioLabel
    contentItem: Text {
        text: control.text
        font: control.font
        opacity: enabled ? 1.0 : 0.3
        color: "#ffffff"
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter

    }
    indicator: Image {
        source: control.checked ? "../images/07.svg" : "../images/10.svg"
        sourceSize.width: 30
        sourceSize.height: 30
        MouseArea {
            anchors.fill: parent
            onClicked: {
                if(control.checked === true)
                    control.checked = false
                control.checked = true
            }
        }
    }
}
