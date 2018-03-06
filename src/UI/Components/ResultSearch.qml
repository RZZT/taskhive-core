import QtQuick 2.0
import "ColumnHelper.js" as ColumnHelper
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
Column {
    property int selectedIndex
    // property variant selectedLocation: selectedIndex == -1 ? null : model[selectedIndex]
    property int itemHeight: 28
    signal locationClicked(variant location)
    id: container
    // height: itemHeight * model.length
/*
    Component {
        id: sectionHeading
        Rectangle {
            color: "#F3F3F3"
            width: container.width
            height: itemHeight
            Row {
                anchors.fill: parent
                spacing: 10
            Text {
                text: "Similar handles"
                font.pointSize: 14
                color: "#7E7E7E"
            }
            Text {
                text: "Fingerprint"
                font.pointSize: 14
                font.bold: true
                color: "#7E7E7E"
            }
            Text {
                text: "Last Activity"
                font.pointSize: 14
                color: "#7E7E7E"
                font.bold: true
            }
            }
        }
    } */
    ListModel {
        id: test
        ListElement {
            handles: "buyguy1"
            fingerprint: "c6638921"
            activity: "joined 2017/07/25"
        }
        ListElement {
            handles: "buyguy1"
            fingerprint: "c6638921"
            activity: "joined 2017/07/25"
        }
        ListElement {
            handles: "buyguy1"
            fingerprint: "c6638921"
            activity: "joined 2017/07/25"
        }
    }
    TableView {
        id: testTable
        width: container.width

        TableViewColumn {
            role: "handles"
            title: "Similar handles"
            width: 170
            resizable: false
        }
        TableViewColumn {
            role: "fingerprint"
            title: "Fingerprint"
            width: 150
            resizable: false
        }
        TableViewColumn {
            role: "activity"
            title: "Last Activity"
            width: 150
            resizable: false

        }
        model: test
        style: TableViewStyle {
            backgroundColor: "#F3F3F3"
            headerDelegate: Rectangle {
                 height: 50
                 width: textItem.implicitWidth
                 color: "#F3F3F3"
                 Text {
                     id: textItem
                     anchors.fill: parent
                     verticalAlignment: Text.AlignVCenter
                     horizontalAlignment: styleData.textAlignment
                     anchors.leftMargin: 12
                     text: styleData.value
                     elide: Text.ElideRight
                     color: "#4B4B4B"
                     font.pointSize: 14
                     renderType: Text.NativeRendering
                 }
             }
            itemDelegate: Rectangle {
                height: 50
                width: text.implicitWidth
                color: "#F3F3F3"
                Text {
                    id: text
                    anchors.fill: parent
                    anchors.bottomMargin: 5
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: styleData.textAlignment
                    anchors.leftMargin: 12
                    text: styleData.value
                    color: "#4B4B4B"
                    font.pointSize: 14
                    renderType: Text.NativeRendering
                }
            }
            rowDelegate: Rectangle {
               height: 30
               color:"#F3F3F3"
            }

        }
    }

    /*ListView {
        header: sectionHeading
        id: repeater
        property variant columnWidths: ColumnHelper.calcColumnWidths(model, repeater)
        width: parent.width
        height: parent.height
        delegate: ResultItemSearch {
            width: container.width
            height: itemHeight
            selected: {
                if (index == selectedIndex)
                    return true
                return false
            }
            searchItem: modelData
            onClicked: locationClicked(location)

        }
    } */
}
