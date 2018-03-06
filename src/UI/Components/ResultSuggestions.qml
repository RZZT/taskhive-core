import QtQuick 2.0


Item {
    property variant columnTitles
    id: container
    Rectangle {
        id: resultContent
        anchors.fill: parent
        z: 100
        ResultSearch {
            id: searchSuggestion
            width: parent.width

        }
    }
}
