import QtQuick 2.7
import QtQuick.Controls 1.4
Item {
    Text {
        id: portfolioTitle
        anchors.left: parent.left
        anchors.leftMargin: 30
        text: qsTr("Portfolio")
        font.pixelSize: 24
        color: "#fff"
    }
    Rectangle {
        height: 1
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: portfolioTitle.bottom
        anchors.topMargin: 5
    }
    ScrollView {
        anchors.top: portfolioTitle.bottom
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.topMargin: 31
        anchors.leftMargin: 30
        horizontalScrollBarPolicy: Qt.ScrollBarAlwaysOff
        verticalScrollBarPolicy: Qt.ScrollBarAlwaysOff
        GridView {
            id: gridPortfolio
            anchors.fill: parent
            cellWidth: 230
            cellHeight: 230
            model: portfolioList
            delegate: Rectangle {
                color: "transparent"
                width: gridPortfolio.cellWidth - 30
                height: gridPortfolio.cellHeight - 30
                BorderImage {
                    id: name
                    source: "../images/16.svg"
                    horizontalTileMode: BorderImage.Stretch
                    verticalTileMode: BorderImage.Stretch
                    anchors.fill: parent
                    Image {
                        id: img
                        source: file
                        fillMode: Image.PreserveAspectFit
                        width: parent.width - 50
                        height: parent.height - 50
                        anchors.centerIn: parent
                    }
                    Image {
                        anchors.right: parent.right
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 50
                        anchors.rightMargin: 30
                        sourceSize.width: 30
                        sourceSize.height: 30
                        source: "../images/09.svg"
                        MouseArea {
                            anchors.fill: parent
                            onClicked: portfolioList.remove(gridPortfolio.currentIndex)
                            cursorShape: Qt.PointingHandCursor
                        }
                    }
                }


            }
        }
    }
}
