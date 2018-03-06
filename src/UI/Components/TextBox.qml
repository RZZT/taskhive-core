import QtQuick 2.7
import QtQuick.Controls 1.4

ScrollView {
    id: scrollView
        property alias text: control.text
    anchors.right: parent.right
    anchors.left: parent.left
     function clearText(){
         control.text = ''
     }
     TextArea {
         id: control
         width: parent.width
         height: parent.height
            wrapMode: TextEdit.WordWrap
            font.pixelSize: 18
        }
    }

