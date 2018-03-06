import QtQuick 2.7
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
ComboBox {
    id: control
    model: ["BTC", "DOGE"]
    inputMethodHints: Qt.ImhNoAutoUppercase
    editable: true
    style: ComboBoxStyle{
        label:Label {
            verticalAlignment: Qt.AlignVCenter
              anchors.left: parent.left
              anchors.leftMargin: 5
              text: control.currentText
              color: !control.enabled ? "#DADAD9" : "#6F6E6E"
              anchors.fill: parent
              font.pixelSize: 22
         }
    }
}
