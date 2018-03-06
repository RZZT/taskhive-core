import QtQuick 2.0

Item {
    height: 60
    width: 406
    Image {
        id: image
        x: 0
        y: 0
        fillMode: Image.PreserveAspectFit
        source: "images/graphic-rating.svg"
    }
    Image {
        id: centerImage
        x: (parent.width / 2) - fakeImage.paintedWidth / 2
        y: (parent.height / 2) + 1
        source: "images/graphic-rating-hex-02.svg"

    }
}
