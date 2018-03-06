import QtQuick 2.7
import QtQuick.Controls 2.3
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.3
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3
import QtQml 2.2
Item {
    id: item1
    property variant subCategory: wizard.categories.sub_categories
    Rectangle {
        id: rectangle
        anchors.fill: parent
        color: "transparent"
        Text {
                id: title
                anchors.left: parent.left
                anchors.top: parent.top
                text: qsTr("Startup Wizard")
                font.pixelSize: 42
                font.bold: true
                color: "#fff"
                anchors.margins: {
                    left: 20
                }
            }
        Text {
            id: extra
            anchors.top: title.bottom
            text: qsTr("What are you good at?")
            font.pixelSize: 38
            color: "#fff"
            anchors.leftMargin: 20
            anchors.left: parent.left
        }
        Text {
            id: uniqueHandleText
            text: qsTr("Let's choose your skills.")
            anchors.top: extra.bottom
            font.pixelSize: 32
            color: "#fff"
            anchors.leftMargin: 20
            anchors.left: parent.left
        }
        ListView {
            id: frame
            anchors.top: uniqueHandleText.bottom
            anchors.topMargin: 100
            anchors.right: parent.right
            anchors.left: parent.left
            height: 180
            model: wizard.categories
            orientation: ListView.Horizontal
            flickableDirection: Flickable.AutoFlickDirection
            interactive: true
            boundsBehavior: Flickable.StopAtBounds
            focus: true
            highlight: Rectangle { color: "#BD9CBE";}
            highlightFollowsCurrentItem: true
            delegate: Rectangle {
                property bool selected: false
                property alias text: mainText.text
                id: wrapper
                height: 180
                width: 200
                color: wrapper.ListView.isCurrentItem ? "#BD9CBE": "#737373"
                Text {
                    id: mainText
                    text: modelData.name
                    font.pixelSize: 18
                    horizontalAlignment: Text.AlignHCenter
                    anchors.verticalCenter: parent.verticalCenter
                    elide: Text.ElideRight
                    width: parent.width
                    wrapMode: Text.WordWrap
                    color: "#FFFFFF"
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                       frame.currentIndex = index
                    }
                }
            }
            ScrollBar.horizontal: ScrollBar {}
        }
        StackLayout {
            id: stack1
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: buttons.top
            anchors.top: frame.bottom
            currentIndex: frame.currentIndex
            Repeater {
                model: wizard.categories
                Item {
                    id: homeTab
                    ListView {
                        id: subTab
                        anchors.right: parent.right
                        anchors.left: parent.left
                        height: 180
                        model: modelData.sub_categories
                        orientation: ListView.Horizontal
                        flickableDirection: Flickable.AutoFlickDirection
                        boundsBehavior: Flickable.StopAtBounds
                        ScrollBar.horizontal: ScrollBar {}
                        delegate: Rectangle {
                            id: wrapper2
                            property bool selected: false
                            height: 180
                            width: 200
                            color: wrapper2.ListView.isCurrentItem ? "#BD9CBE": "#737373"
                            Text {
                                id: textElement
                                text: modelData.name
                                font.pixelSize: 18
                                horizontalAlignment: Text.AlignHCenter
                                anchors.verticalCenter: parent.verticalCenter
                                width: parent.width
                                elide: Text.ElideRight
                                wrapMode: Text.WordWrap
                                color: "#FFFFFF"
                            }
                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                   subTab.currentIndex = index
                                }
                                onDoubleClicked: {
                                    var found = false;
                                    var someText = frame.currentItem.text;
                                    if(!wrapper2.selected)
                                    {
                                        print(someText)
                                        for(var i = 0; i<wizard.selectedSkills.count; i++){
                                            if(wizard.selectedSkills.get(i).name === someText){
                                                wizard.selectedSkills.get(i).sub_categories.append({"name":textElement.text});
                                                wizard.skills.push({"name": someText})
                                                found = true;
                                            }
                                        }
                                        if(!found){
                                            print(textElement.text)
                                            wizard.selectedSkills.append({"name":someText, "sub_categories":[{"name":textElement.text}]})
                                        }
                                    }
                                    wrapper2.selected = true
                                    print(window.selectedSkills)
                                }
                            }
                        }
                    }
                }
            }
        }
        Rectangle{
            id: buttons
            height: wizard.height * 0.10
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            color: "transparent"
            anchors.margins: {
                left: 20
                right: 20
            }
            ForwardButton {
                id: confirmButton
                anchors.right: parent.right
                onClicked: {
                    wizardStack.push(Qt.resolvedUrl('portfolio.qml'))
                    profileStack.push(Qt.resolvedUrl('profilePortfolio.qml'))
                }
            }
            BackButton {
                id: back
                anchors.leftMargin: 0
                first: true
            }
        }
    }
}


