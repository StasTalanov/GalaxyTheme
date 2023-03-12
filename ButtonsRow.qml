import QtQuick 2.15
import QtQuick.Layouts 1.3

Item {
    id: root
    property alias buttonsSpacing : row.spacing
    property int buttonWidth: 180
    property int buttonsHoverAnimationDuration: 500
    property UserCard target

    height: parent.height * 0.1
    width: buttonWidth * 2 + buttonsSpacing * 3

    x: parent.width / 2 - width / 2
    y: parent.height * 0.7

    Rectangle
    {
        anchors.fill: parent
        color: "transparent"
    }

    Row
    {
        id: row
        anchors.centerIn: parent

        Button
        {
            id: btnTryAgain
            buttonText: qsTr("Попробовать еще раз")
            width: buttonWidth
            targetUser: target
            tryAgainAction: true
        }

        Button
        {
            id: tryFaceId
            buttonText: qsTr("Вход по биометрии")
            width: buttonWidth
            targetUser: target
            tryFaceIdAction: true
        }

    }

    Behavior on opacity
    {
        OpacityAnimator {duration: 200}
    }

}
