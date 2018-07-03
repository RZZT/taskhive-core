import QtQuick 2.6
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3
import QtQuick.Window 2.2
import QtQuick.Controls.Styles 1.4
import QtQuick.Dialogs 1.2
import "Components/"
Window {
    id: createWindow
    height: 850
    width: 800
    color: "#0c0c0c"
    property ListModel selectedMethods: ListModel {}
    property ListModel keywordList: ListModel {}
    property variant categories: []
    property variant category_hex: []
    property variant payment_methods: []
    title: "Taskhive"
    onVisibilityChanged: {
        task_deadline.closeModal()
    }

    function sendDataToThread(){

        var keywordsList = keywords.text.split(",")

        if (bitcoin.checked) {
            payment_methods.push("Bitcoin")
        }
        if (paypal.checked) {
            payment_methods.push("Paypal")
        }
        if (direct_deposit.checked) {
            payment_methods.push("Direct Deposit")
        }

        if (paysafe_card.checked) {
            payment_methods.push("Paysafe Card")
        }

        if (monero.checked) {
            payment_methods.push("Monero")
        }

        if (dash.checked) {
            payment_methods.push("Dash")
        }

        if (bitcoin_cash.checked) {
            payment_methods.push("Bitcoin Cash")
        }

        if (bitcoin_cash.checked) {
            payment_methods.push("Gift Card")
        }

        var JSON_DATA = {
            "task_keywords": keywordsList,
            "task_references": ["URL1", "URL2"],
            "task_body": task_body.text,
            "task_title": task_title.text,
            "task_currency": task_currency.currentText,
            "task_type": window.selectedType === 'Request' ? "Request": "Offer",
            "task_cost": task_cost.text,
            "task_deadline": task_deadline.selectedDateText,
            "task_escrow_required": 1,
            "task_payment_rate_type": "task",
            "task_categories": [createWindow.category_hex[task_category.currentIndex]],
            'task_payment_methods': payment_methods,
            'task_escrow_recommendation': 'BITCOIN-PUBKEY',
            'task_license': 'CC BY 4.0',
            'task_entropy': 'CURRENTLY-NOT-IN-USE'
        }
        print("TESTING")
        print(createWindow.category_hex[task_category.currentIndex])
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
                font { family: localFont.name; pixelSize: 16}
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
                        width: 200
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
                    id: bitcoin
                    text: qsTr("Bitcoin")
                    width: 120
                }
                CheckBox {
                    id: paypal
                    text: qsTr("Paypal")
                    width: 120
                }
                CheckBox {
                    id: direct_deposit
                    text: qsTr("Direct Deposit")
                    width: 120
                }
                CheckBox {
                    id: paysafe_card
                    text: qsTr("Paysafe Card")
                    width: 120
                }
            }
            Row {
                id: rowPayment2
                width: parent.width
                spacing: 30
                CheckBox {
                    id: monero
                    text: qsTr("Monero")
                    width: 120
                }
                CheckBox {
                    id: bitcoin_cash
                    text: qsTr("Bitcoin Cash")
                    width: 120
                }
                CheckBox {
                    id: dash
                    text: qsTr("Dash")
                    width: 120
                }
                CheckBox {
                    id: giftcard
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
                activeWindow: createWindow
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
                font { family: localFont.name; pixelSize: 16}
            }
            Row {
                id: buttonsRow
                anchors.right: parent.right
                anchors.rightMargin: 10
                spacing: 20
                Button {
                    id: submitB
                    text: "Submit"
                    onClicked:  {
                        print(task_cost.acceptableInput)
                        print(task_title.text.length)
                        print(task_body.text.length)
                        if(task_cost.acceptableInput && (task_title.text.length > 0) && (task_body.text.length > 0)){
                            createWindow.sendDataToThread()
                            confirmationDialog.open()
                        }
                        else {
                            messageDialog.open()
                        }

                    }
                }
                Button {
                    id: cancelB
                    text: "Cancel"
                    onClicked: {
                        createWindow.close()
                    }
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
        var cats_k = []
        var categoriesNames = [];
        for(var i = 0; i<cats.categories.length;i++){
            categoriesNames.push(cats.categories[i].name);
            cats_k.push(cats.categories[i].hex);
        }
        createWindow.categories = categoriesNames;
        createWindow.category_hex = cats_k
    }
}
