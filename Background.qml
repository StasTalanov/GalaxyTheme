import QtQuick 2.15
import QtGraphicalEffects 1.15

FocusScope {
    id: container
    anchors.fill: parent

    property alias source:                  wallpaper.source
    property alias gaussianBlurRadius:      gaussianBlur.radius
    property alias gaussianBlurDeviation:   gaussianBlur.deviation
    property alias gaussianBlurSamples:     gaussianBlur.samples

    Image {
        id: wallpaper
        anchors.fill: parent
        fillMode: Image.PreserveAspectCrop

        clip: true
        focus: true
        smooth: true
    }


    GaussianBlur {
        id: gaussianBlur
            anchors.fill: wallpaper
            source: wallpaper
        }

    Rectangle
    {
        x: 0
        y: 0
        color: "black"
        anchors.fill: parent
        opacity: 0.5
    }


    MouseArea {
        anchors.fill: parent
        onClicked: container.focus = true
    }
}
