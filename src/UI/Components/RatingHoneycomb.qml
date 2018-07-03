import QtQuick 2.0
import QtGraphicalEffects 1.0
Item {
    id: honeycombParent
    property variant reputation: ListModel
    height: 60
    width: 406

    function setReputation (reputation){
        if (reputation.length > 0){
            var negativeREP = reputation[0];
            var positiveREP = reputation[1];
            var currentX = centerImage.x;
            var currentY = 16;
            var counter = 0;
            var db = false;
            for(var i = 0;i<negativeREP; i++){
                if(counter==0) {
                    var newObject = Qt.createQmlObject('import QtQuick 2.0; import QtGraphicalEffects 1.0; Image { x:' + Math.ceil(currentX - 27) + '; y:'+ currentY +'
            source: "../images/graphic-rating-hex-02.svg" }', honeycombParent, 'testimage1');
                    currentX = newObject.x
                    counter++;
                    // print(counter + ': '+ newObject.x + ' - ' + newObject.y );
                }
                else {
                    if(!db){
                        currentY = 0;
                        var newObject1 = Qt.createQmlObject('import QtQuick 2.0; import QtGraphicalEffects 1.0; Image { x:' + Math.ceil(currentX - 27) + '; y:'+ currentY +'
                source: "../images/graphic-rating-hex-02.svg" }', honeycombParent, 'testimage1');
                        // print(counter + ': '+ newObject1.x + ' - ' + newObject1.y );
                        db = true;
                        counter++;
                    }
                    else {
                        currentY = 31;

                        var newObject2 = Qt.createQmlObject('import QtQuick 2.0; import QtGraphicalEffects 1.0; Image { x:' + Math.ceil(currentX - 27) +'; y:'+ currentY +'
                source: "../images/graphic-rating-hex-02.svg" }', honeycombParent, 'testimage1');
                        // print(counter + ': '+ newObject2.x + ' - ' + newObject2.y );
                        counter = 0;
                        currentY = 16;
                        currentX = newObject2.x
                        db = false;
                    }

                }
            }
            counter = 0;
            db = false;
            currentY = 16;
            currentX = centerImage.x;
            for(var i = 0;i<positiveREP; i++){
                if(counter==0) {
                    var newObject = Qt.createQmlObject('import QtQuick 2.0; import QtGraphicalEffects 1.0; Image { x:' + Math.ceil(currentX + 27) + '; y:'+ currentY +'
            source: "../images/graphic-rating-hex-02.svg" }', honeycombParent, 'testimage1');
                    currentX = newObject.x
                    counter++;
                    /// print(counter + ': '+ newObject.x + ' - ' + newObject.y );
                }
                else {
                    if(!db){
                        currentY = 0;
                        var newObject1 = Qt.createQmlObject('import QtQuick 2.0; import QtGraphicalEffects 1.0; Image { x:' + Math.ceil(currentX + 27) + '; y:'+ currentY +'
                source: "../images/graphic-rating-hex-02.svg" }', honeycombParent, 'testimage1');
                        // print(counter + ': '+ newObject1.x + ' - ' + newObject1.y );
                        db = true;
                        counter++;
                    }
                    else {
                        currentY = 31;

                        var newObject2 = Qt.createQmlObject('import QtQuick 2.0; import QtGraphicalEffects 1.0; Image { x:' + Math.ceil(currentX + 27) +'; y:'+ currentY +'
                source: "../images/graphic-rating-hex-02.svg" }', honeycombParent, 'testimage1');
                        // print(counter + ': '+ newObject2.x + ' - ' + newObject2.y );
                        counter = 0;
                        currentY = 16;
                        currentX = newObject2.x
                        db = false;
                    }

                }
            }
        }
    }

    Image {
        id: image
        x: 0
        y: 0
        fillMode: Image.PreserveAspectFit
        source: "../images/graphic-rating.svg"
        visible: false
    }
    Image {
        id: fakeImage
        x: parent.width / 2
        y: parent.height / 2
        source: "../images/graphic-rating-hex-02.svg"
       visible: false
    }
    Image {
        id: centerImage
        x: (parent.width / 2) - fakeImage.paintedWidth / 2
        y: (parent.height / 2) + 1
        source: "../images/graphic-rating-hex-02.svg"
    }
    Image {
        id: centerImage2
        x: (parent.width / 2) - fakeImage.paintedWidth / 2
        y: 0
        source: "../images/graphic-rating-hex-02.svg"
    }

    Component.onCompleted: {
        setReputation([10,10])
    }
}
