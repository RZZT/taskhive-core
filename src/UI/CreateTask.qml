import QtQuick 2.6
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3
import QtQuick.Window 2.2
import QtQuick.Controls.Styles 1.4
import QtQuick.Dialogs 1.2
import "Components/"
Window {
    id: createWindow
    height: 800
    width: 800
    color: "#0c0c0c"
    property ListModel selectedMethods: ListModel {}
    property ListModel keywordList: ListModel {}
    property variant categories: []


    function sendDataToThread(){

        var keywords = []
        for(var i=0; i<createWindow.keywordList.count; i++){
            keywords.push(keywordList.get(i).word);
        }
        var JSON_DATA = {
            "task_keywords": keywords,
            "task_references": ["URL1", "URL2"],
            "task_body": task_body.text,
            "task_title": task_title.text,
            "task_currency": task_currency.currentText,
            "task_type": window.selectedType === 'Request' ? "Request": "Offer",
            "task_cost": task_cost.text,
            "task_deadline": task_deadline.text,
            "task_escrow_required": 1,
            "task_payment_rate_type": "task",
            "task_categories": ['01'],
            'task_payment_methods': ['BTC', 'DGE'],
            'task_escrow_recommendation': 'BITCOIN-PUBKEY',
            'task_license': 'CC BY 4.0',
            'task_entropy': 'CURRENTLY-NOT-IN-USE'
        }
        Task.run(JSON_DATA)

    }

    Connections {
        target: Task
        onTaskStatus: {
            print(status)
        }
    }

    Row {
        id: windowTitleCreate
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 20
        anchors.topMargin: 20
        Text {
            text: window.selectedType === 'Request' ? "Create a Request": "Create an Offer"
            color: "#fff"
            font.pixelSize: 25
        }    }
    Rectangle {
        id: contentInfo
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.rightMargin: 20
        anchors.leftMargin: 20
        anchors.top: windowTitleCreate.bottom
        anchors.topMargin: 10
        Column{
            id: titleColumn
            anchors.left: parent.left
            anchors.right: parent.right
            spacing: 10
            anchors.top: parent.top
            Text {
                text: "Task Title"
                font.pixelSize: 18
                color: "#fff"
            }
            LineEdit {
                id: task_title
                height: 30
                fontSize: 16
                width: parent.width
            }
        }
        Text {
            id: text1
            text: "Task Description"
            font.pixelSize: 18
            color: "#fff"
            anchors.top: titleColumn.bottom
        }
        TextArea {
            id: task_body
            anchors.top: text1.bottom
            anchors.topMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.right: parent.right
            anchors.rightMargin: 0
        }
        Rectangle {
            id: column
            height: 400
            anchors.left: parent.left
            anchors.right: parent.right
            color: "transparent"
            anchors.top: task_body.bottom
            anchors.topMargin: 10
            Row{
                id: row
                width: parent.width
                spacing: 10
                anchors.top: parent.top
                Text {
                    text: "Task Currency:"
                    anchors.verticalCenter: parent.verticalCenter
                    color: "#fff"
                    font.pixelSize: 18
                    verticalAlignment: Text.AlignVCenter
                }
                Combo {
                    id: task_currency
                    model: ["BTC", "USD"]
                    width: 100
                    height: 25
                    anchors.verticalCenter: parent.verticalCenter
                }

                Text {
                    text: "Task Cost:"
                    anchors.verticalCenter: parent.verticalCenter
                    color: "#fff"
                    font.pixelSize: 18
                    verticalAlignment: Text.AlignVCenter
                }
                LineEdit {
                    id: task_cost
                    height: 30
                    width: 100
                    validator: DoubleValidator {}
                }
                Text {
                    text: "Category"
                    anchors.verticalCenter: parent.verticalCenter
                    color: "#fff"
                    font.pixelSize: 18
                    verticalAlignment: Text.AlignVCenter
                }
                ComboBox {
                    id: task_category
                    model: categories
                    width: 100
                    height: 25
                    anchors.verticalCenter: parent.verticalCenter
                }

            }
            Text {
                id: methodText
                text: "Payment Methods"
                color: "#fff"
                font.pixelSize: 18
                verticalAlignment: Text.AlignVCenter
                anchors.top: row.bottom
                anchors.topMargin: 10

            }
            GridView {
                id: gridMethod
                model: createWindow.selectedMethods
                anchors.right: parent.right
                anchors.left: parent.left
                anchors.top: methodText.bottom
                height: 100
                cellHeight: 35
                cellWidth: 75
                delegate: Rectangle{
                    height: 30
                    width: 70
                    color: "transparent"
                        Text {
                        text: method
                        color: "#fff"
                        font.pixelSize: 16
                    }
                }
                footer: Row {
                    height: 30
                    width: 150
                    spacing: 10
                    ComboBox{
                        id: paymentMethods
                        height: 30
                        width: 100
                        model: ["BTC", "DOGE"]
                        visible: false
                    }

                    Button {
                        width: 40
                        height: parent.height
                        text: "+"
                        onClicked: {
                            if(paymentMethods.visible){
                                createWindow.selectedMethods.append({"method":paymentMethods.currentText})
                            }
                            else {
                                paymentMethods.visible = true
                            }
                        }
                    }

                }
            }
            Text {
                id: deadlineText
                text: "Deadline"
                color: "#fff"
                font.pixelSize: 18
                anchors.top: gridMethod.bottom
                anchors.topMargin: 10
            }
            Datepicker {
                id: task_deadline
                anchors.top: deadlineText.bottom
                height: 30
                width: 150
                z: 999
            }
            Row{
                id: row1
                spacing: 5
                anchors.top: task_deadline.bottom
                anchors.topMargin: 10
                Text {
                    text: "Insert Keywords"
                    color: "#fff"
                    font.pixelSize: 18
                    anchors.verticalCenter: parent.verticalCenter
                }
                LineEdit {
                    id: keyword
                    height: 30
                    anchors.verticalCenter: parent.verticalCenter
                    width: 150
                    onAccepted: {
                        createWindow.keywordList.append({"word":keyword.text})
                        keyword.text = ''
                    }
                }
            }
            Flow {
                id: keywords
                height: 80
                layoutDirection: Qt.LeftToRight
                flow: GridLayout.LeftToRight
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: row1.bottom
                anchors.topMargin: 10
                spacing: 10
                Repeater {
                    model: createWindow.keywordList
                    delegate: keywordItem
                }
            }
            Component {
                id: keywordItem
                Item {
                    width: childrenRect.width
                    height: 30
                    Text {
                        id: fakeText
                        text: modelData
                        font.pixelSize: 18
                        visible: false
                    }
                    Rectangle {
                        width: fakeText.width + 30
                        height: 30
                        Text {
                            text: "X"
                            anchors.right: parent.right
                            anchors.top: parent.top
                            anchors.rightMargin: 2
                            anchors.topMargin: 2
                            MouseArea {
                                anchors.fill: parent
                                cursorShape: Qt.PointingHandCursor
                                onClicked: {
                                    createWindow.keywordList.remove(index)
                                }
                            }
                        }
                        Text {
                            text: modelData
                            font.pixelSize: 18
                            anchors.centerIn: parent
                        }
                   }
                }
            }
        }

    }
    Row {
        id: buttonsRow
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 15
        anchors.right: parent.right
        anchors.rightMargin: 20
        spacing: 15
        Button {
            id: submitB
            text: "Submit"
            onClicked:  {
                if(task_cost.acceptableInput && (task_title.length > 0) && (task_body.length > 0)){
                    createWindow.sendDataToThread()
                    confirmationDialog.open()
                }
                else {
                    messageDialog.open()
                }

            }
            style: ButtonStyle {
                label: Label {
                    text: submitB.text
                    font.pixelSize: 18
                    color: "#3F3F3F"
                }
            }
        }
        Button {
            id: cancelB
            text: "Cancel"
            onClicked: {
                createWindow.close()
            }
            style: ButtonStyle {
                label: Label {
                    text: cancelB.text
                    font.pixelSize: 18
                    color: "#3F3F3F"
                }
            }
        }
    }
    MessageDialog {
        id: confirmationDialog
        title: qsTr("Task Information")
        text: qsTr("New task has been created.")
        icon: StandardIcon.Information
        onAccepted: {
            createWindow.close()
        }
    }

    MessageDialog {
        id: messageDialog
        title:  qsTr("Invalid Input")
        text: qsTr("Invalid Task Cost")
        onAccepted: {
                task_cost.focus = true;
        }
    }
    Component.onCompleted: {
        var cats = TaskhiveCategories.getCategories();
        print(cats)
        var categoriesNames = [];
        for(var i = 0; i<cats.length;i++){
            categoriesNames.push(cats[i].name);
        }
        createWindow.categories = categoriesNames;
    }
}
