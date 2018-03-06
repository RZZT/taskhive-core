import QtQuick 2.0

Item {
    id: lineEditItem
    property int fontSize: 18
    property alias readOnly: input1.readOnly
    property alias text: input1.text
    property alias validator: input1.validator
    property alias length: input1.length
    property alias acceptableInput: input1.acceptableInput
    signal accepted()

    Rectangle {
            anchors.fill: parent
            anchors.bottomMargin: 1
            color: "#DBDBDB"
        }

        Rectangle {
            anchors.fill: parent
            anchors.topMargin: 1
            color: "#FFF"
        }
        Input {
            id: input1
            anchors.fill: parent
            anchors.leftMargin: 4
            anchors.rightMargin: 3
            font.pixelSize: parent.fontSize
            onAccepted: lineEditItem.accepted()

        }

}
