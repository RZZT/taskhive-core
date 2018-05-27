import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.2
import QtQuick 2.7

TextField {
    id: itemText
    horizontalAlignment: TextInput.AlignLeft
    font { family: localFont.name; pixelSize: 16}
    style: TextFieldStyle {
        textColor: "#3F3F3F"
        placeholderTextColor: "#BABABA"
        background: Rectangle {
                    border.width: 0
                    width: itemText.width
                    height: itemText.height
                    color: "transparent"
                }
    }
}
