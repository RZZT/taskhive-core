import QtQuick 2.6
import QtQuick.Controls 2.3
RadioButton {
    id: control
    spacing: 5
    contentItem: Text {
        text: control.text
        font { family: localFont.name; pixelSize: 16; }
        opacity: enabled ? 1.0 : 0.3
        color: "#ffffff"
        verticalAlignment: Text.AlignVCenter
        leftPadding: control.indicator.width + control.spacing
    }
    indicator: Image {
        id: indicator
        anchors.verticalCenter: parent.verticalCenter
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
