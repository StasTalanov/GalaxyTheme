import QtQuick 2.15

Item {

    property alias buttonText : label.text
    property int colorAnimationDuration : 200
    width: 180
    height: label.font.pointSize * 3
    property UserCard targetUser
    property bool loginByPush: false
    property bool tryFaceIdAction: false
    property bool loginByFaceId: false
    property bool tryPasswordAction: false
    property bool loginByPassword: false

    Rectangle
    {
        id: buttonBody
        anchors.fill: parent
        color: mouse.hovered ? "#6734D4" : "#40444A"
        radius: 5

        Text {
            id: label
            color: "white"
            font.pointSize: 10
            horizontalAlignment: Text.AlignHCenter
            anchors.centerIn: parent
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
                if (loginByPush)
                {
                    targetUser.isAnimated = true
                }
                else if (loginByFaceId)
                {
                    targetUser.isAnimated = true
                }
                else if (loginByPassword)
                {
                    targetUser.isAnimated = true
                }
                else if (tryFaceIdAction)
                {
                    // Toggle off the push row
                }
                else if (loginByPassword)
                {
                    // Toggle off the faceId row
                }
            }
        }

        Behavior on color {

            ColorAnimation {
                duration: colorAnimationDuration
            }
        }
    }

}
