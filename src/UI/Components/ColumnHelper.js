var columns = {}

function calcColumnWidths(model, parent)
{
 for (var i = 0; i < model.length; ++i)
 {
 var data = model[i]

 for (var key in data)
 {
 if (!columns[key]) {
 columns[key] = 0
 }
 var textElement = Qt.createQmlObject(
 'import QtQuick 2.1;'+
 'Text {' +
 ' text: qsTr("' + data[key] + '"); '+
 'font.pointSize: 14'+ '}',
 parent, "calcColumnWidths")
columns[key] = Math.max(textElement.width, columns[key])
 textElement.destroy()

 }
 }

 return columns
}
