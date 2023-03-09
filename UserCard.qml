import QtQuick 2.15
import QtGraphicalEffects 1.0

Item
{
    id: wrapper

    property bool               isSelected: false
    property bool               isAnimated: false
    property string     name
    property string     userName
    property alias      photoSource: photo.source
    property alias      opacityChangeDuration: opacityAnimator.duration
    signal clicked()

    width:          300
    height:         300
    opacity:        isSelected ? 1.0 : 0.7

    Behavior on opacity
    {
        OpacityAnimator {id: opacityAnimator}
    }

    Behavior on scale
    {
        ScaleAnimator {id: scaleAnimator; duration: opacityChangeDuration}
    }

    Rectangle
    {
        id: userCardField
        width: wrapper.width
        height: wrapper.height
        color: "transparent"

        Rectangle
        {
            id: photoCircle
            width: wrapper.width * 0.45
            height: width
            border.width: 2
            border.color: "grey"
            radius: width / 2
            anchors.centerIn: userCardField
            color: "black"
            Image
            {
                id: photo
                fillMode: Image.PreserveAspectFit
                smooth: false
                anchors.fill: parent
                property bool rounded: true
                property bool adapt: true

                layer.enabled: rounded
                layer.effect: OpacityMask
                {
                    maskSource: Item
                    {
                        width: photo.width
                        height: photo.height
                        Rectangle
                        {
                            anchors.centerIn: parent
                            width: photo.adapt ? photo.width : Math.min(photo.width, photo.height)
                            height: photo.adapt ? photo.height : width
                            radius: Math.min(width, height)
                        }
                    }
                }
            }

            Path
            {
                property real s: 0.68
                id: planetPath
                startX: photo.x - photo.width * 0.23
                startY: photo.y + photo.height / 1.18
                PathCurve { x: planetPath.startX + 68 * planetPath.s;  y: planetPath.startY + 13 * planetPath.s}
                PathCurve { x: planetPath.startX + 238 * planetPath.s;  y: planetPath.startY - 53 * planetPath.s}
                PathCurve { x: planetPath.startX + 301 * planetPath.s;  y: planetPath.startY - 120 * planetPath.s}
                PathCurve { x: planetPath.startX + 193 * planetPath.s;  y: planetPath.startY - 122 * planetPath.s}
                PathCurve { x: planetPath.startX + 47 * planetPath.s;  y: planetPath.startY - 55 * planetPath.s}
                PathCurve { x: planetPath.startX;  y: planetPath.startY}
            }

            Image
            {
                id: orbit
                width: wrapper.width * 0.7
                source: "qrc:/res/images/Orbit.png"
                fillMode: Image.PreserveAspectFit
                anchors.centerIn: photoCircle
            }

            Rectangle
            {
                id: planet
                width: 6
                height: 6
                radius: width / 2
                color: "white"
                visible: isAnimated
                x: photo.x
                y: photo.y + photo.height/2
                z: 100
            }

        }

        ParallelAnimation
        {
            id: anim
            loops: Animation.Infinite
            running: isAnimated
            PathAnimation
            {
                id: moveAnimation
                duration: 1500
                target: planet
                anchorPoint: Qt.point(planet.width/2, planet.height/2)
                orientation: PathAnimation.TopFirst
                orientationEntryDuration: 400
                orientationExitDuration: 400
                path: planetPath
            }
            SequentialAnimation
            {
                PauseAnimation { duration: moveAnimation.duration * 0.6 }
                NumberAnimation
                {
                    target: planet
                    property: "opacity"
                    duration: moveAnimation.duration * 0.02
                    from: 1; to: 0
                }
                PauseAnimation { duration: moveAnimation.duration * 0.28 }
                NumberAnimation {
                    target: planet
                    property: "opacity"
                    duration: moveAnimation.duration * 0.02
                    from: 0; to: 1
                }
            }
        }

        Text
        {
            id: name
            text: qsTr("Станислав Таланов")
            color: "white"
            font.pointSize: 14
            x: userCardField.x
            y: userCardField.y + userCardField.height * 0.8
            width: userCardField.width
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.WordWrap
            font.bold: true
        }

        MouseArea
        {
           anchors.fill: parent
           hoverEnabled: true
           onClicked:
           {
               isSelected = !isSelected
               isAnimated = isSelected
           }
        }

    }
}
