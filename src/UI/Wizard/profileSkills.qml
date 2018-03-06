import QtQuick 2.7
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3

Item {
    width: 500
    height: 800
    Text {
        id: skillsTitle
        anchors.left: parent.left
        anchors.leftMargin: 30
        text: qsTr("Skills")
        font.pixelSize: 24
        color: "#fff"
    }
    Rectangle {
        height: 1
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: skillsTitle.bottom
        anchors.topMargin: 5
    }
    ScrollView {
        id: content
        anchors.top: skillsTitle.bottom
        anchors.topMargin: 45
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        ListView {
            anchors.fill: parent
            model: wizard.selectedSkills
            delegate: rowDelegate2
        }
    }

    Component {
        id: rowDelegate2
        Rectangle {
            color: "#BD9CBE"
            height: childrenRect.height
            anchors.right: parent.right
            anchors.left: parent.left
            Row {
                anchors.right: parent.right
                anchors.left: parent.left
                spacing: 10
                Text {
                    text: name
                    font.pixelSize: 18
                }
                Column {
                    Repeater {
                        model: sub_categories
                        Text {
                            text: name
                            font.pixelSize: 18
                        }
                    }
                }
            }
        }
    }
    Component.onCompleted: {
    }

}
