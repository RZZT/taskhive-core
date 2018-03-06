import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3
import QtQml 2.2

Window {
    id: appWindow
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    property string jsonData: '{"categories":[
               {
                   "name": "Audio / Video",
                   "sub_categories": [
                       {
                           "name": "Video",
                           "sub_categories": [
                               {
                                   "name":"Recording",
                                   "sub_categories": [
                                       {
                                           "name": "Acting"
                                       },
                                       {
                                           "name": "Footage"
                                       }
                                   ]
                               },
                               {
                                   "name": "Editing"
                               },
                               {
                                   "name": "Rendering"
                               },
                               {
                                   "name": "Animation"
                               }
                           ]
                       },
                       {
                           "name": "Audio",
                           "sub_categories": [
                               {
                                   "name": "Editing & Mastering"
                               },
                               {
                                   "name": "Voiceovers / Acting"
                               },
                               {
                                   "name": "Composition",
                                   "sub_categories": [
                                       {
                                           "name": "Soundtrack"
                                       },
                                       {
                                           "name": "Jingles"
                                       },
                                       {
                                           "name": "Pop"
                                       },
                                       {
                                           "name": "Jazz"
                                       },
                                       {
                                           "name": "Other"
                                       }
                                   ]
                               }
                           ]
                       }
                   ]
               },
               {
                   "name": "Graphics",
                   "sub_categories": [
                       {
                           "name": "2D",
                           "sub_categories": [
                               {
                                   "name": "Design",
                                   "sub_categories": [
                                       {
                                           "name": "Characters"
                                       },
                                       {
                                           "name": "Enviroments"
                                       },
                                       {
                                           "name": "Clothing (Fashion)"
                                       }
                                   ]
                               },
                               {
                                   "name": "Photography"
                               },
                               {
                                   "name": "Editing",
                                   "sub_categories": [
                                       {
                                           "name": "Photograpy Retouching"
                                       }
                                   ]
                               },
                               {
                                   "name": "Illustration",
                                   "sub_categories": [
                                       {
                                           "name": "Digital"
                                       },
                                       {
                                           "name": "Physical Media"
                                       }
                                   ]
                               }
                           ]
                       },
                       {
                           "name": "3D",
                           "sub_categories": [
                               {
                                   "name": "Dead Matter",
                                   "sub_categories": [
                                       {
                                           "name": "Objects"
                                       },
                                       {
                                           "name": "Enviroments",
                                           "sub_categories": [
                                               {
                                                   "name": "Terrain"
                                               },
                                               {
                                                   "name": "Architecture"
                                               }
                                           ]
                                       }
                                   ]
                               }
                           ]
                       }
                   ]
               }
           ]
}'
    Column {
        id: column
        width: appWindow.width
    }

    Component {
        id: categoryComponent
        RowLayout {
            property alias name: nameText.text
            width: parent.width
            Text {
                id: nameText
            }
        }
    }

    Component {
        id: subLevelComponent
        Column {}
    }
    Component {
        id: subCategoryComponent
        Text {}
    }

    Component.onCompleted: {
        var data = JSON.parse(jsonData);
        for (var i in data.categories) {
            var category = data.categories[i];
            var categoryItem = categoryComponent.createObject(column, {name: category.name});
            print(category.sub_categories.length, category.sub_categories);
            if (category.sub_categories.length > 0) {
                var subLevelItem = subLevelComponent.createObject(categoryItem);
                for (var j in category.sub_categories) {
                    var subCategory = category.sub_categories[j];
                    subCategoryComponent.createObject(subLevelItem, {text: subCategory.name});
                }
            }
        }
    }
}
