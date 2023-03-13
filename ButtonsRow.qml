import QtQuick 2.15
import QtQuick.Layouts 1.3

Item {
    id: root
    property int buttonsSpacing : 20
    property int buttonWidth: 180
    property int buttonsHoverAnimationDuration: 500
    property UserCard target
    property bool faceIdAuthIsActive:   false
    property bool pushAuthIsActive:     false
    property bool passwordAuthIsActive: false

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
        id: rowPush
        anchors.centerIn: parent
        visible: pushAuthIsActive
        spacing: buttonsSpacing

        Button
        {
            buttonText: qsTr("Попробовать еще раз")
            width: buttonWidth
            targetUser: target
            loginByPush: true
        }

        Button
        {
            buttonText: qsTr("Вход по биометрии")
            width: buttonWidth
            targetUser: target
            tryFaceIdAction: true
        }
    }

    Row
    {
        id: rowFaceId
        anchors.centerIn: parent
        visible: faceIdAuthIsActive
        spacing: buttonsSpacing

        Button
        {
            buttonText: qsTr("Попробовать еще раз")
            width: buttonWidth
            targetUser: target
            loginByFaceId: true
        }

        Button
        {
            buttonText: qsTr("Вход по паролю")
            width: buttonWidth
            targetUser: target
            tryPasswordAction: true
        }
    }

    Row
    {
        id: rowPassword
        anchors.centerIn: parent
        visible: passwordAuthIsActive
        spacing: buttonsSpacing

        Button
        {
            buttonText: qsTr("Попробовать еще раз")
            width: buttonWidth
            targetUser: target
            loginByPassword: true
        }
    }

    Behavior on opacity
    {
        OpacityAnimator {duration: 200}
    }

}
