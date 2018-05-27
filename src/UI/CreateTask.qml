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
    Rectangle {
        id: contentInfo
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.rightMargin: 40
        anchors.leftMargin: 40
        anchors.top: parent.top
        anchors.topMargin: 40
        Column{
            id: titleColumn
            anchors.left: parent.left
            anchors.right: parent.right
            spacing: 15
            anchors.top: parent.top
            Text {
                id: taskTitle
                text: window.selectedType === 'Request' ? "Create a Request": "Create an Offer"
                color: "#fff"
                font { family: localFont.name; pixelSize: 16; bold: true}

            }
            Rectangle {
                anchors.left: parent.left
                anchors.right: parent.right
                height: 2
            }
            Text {
                text: "Task Title"
                color: "#fff"
                font { family: localFont.name; pixelSize: 16;}
            }
            LineEdit {
                id: task_title
                height: 30
                fontSize: 16
                width: parent.width
            }
            Text {
                id: text1
                text: "Task Description"
                font { family: localFont.name; pixelSize: 16;}
                color: "#fff"
            }
            TextArea {
                id: task_body
                anchors.left: parent.left
                anchors.right: parent.right
            }
            Row{
                id: row
                width: parent.width
                spacing: 60
                Rectangle {
                    width: 150
                    height: 75
                    color: "transparent"
                    Text {
                        id: currencyText
                        text: "Task Currency"
                        color: "#fff"
                        font { family: localFont.name; pixelSize: 16}
                    }
                    Combo {
                        id: task_currency
                        model: ["BTC", "USD"]
                        width: 150
                        height: 30
                        anchors.top: currencyText.bottom
                        anchors.topMargin: 10
                    }
                }
                Rectangle {
                    width: 150
                    height: 75
                    color: "transparent"
                    Text {
                        id: costText
                        text: "Task Cost"
                        color: "#fff"
                        font { family: localFont.name; pixelSize: 16;}
                    }
                    LineEdit {
                        id: task_cost
                        height: 30
                        width: 150
                        validator: DoubleValidator {}
                        anchors.top: costText.bottom
                        anchors.topMargin: 10
                    }
                }
                Rectangle {
                    width: 150
                    height: 75
                    color: "transparent"
                    Text {
                        id: categoryText
                        text: "Category"
                        color: "#fff"
                        font { family: localFont.name; pixelSize: 16;}
                    }
                    Combo {
                        id: task_category
                        model: categories
                        width: 150
                        height: 30
                        anchors.top: categoryText.bottom
                        anchors.topMargin: 10
                    }
                }

            }
            Text {
                id: methodText
                text: "Payment Methods"
                color: "#fff"
                font { family: localFont.name; pixelSize: 16}
            }
            Row {
                id: rowPayment
                width: parent.width
                spacing: 30
                CheckBox {
                    text: qsTr("Bitcoin")
                    width: 120
                }
                CheckBox {
                    text: qsTr("Paypal")
                    width: 120
                }
                CheckBox {
                    text: qsTr("Direct Deposit")
                    width: 120
                }
                CheckBox {
                    text: qsTr("Paysafe Card")
                    width: 120
                }
            }
            Row {
                id: rowPayment2
                width: parent.width
                spacing: 30
                CheckBox {
                    text: qsTr("Monero")
                    width: 120
                }
                CheckBox {
                    text: qsTr("Bitcoin Cash")
                    width: 120
                }
                CheckBox {
                    text: qsTr("Dash")
                    width: 120
                }
                CheckBox {
                    text: qsTr("Gift Card")
                    width: 120
                }
            }
            Text {
                id: deadlineText
                text: qsTr("Deadline")
                color: "#fff"
                font { family: localFont.name; pixelSize: 16}
            }
            Datepicker {
                id: task_deadline
                height: 30
                width: 150
                z: 999
            }
            Text {
                id: keywordText
                text: qsTr("Insert Keywords")
                color: "#fff"
                font { family: localFont.name; pixelSize: 16}
            }
            TextArea {
                id: keywords
                height: 40
                anchors.left: parent.left
                anchors.right: parent.right
            }

        }
        Rectangle {
            id: column
            height: 400
            anchors.left: parent.left
            anchors.right: parent.right
            color: "transparent"
            /*
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
            } */
            /*Text {
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
            }*/
        }

    }
    Row {
        id: buttonsRow
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 15
        anchors.right: parent.right
        anchors.rightMargin: 40
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
