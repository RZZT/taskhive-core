import QtQuick 2.0

Item {
    id: component
    Rectangle {
        anchors.fill: parent
        color: "#DBDBDB"
    }
    Rectangle {
        anchors.fill: parent
        anchors.topMargin: 1
        color: "#FFFFFF"
        //radius: 4

        Item {
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            width: 45

            Image {
                anchors.centerIn: parent
                source: "../images/icon-search.svg"
            }
        }

        Input {
            id: input
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            anchors.leftMargin: 45
            font.pixelSize: 18
            verticalAlignment: TextInput.AlignVCenter
            placeholderText: qsTr("Search by...")
            onTextChanged: {
                    if(droplist.height === 0) {
                        window.currentItem = dropdown
                        droplist.height = dropcolumn.height + 2
                    } else {
                        droplist.height = 0
                    }
            }
        }

        Item {
            id: dropdown
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            anchors.left: parent.left

            function hide() { droplist.height = 0 }
            function containsPoint(px, py) {
                if(px < 0)
                    return false
                if(px > width)
                    return false
                if(py < 0)
                    return false
                if(py > height + droplist.height)
                    return false
                return true
            }

        }

        Rectangle {
            id: droplist

            anchors.left: input.left
            anchors.right: parent.right
            height: 0
            clip: true
            x: dropdown.x
            y: dropdown.height
            border.width: 1
            border.color: "#DBDBDB"
            color: "#FFFFFF"

            Rectangle {
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.leftMargin: 1
                anchors.rightMargin: 1
                height: 1
                color: "#FFFFFF"
            }

            Behavior on height {
                NumberAnimation { duration: 100; easing.type: Easing.InQuad }
            }

            ListModel {
                id: dropdownModel
                ListElement { name: "NAME" }
                ListElement { name: "DESCRIPTION" }
                ListElement { name: "ADDRESS" }
            }
            Column {
                id: dropcolumn
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.margins: 1

                Repeater {
                    model: dropdownModel
                    delegate: Rectangle {
                        anchors.left: parent.left
                        anchors.right: parent.right
                        height: 30
                        color: delegateArea.pressed ? "#4A4646" : "#FFFFFF"

                        Text {
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: parent.left
                            anchors.right: parent.right
                            elide: Text.ElideRight
                            anchors.leftMargin: 12
                            anchors.rightMargin: 12
                            font.family: "Arial"
                            font.bold: true
                            font.pixelSize: 12
                            color: delegateArea.pressed ? "#FFFFFF" : "#4A4646"
                            text: name
                        }

                        MouseArea {
                            id: delegateArea
                            anchors.fill: parent
                            onClicked: {
                                droplist.height = 0
                                input.text = name
                            }
                        }
                    }
                }
            }
        }
    }
}
