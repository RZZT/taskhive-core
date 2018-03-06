import QtQuick 2.0
import QtGraphicalEffects 1.0
Item {
    property int sizeH: 80
    property int sizeW: 80
    property bool first: false
    height: sizeH
    width: sizeW
    Image {
        id: back
        sourceSize.height: sizeH
        sourceSize.width: sizeW
        source: "../images/06.svg"
        MouseArea {
            anchors.fill: parent
       onClicked: {
           wizardStack.pop()
           if(!first){
               profileStack.pop()
           } else {
               profileStack.clear()
           }
       }
        }
    }
    ColorOverlay {
        id: overlay
        anchors.fill: back
        source: back
        color: "blue"
        visible: false
        opacity: 0.2

    }
}
