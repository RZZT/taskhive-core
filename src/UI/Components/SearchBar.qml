import QtQuick 2.3
import QtQuick.Controls 1.1

Rectangle {

    property bool ignoreTextChange: false
    property int popupHeight: contents.height - searchText.height
    property bool showIcon: true
    property string resultBackgroundColor
    property string textValue: ''
    color: "#fff"
    id: searchbar
    Item {
        id: contents
        anchors.fill: parent
        TextInput {
            id: searchText
            anchors.top: parent.top
            anchors.left: showIcon === true ? iconSearch.right: parent.left
            anchors.right: parent.right
            height: parent.height
            font.pointSize: 14
            anchors.leftMargin: 10
            color: "#000000"
            verticalAlignment: TextInput.AlignVCenter
            onTextChanged: {
                textValue = text
                if(!ignoreTextChange)
                {
                    // searchTextChanged(text)
                    suggestionBox.visible = true
                }
            }
            onActiveFocusChanged: {
                if(!active){
                    suggestionBox.visible = false
                }
            }
            onAccepted: doSearch(searchText.text)
        }
        Image {
            id: iconSearch
            visible: showIcon
            anchors.left: parent.left
            source: "../images/icon-search.svg"
            anchors.verticalCenter: parent.verticalCenter
            anchors.leftMargin: 12
            anchors.rightMargin: 10
        }
        ResultSuggestions {
                id: suggestionBox
                z: 999
                height: popupHeight
                anchors.top: searchText.bottom
                anchors.right: parent.right

                width: showIcon === true ? searchText.width: parent.width
                visible: false
        }
    }
}
