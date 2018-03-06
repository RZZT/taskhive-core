import QtQuick 2.2
import QtQuick.Window 2.2
import QtQuick.Controls 1.2
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1
import "Components/"
Window {
    property string fileName
    property string fileSize
    property string mimeType
    id: fileUpload
    height: 500
    width: 500
    maximumHeight: 500
    maximumWidth: 500
    color: "#0c0c0c"
    modality: Qt.WindowModal

    Rectangle {
        width: parent.width
        height: parent.height * 0.80
        color: "transparent"
        Item {
            id: item1
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            width: parent.width - (parent.width * 0.10)
            height: parent.height - (parent.height * 0.10)
            CustomBorder{
                anchors.left: parent.left
                borderWidth: 1
                borderHeight: parent.height
                amountLines: 5
                spacingItem: 5
                topOrBottom: false
            }
            CustomBorder{
                anchors.right: parent.right
                borderWidth: 1
                borderHeight: parent.height
                amountLines: 5
                spacingItem: 5
                topOrBottom: false
            }
            CustomBorder{
                anchors.leftMargin: 1
                anchors.top: parent.top
                borderWidth: parent.width
                borderHeight: 1
                amountLines: 5
                spacingItem: 5
                topOrBottom: true
            }
            CustomBorder{
                anchors.bottom: parent.bottom
                borderWidth: parent.width
                borderHeight: 1
                amountLines: 5
                spacingItem: 5
                topOrBottom: true
            }
            MouseArea {
                anchors.fill: parent
                onClicked: fileDialog.open()
            }
            FileDialog {
                    id: fileDialog
                    modality: Qt.WindowModal
                    title: "Choose some file"
                    nameFilters: ["Text files (*.txt)", "HTML files (*.html *.htm)"]
                    onAccepted: {
                        var filePath = fileUrl.toString()
                        console.log("Accepted: " + filePath)
                        var size = FileInfo.get_filesize(filePath)
                        fileSize = size
                        var MIME_TYPE = FileInfo.get_MIMETYPE(filePath)
                        mimeType = MIME_TYPE
                        fileName = FileInfo.get_filename(filePath)
                    }
                    onRejected: { console.log("Rejected") }

                }
            Rectangle {
                height: parent.height * 0.50
                width: parent.width * 0.80
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                color: "transparent"
                Column {
                    spacing: 20
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    Text {
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: qsTr("Click the button or anywhere within this region to upload a file")
                        font.pointSize: 11
                        color: "#fff"
                    }
                    Button {
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: "Click here to upload file"
                        onClicked: {
                            fileDialog.open()

                        }
                    }
                    Text {
                        text: qsTr("File Name: " + fileName)
                        font.pointSize: 11
                        color: "#fff"
                    }
                    Text {
                        id: sizeText
                        text: qsTr("File Size: " + fileSize)
                        font.pointSize: 11
                        color: "#fff"
                    }
                    Text {
                        text: qsTr("File MIME TYPE: " + mimeType)
                        font.pointSize: 11
                        color: "#fff"
                    }
                }
            }
        }

    }
    Image {
         id: img
         visible: false
         source: "background.png"
         height: fileUpload.height * 0.15
         fillMode: Image.PreserveAspectFit
    }

    Row {
        anchors.bottom: parent.bottom
        Repeater {
             model: Math.ceil(fileUpload.width / img.width)
             ShaderEffectSource {
                 sourceItem: img
                 height: img.height
                 width: img.width
             }
         }
     }
}
