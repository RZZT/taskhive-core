import QtQuick 2.0
import QtQuick.Controls 1.2
import QtGraphicalEffects 1.0
import "../"
import "../Components/"
Item {
    Rectangle {
        color: "transparent"
        anchors.fill: parent
        anchors.margins: {
            top: 20
            bottom: 20
        }
        Text {
                id: title
                anchors.left: parent.left
                anchors.top: parent.top
                text: qsTr("Startup Wizard")
                font.pixelSize: 42
                font.bold: true
                color: "#fff"
            }
        Text {
            anchors.top: title.bottom
            text: qsTr("You need an identity.\nLet's make one.")
            font.pixelSize: 38
            color: "#fff"
        }
        Text {
            id: uniqueHandleText
            text: qsTr("Choose a unique handle.")
            font.pixelSize: 28
            color: "#fff"
            anchors.verticalCenter: parent.verticalCenter
        }
        Rectangle{
            id: searchHandleRec
            anchors.top: uniqueHandleText.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            height: 70
            color: "transparent"
            SearchBar {
                id: searchHandle
                height: 60
                showIcon: false
                anchors.right: confirmButton.left
                anchors.left: parent.left
                popupHeight: 0
                resultBackgroundColor: "#F3F3F3"
                anchors.rightMargin: 50
            }
            Image {
                id: confirmButton
                sourceSize.height: 60
                sourceSize.width: 60
                anchors.right: parent.right
                source: Qt.resolvedUrl('../images/01.svg')
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                   if(searchHandle.textValue != ""){
                       wizardStack.push(Qt.resolvedUrl('skills.qml'))
                       profileStack.push(Qt.resolvedUrl('profileSkills.qml'))
                       wizard.handle = searchHandle.textValue
                       wizard.categories = TaskhiveCategories.getCategories()['categories']
                   }
               }
               onPressed: {
                   overlay.visible = true
               }
               onReleased: {
                   overlay.visible = false
               }
                }

            }
            ColorOverlay {
                id: overlay
                anchors.fill: confirmButton
                source: confirmButton
                color: "blue"
                visible: false
                opacity: 0.2

            }
        }
        Text {
            id: warningText
            text: qsTr("Choose wisely: It can never be changed.")
            z: -1
            anchors.topMargin: 0
            font.pixelSize: 18
            color: "#fff"
            anchors.top: searchHandleRec.bottom
        }

    }

}
