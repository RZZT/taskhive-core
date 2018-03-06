import QtQuick 2.1
import QtQuick.Window 2.2
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import "../"

Window {
    id: wizard
    minimumWidth: 1200
    width: 1200
    height: 800
    minimumHeight: 800
    color: "#3D3D3D"
    visible: false
    title: "Taskhive Wizard"
    property variant portfolioList: ListModel {}
    property variant profiles: ListModel {}
    property variant categories: ListModel {}
    property variant selectedSkills: ListModel {}
    property variant skills: []
    property string handle: "Guest"
    property string privacy


    function getCategories(){
        return categories
    }
    StackView {
        id: mainStack
        anchors.fill: parent
        initialItem: Qt.resolvedUrl('creationProfile.qml')
        pushEnter: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 0
                to:1
                duration: 200
            }
        }
        pushExit: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 1
                to:0
                duration: 200
            }
        }
        popEnter: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 0
                to:1
                duration: 200
            }
        }
        popExit: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 1
                to:0
                duration: 200
            }
        }
    }
}
