import QtQuick 2.15

Item {

    property alias text : textLine.text
    property alias iconSource : icon.source
    property Item controlBar
    property int action: actionType.notSet
    property int colorAnimationDuration : 500


    width: controlBar.width / 3 - 2 * controlBar.buttonsSpacing
    height: controlBar.height

    Rectangle
    {
        anchors.fill: parent
        color: "transparent"
        Rectangle
        {
            x: parent.width / 2 - width / 2
            width: parent.width * 0.8
            height: width
            radius: width / 2
            color: mouse.hovered ? "#6734D4" : "#3D434A"
            Image
            {
                id: icon
                anchors.centerIn: parent
                source: "qrc:/res/images/sleep.png"
            }
            Text
            {
                id: textLine
                color: "white"
                font.pointSize: 10
                horizontalAlignment: Text.AlignHCenter
                width: parent.width
                height: parent.height * 0.2
                y: parent.height
                text: qsTr("Режим сна")
            }

            HoverHandler
            {
                id: mouse
                cursorShape: Qt.PointingHandCursor
            }

            MouseArea
            {
                anchors.fill: parent
                onClicked: {
                    if (action == actionType.sleep)
                    {
                    }
                    else if (action == actionType.restart)
                    {
                    }
                    else if (action == actionType.poweroff)
                    {
                    }
                    else
                    {
                        // Do nothing
                    }
                }
            }

            Behavior on color
            {
                ColorAnimation { duration: colorAnimationDuration }
            }
        }
    }

}
