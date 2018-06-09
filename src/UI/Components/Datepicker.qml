import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Window 2.1

/*!
    Originally written by Carlos Molina with its custom Calendar.
    Modified by Victor Rincones to use Qt Quick Control's stock Calendar element and icons.
*/
Item {
    id: datepicker
    height: Math.min(dateField.height, dropdown.height)

    property date selectedDate : new Date()
    property string selectedDateText: dateField.text
    property Window activeWindow
    property var pos : getOffset(dateField)

    signal dateChanged (date date)

    function getOffset(item) {
        var offset = {
            "x": activeWindow.x + item.x,
            "y": activeWindow.y + item.y + item.height
        };
        while(item.parent) {
            item = item.parent;
            offset.x += item.x;
            offset.y += item.y;
        }
        return offset;
    }
    function toggleModal() {
        if(modal.active)
            loseFocus();
        else
        {
            modal.show()
            modal.requestActivate()
        }
    }

    function loseFocus(newDate) {
        if (newDate instanceof Date)
        {
            selectedDate = newDate;
            calendar.selectedDate = selectedDate;
            dateField.text = Qt.formatDate(calendar.selectedDate,"dd/MM/yyyy");
            dateChanged(newDate);
        }
        else
            calendar.selectedDate.setDate(selectedDate.getDate());

        modal.close();
        activeWindow.requestActivate();
    }
    function closeModal() {
        modal.close();
        activeWindow.requestActivate();
    }

    LineEdit {
        id: dateField
        readOnly: true
        height: parent.height
        width: parent.width
    }
    Image {
        id: dropdown
        width: 20
        height: 20
        source: "../images/icon-calendar.svg"
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: 10
        MouseArea {
            anchors.fill: parent
            onClicked: toggleModal()
            cursorShape: Qt.PointingHandCursor
        }
    }
    Window {
        id: modal
        flags: Qt.SplashScreen
        minimumHeight: calendar.height; minimumWidth: calendar.width
        maximumHeight: calendar.height; maximumWidth: calendar.width
        x: pos.x
        y: pos.y

        Calendar {
            id: calendar
            onClicked: loseFocus(calendar.selectedDate)
        }
    }
    Component.onCompleted: loseFocus(calendar.selectedDate)
}
