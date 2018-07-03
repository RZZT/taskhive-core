import QtQuick 2.7
import QtQuick.Controls 2.0

import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.2
import QtQuick.Window 2.1
import "Components/"
ApplicationWindow {
        id: window
        minimumWidth: 1200
        minimumHeight: 800
        width: 1200
        height: 800
        color: "#0c0c0c"
        property alias iconAdd: iconAdd
        title: "Taskhive"
        visible: true
        flags: Qt.WindowSystemMenuHint | Qt.Window | Qt.WindowMinimizeButtonHint | Qt.WindowCloseButtonHint | Qt.WindowTitleHint | Qt.WindowMaximizeButtonHint
        property variant tasks: []
        property variant requests: []
        property variant offers: []
        property variant selectedTask: ListModel
        property variant userData: {"guest": true}
        property variant selectedType
        property bool inboxOpen: false
        property int connections: 0
        property var currentItem
         function updateList(taskList){
             print(taskList)
         }


        FontLoader { id: localFont; source: "fonts/Source_Sans_Pro/SourceSansPro-Regular.ttf" }
        TopBar {
            id: toolbar
            width: window.width
            height: window.height * 0.15
            connections: window.connections
        }
        Rectangle {
            id: tabView
            width: window.width
            height: window.height * 0.80
            anchors.top: toolbar.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.leftMargin: 30
            anchors.rightMargin: 30
            color: "transparent"
            ListView {
                id: frame
                model: ["Requests", "Offer", "My Tasks"]
                orientation: ListView.Vertical
                flickableDirection: Flickable.AutoFlickDirection
                interactive: true
                boundsBehavior: Flickable.StopAtBounds
                focus: true
                height: parent.height
                width: 100
                highlight: Rectangle { color: "#BD9CBE";}
                highlightFollowsCurrentItem: true
                delegate: Rectangle {
                    property bool selected: false
                    property alias text: mainText.text
                    id: wrapper
                    height: 40
                    width: frame.width
                    color: wrapper.ListView.isCurrentItem ? "#737373": "#DDDDDD"
                    Text {
                        id: mainText
                        text: modelData
                        horizontalAlignment: Text.AlignHCenter
                        anchors.verticalCenter: parent.verticalCenter
                        elide: Text.ElideRight
                        width: parent.width
                        wrapMode: Text.WordWrap
                        color:  wrapper.ListView.isCurrentItem ? "#FFFFFF": "#333333"
                        font { family: localFont.name; pixelSize: 16; }

                    }
                    MouseArea {
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {
                           frame.currentIndex = index
                        }
                    }
                }
                ScrollBar.horizontal: ScrollBar {}
            }
            StackLayout {
                id: sections
                anchors.left: frame.right
                anchors.right: tabView.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                currentIndex: frame.currentIndex
                Rectangle {
                    color: "#737373"
                    anchors.left: parent.left
                    anchors.leftMargin: 0
                    anchors.right: parent.right
                    anchors.bottom: parent.bottom
                    anchors.top: parent.top
                    Item {
                        id: titleLayout
                        anchors.right: parent.right
                        anchors.left: parent.left
                        anchors.leftMargin: 30
                        anchors.rightMargin: 20
                        height: 100
                        Text {
                            anchors.left: parent.left
                            anchors.verticalCenter: parent.verticalCenter
                            text: qsTr("Available Requests")
                            anchors.leftMargin: 20
                            color: "#FFFFFF"
                            font { family: localFont.name; pixelSize: 18; }
                        }
                        Image {
                            anchors.right: iconFilter.left
                            anchors.rightMargin: 20
                            id: iconAdd
                            source: "images/icon-add.svg"
                            anchors.verticalCenter: parent.verticalCenter
                            MouseArea {
                                anchors.fill: parent
                                cursorShape: Qt.PointingHandCursor
                                onClicked: {
                                    if(userData.guest){
                                        warningDialog.open()
                                    }
                                    else {
                                        var createTaskComponent = Qt.createComponent("CreateTask.qml")
                                        var create_task = createTaskComponent.createObject(window)
                                        print(createTaskComponent.errorString())
                                        create_task.show()
                                        window.selectedType = 'Request'
                                    }
                                }
                            }
                        }
                        Image {
                            id: iconFilter
                            anchors.right: parent.right
                            anchors.verticalCenter: parent.verticalCenter
                            source: "images/icon-filter.svg"
                        }
                    }
                    Table {
                        id: table
                        anchors.rightMargin: 20
                        anchors.right: parent.right
                        anchors.left: parent.left
                        anchors.top: titleLayout.bottom
                        anchors.bottom: parent.bottom
                        anchors.leftMargin: 30
                        model: window.tasks.requests
                    }
                }
                Rectangle {
                    color: "#737373"
                    anchors.left: parent.left
                    anchors.leftMargin: 0
                    anchors.right: parent.right
                    anchors.bottom: parent.bottom
                    anchors.top: parent.top
                    Item {
                        id: titleLayout2
                        anchors.right: parent.right
                        anchors.left: parent.left
                        anchors.leftMargin: 30
                        anchors.rightMargin: 20
                        height: 100
                        Text {
                            anchors.left: parent.left
                            anchors.verticalCenter: parent.verticalCenter
                            text: qsTr("Available Offers")
                            anchors.leftMargin: 20
                            color: "#FFFFFF"
                            font { family: localFont.name; pixelSize: 18; }
                        }
                        Image {
                            anchors.right: iconFilter2.left
                            anchors.rightMargin: 20
                            id: iconAdd2
                            source: "images/icon-add.svg"
                            anchors.verticalCenter: parent.verticalCenter
                            MouseArea {
                                anchors.fill: parent
                                cursorShape: Qt.PointingHandCursor
                                onClicked: {
                                    if(userData.guest){
                                        warningDialog.open()
                                    }
                                    else {
                                        var createTaskComponent = Qt.createComponent("CreateTask.qml")
                                        var create_task = createTaskComponent.createObject(window)
                                        print(createTaskComponent.errorString())
                                        create_task.show()
                                        window.selectedType = 'Offer'
                                    }
                                }
                            }
                        }
                        Image {
                            id: iconFilter2
                            anchors.right: parent.right
                            anchors.verticalCenter: parent.verticalCenter
                            source: "images/icon-filter.svg"
                        }
                    }
                    Table {
                        id: table2
                        anchors.rightMargin: 20
                        anchors.right: parent.right
                        anchors.left: parent.left
                        anchors.top: titleLayout2.bottom
                        anchors.bottom: parent.bottom
                        anchors.leftMargin: 30
                        model: window.tasks.requests
                    }
                }
                Rectangle {
                    color: "#737373"
                    anchors.left: parent.left
                    anchors.leftMargin: 0
                    anchors.right: parent.right
                    anchors.bottom: parent.bottom
                    anchors.top: parent.top
                    Item {
                        id: titleLayout3
                        anchors.right: parent.right
                        anchors.left: parent.left
                        anchors.leftMargin: 30
                        anchors.rightMargin: 20
                        height: 100
                        Text {
                            anchors.left: parent.left
                            anchors.verticalCenter: parent.verticalCenter
                            text: qsTr("My Tasks")
                            anchors.leftMargin: 20
                            color: "#FFFFFF"
                            font { family: localFont.name; pixelSize: 18; }
                        }
                        Image {
                            id: iconFilter3
                            anchors.right: parent.right
                            anchors.verticalCenter: parent.verticalCenter
                            source: "images/icon-filter.svg"
                        }
                    }
                    Table {
                        id: table3
                        anchors.rightMargin: 20
                        anchors.right: parent.right
                        anchors.left: parent.left
                        anchors.top: titleLayout3.bottom
                        anchors.bottom: parent.bottom
                        anchors.leftMargin: 30
                        model: window.tasks.offers
                    }
                }
            }
        }


//        Rectangle {
//            id: requests
//            height: window.height * 0.40
//            width: parent.width
//            anchors.top: toolbar.bottom
//            color: "transparent"

//            Rectangle {
//                color: "transparent"
//                id: requestsTitle
//                anchors.top: parent.top
//                width: parent.width
//                height: 45
//                anchors.topMargin: 50
//                Item {
//                    anchors.leftMargin: 30
//                    anchors.rightMargin: 30
//                    anchors.left: requestsTitle.left
//                    anchors.right: requestsTitle.right
//                    width: parent.width - 20
//                    height: parent.height
//                    anchors.top: parent.top
//                    anchors.topMargin: 0
//                    Text {
//                        id: requestsText
//                        anchors.left: parent.left
//                        text: qsTr("Requests")
//                        font.pixelSize: 22
//                        color: "#fff"
//                    }
//                    Row {
//                        id: filter
//                        anchors.right: parent.right
//                        height: parent.height
//                        spacing: 20
//                        Image {
//                            id: iconAdd
//                            source: "images/icon-add.svg"
//                            MouseArea {
//                                anchors.fill: parent
//                                cursorShape: Qt.PointingHandCursor
//                                onClicked: {
//                                    if(userData.guest){
//                                        warningDialog.open()
//                                    }
//                                    else {
//                                        var createTaskComponent = Qt.createComponent("CreateTask.qml")
//                                        var create_task = createTaskComponent.createObject(window)
//                                        print(createTaskComponent.errorString())
//                                        create_task.show()
//                                        window.selectedType = 'Request'
//                                    }
//                                }
//                            }
//                        }
//                        Image {
//                            id: iconFilter
//                            source: "images/icon-filter.svg"
//                        }
//                    }
//                }
//                Rectangle {
//                    anchors.bottom: requestsTitle.bottom
//                    height: 1
//                    width: parent.width
//                }
//            }
//            Component {
//                id: taskComponent
//                Rectangle {
//                    id: parentContent
//                    anchors.right: parent.right
//                    anchors.left: parent.left
//                    color: "transparent"
//                    height: 40
//                    Row {
//                        id: rowContent
//                        anchors.left: parent.left
//                        anchors.right: parent.right
//                        Rectangle {
//                            width: 2
//                            height: parentContent.height
//                        }
//                        Rectangle {
//                            width: (requestsList.width / 5)  - 4
//                            height: rowContent.height
//                            color: "transparent"
//                            Text {
//                                text: modelData.task_title
//                                color: "#fff"
//                                font.pixelSize: 16
//                                width: (requestsList.width / 5)  - 4
//                                elide: Text.ElideRight
//                                horizontalAlignment: Text.verticalCenter
//                                anchors.left: parent.left
//                                anchors.top: parent.top
//                                anchors.topMargin: 5
//                                anchors.leftMargin: 5
//                            }
//                        }
//                        Item {
//                            width: 2
//                            height: parentContent.height
//                        }
//                        Rectangle {
//                            width: 2
//                            height: parentContent.height
//                        }
//                        Rectangle {
//                            width: (requestsList.width / 5)  - 4
//                            height: rowContent.height
//                            color: "transparent"
//                            Text {
//                                text: modelData.task_body
//                                color: "#fff"
//                                font.pixelSize: 16
//                                width: (requestsList.width / 5)  - 4
//                                elide: Text.ElideRight
//                                horizontalAlignment: Text.verticalCenter
//                                anchors.left: parent.left
//                                anchors.top: parent.top
//                                anchors.topMargin: 5
//                                anchors.leftMargin: 5
//                            }
//                        }
//                        Item {
//                            width: 2
//                            height: parentContent.height
//                        }
//                        Rectangle {
//                            width: 2
//                            height: parentContent.height
//                        }
//                        Rectangle {
//                            width: (requestsList.width / 5)  - 4
//                            height: rowContent.height
//                            color: "transparent"
//                            Text {
//                                text: modelData.task_payment_methods[0]
//                                color: "#fff"
//                                font.pixelSize: 16
//                                width: (requestsList.width / 5)  - 4
//                                elide: Text.ElideRight
//                                horizontalAlignment: Text.verticalCenter
//                                anchors.left: parent.left
//                                anchors.top: parent.top
//                                anchors.topMargin: 5
//                                anchors.leftMargin: 5
//                            }
//                        }
//                        Item {
//                            width: 2
//                            height: parentContent.height
//                        }
//                        Rectangle {
//                            width: 2
//                            height: parentContent.height
//                        }

//                        Rectangle {
//                            width: (requestsList.width / 5)  - 4
//                            height: rowContent.height
//                            color: "transparent"
//                            Text {
//                                text: modelData.task_escrow_required
//                                color: "#fff"
//                                font.pixelSize: 16
//                                width: (requestsList.width / 5)  - 4
//                                elide: Text.ElideRight
//                                horizontalAlignment: Text.verticalCenter
//                                anchors.left: parent.left
//                                anchors.top: parent.top
//                                anchors.topMargin: 5
//                                anchors.leftMargin: 5
//                            }
//                        }
//                        Rectangle {
//                            width: 2
//                            height: parentContent.height
//                        }
//                        Rectangle {
//                            width: (requestsList.width / 5)  - 6
//                            height: rowContent.height
//                            color: "transparent"
//                            Text {
//                                text: modelData.task_currency
//                                color: "#fff"
//                                font.pixelSize: 16
//                                width: (requestsList.width / 5)  - 6
//                                elide: Text.ElideRight
//                                horizontalAlignment: Text.verticalCenter
//                                anchors.left: parent.left
//                                anchors.top: parent.top
//                                anchors.topMargin: 5
//                                anchors.leftMargin: 5
//                            }
//                        }
//                        Item {
//                            width: 4
//                            height: parentContent.height
//                        }
//                        Rectangle {
//                            width: 2
//                            height: parentContent.height
//                            color: "#fff"
//                        }

//                    }
//                    MouseArea {
//                        anchors.fill: parent
//                        hoverEnabled: true
//                        cursorShape: Qt.PointingHandCursor
//                        onDoubleClicked: {
//                            parentContent.ListView.view.currentIndex = index
//                            parentContent.forceActiveFocus()
//                            window.selectedTask = parentContent.ListView.view.model[index]
//                            print("JSON STRING: " +JSON.stringify(window.tasks.offers))
//                            var component = Qt.createComponent("TaskInformation.qml")
//                            var task_window = component.createObject(window)
//                            task_window.show()

//                        }
//                    }
//                    Rectangle{
//                        width: parent.width
//                        height: 2
//                        anchors.top: parentContent.bottom
//                    }
//                }
//            }
//            Component {
//                id: headerComponent
//                Rectangle {
//                    id: test1
//                    height: 60
//                    width: requestsList.width
//                    color: "#0c0c0c"
//                    z: 999
//                    Row {
//                        id: headerRow
//                        anchors.left: parent.left
//                        anchors.right: parent.right
//                        anchors.top: parent.top
//                        anchors.topMargin: 20
//                        Rectangle {
//                            width: 2
//                            height: test1.height - 20
//                            color: "#fff"
//                        }
//                        Rectangle{
//                             width: (requestsList.width / 5) - 4
//                             height: test1.height  - 20
//                             color: "transparent"
//                            Text{
//                                width: (requestsList.width / 5) - 4
//                                text: "Title"
//                                color: "#fff"
//                                font.pixelSize: 18
//                                horizontalAlignment: Text.AlignHCenter
//                                verticalAlignment: Text.AlignVCenter
//                            }
//                        }
//                        Item {
//                            width: 2
//                            height: test1.height  - 20
//                        }
//                        Rectangle {
//                            width: 2
//                            height: test1.height - 20
//                            color: "#fff"
//                        }
//                        Text{
//                            width: (requestsList.width / 5) - 4
//                            text: "Description"
//                            color: "#fff"
//                            font.pixelSize: 18
//                            horizontalAlignment: Text.AlignHCenter
//                        }
//                        Item {
//                            width: 2
//                            height: test1.height - 20
//                        }
//                        Rectangle {
//                            width: 2
//                            height: test1.height - 20
//                            color: "#fff"
//                        }
//                        Text{
//                            width:(requestsList.width / 5) - 4
//                            text: "Payment Methods"
//                            color: "#fff"
//                            font.pixelSize: 18
//                            horizontalAlignment: Text.AlignHCenter
//                        }
//                        Item {
//                            width: 2
//                            height: test1.height - 20
//                        }
//                        Rectangle {
//                            width: 2
//                            height: test1.height - 20
//                            color: "#fff"
//                        }
//                        Text{
//                            width: (requestsList.width / 5) - 6
//                            text: "Escrow Required"
//                            color: "#fff"
//                            font.pixelSize: 18
//                            horizontalAlignment: Text.AlignHCenter
//                        }
//                        Item {
//                            width: 2
//                            height: test1.height - 20
//                        }
//                        Rectangle {
//                            width: 2
//                            height: test1.height - 20
//                            color: "#fff"
//                        }
//                        Text{
//                            width: (requestsList.width / 5) - 4
//                            text: "Currency"
//                            color: "#fff"
//                            font.pixelSize: 18
//                            horizontalAlignment: Text.AlignHCenter
//                        }
//                        Item {
//                            width: 2
//                            height: test1.height - 20
//                        }
//                        Rectangle {
//                            width: 2
//                            height: test1.height - 20
//                            color: "#fff"
//                        }
//                    }
//                    Rectangle{
//                        width: parent.width
//                        height: 2
//                        anchors.top: test1.bottom
//                    }
//                }
//            }
//            Component {
//                id: highlight
//                Rectangle {
//                    width: requestsList.width; height: 40
//                    color: "grey";
//                    y: requestsList.currentItem.y
//                    Behavior on y {
//                        SpringAnimation {
//                            spring: 3
//                            damping: 0.2
//                        }
//                    }
//                }
//            }
//            ListView {
//                anchors.leftMargin: 30
//                anchors.rightMargin: 30
//                id: requestsList
//                model: window.tasks.requests
//                anchors.right: parent.right
//                anchors.left: parent.left
//                anchors.top: requestsTitle.bottom
//                anchors.bottom: parent.bottom
//                delegate: taskComponent
//                header: headerComponent
//                clip: true
//                headerPositioning: ListView.OverlayHeader
//                highlight: highlight
//                highlightFollowsCurrentItem: false
//                focus: true
//            }
//        }
//        Rectangle {
//            id: offers
//            height: window.height * 0.35
//            width: parent.width
//            anchors.top: requests.bottom
//            color: "transparent"
//            Rectangle {
//                color: "transparent"
//                id: offersTitle
//                width: parent.width
//                height: 45
//                Item {
//                    anchors.leftMargin: 30
//                    anchors.rightMargin: 30
//                    anchors.left: offersTitle.left
//                    anchors.right: offersTitle.right
//                    width: parent.width - 20
//                    height: parent.height
//                    Text {
//                        id: offersText
//                        anchors.left: parent.left
//                        text: qsTr("Offers")
//                        font.pixelSize: 22
//                        color: "#fff"
//                    }
//                    Row {
//                        anchors.right: parent.right
//                        height: parent.height
//                        spacing: 20
//                        Image {
//                            id: iconAdd2
//                            source: "images/icon-add.svg"
//                            MouseArea {
//                                anchors.fill: parent
//                                cursorShape: Qt.PointingHandCursor
//                                onClicked: {
//                                    if(userData.guest){
//                                        warningDialog.open()
//                                    }
//                                    else {
//                                        var createTaskComponent = Qt.createComponent("CreateTask.qml")
//                                        var create_task = createTaskComponent.createObject(window)
//                                        print(createTaskComponent.errorString())
//                                        create_task.show()
//                                        window.selectedType = 'Offer'
//                                    }
//                                }
//                            }
//                        }
//                        Image {
//                            id: iconFilter2
//                            source: "images/icon-filter.svg"
//                        }
//                    }
//                }
//                Rectangle {
//                    anchors.bottom: offersTitle.bottom
//                    height: 1
//                    width: parent.width
//                }
//            }
//            Component {
//                id: highlightOffers
//                Rectangle {
//                    width: offersList.width; height: 40
//                    color: "grey"
//                    y: offersList.currentItem.y
//                    Behavior on y {
//                        SpringAnimation {
//                            spring: 3
//                            damping: 0.2
//                        }
//                    }
//                }
//            }
//            ListView {
//                anchors.leftMargin: 30
//                anchors.rightMargin: 30
//                id: offersList
//                model: window.tasks.offers
//                anchors.right: parent.right
//                anchors.left: parent.left
//                anchors.top: offersTitle.bottom
//                anchors.bottom: parent.bottom
//                delegate: taskComponent
//                header: headerComponent
//                clip: true
//                headerPositioning: ListView.OverlayHeader
//                highlight: highlightOffers
//                highlightFollowsCurrentItem: false
//                focus: true
//            }
//        }
//        Image {
//             id: img
//             visible: false
//             source: "images/background.png"
//             height: window.height * 0.10
//             fillMode: Image.PreserveAspectFit
//        }

//         Row {
//             anchors.bottom: parent.bottom
//             Repeater {
//                 model: Math.ceil(window.width / img.width)
//                 ShaderEffectSource {
//                     sourceItem: img
//                     height: img.height
//                     width: img.width
//                     z: -1
//                 }
//             }
//         }


         Connections {
             target: TaskThread
             onNewTask:{
                window.tasks = result
                window.requests = result.requests
                window.offers = result.offers
                window.connections = result.connections
             }
         }
         MessageDialog {
             id: warningDialog
             text: "You can't create a task if you don't have a Taskhive User.\n Do you want to go through the Profile Wizard?"
             standardButtons: StandardButton.Yes | StandardButton.No
             title: "Missing User Profile"
             icon: StandardIcon.Warning
             onYes: {
                 var component = Qt.createComponent("Wizard/Wizard.qml")
                 var wizard_window = component.createObject(window)
                 wizard_window.show()
             }
             onNo: {
                 warningDialog.close()
             }
         }
         Component.onCompleted: {
             var profile = Profile.verifyProfile()
             window.userData = profile
             TaskThread.start()
         }
    }

