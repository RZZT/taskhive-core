import QtQuick 2.6
import QtQuick.Controls 2.1

ComboBox {
    id: control
    model: ["First", "Second", "Third"]

    delegate: ItemDelegate {
        width: control.width
        contentItem: Text {
              verticalAlignment: Qt.AlignVCenter
              anchors.left: parent.left
              anchors.leftMargin: 5
              text: modelData
              color: !control.enabled ? "#DADAD9" : "#6F6E6E"
              anchors.fill: parent
              font { family: localFont.name; pixelSize: 16; bold: true}
        }
        highlighted: control.highlightedIndex === index
    }

    contentItem: Text {
        leftPadding: 10
        rightPadding: control.indicator.width + control.spacing

        verticalAlignment: Qt.AlignVCenter
        text: control.displayText
        color: control.pressed ? "#DADAD9" : "#6F6E6E"
        elide: Text.ElideRight
        font { family: localFont.name; pixelSize: 16; bold: true}
    }
    popup: Popup {
        y: control.height - 1
        width: control.width
        implicitHeight: contentItem.implicitHeight
        padding: 1

        contentItem: ListView {
            clip: true
            implicitHeight: contentHeight
            model: control.popup.visible ? control.delegateModel : null
            currentIndex: control.highlightedIndex

            ScrollIndicator.vertical: ScrollIndicator { }
        }

        background: Rectangle {
            border.color: "#6F6E6E"
            radius: 2
        }
    }
}
