import QtQuick 2.15

Item
{
    property alias      pushSentVisible: status_push_sent.visible
    property alias      pushErrorVisible: status_push_error.visible
    property UserCard   targetUser

    y: parent.height * 0.7
    width: parent.width * 0.25
    height: parent.height * 0.1
    anchors.horizontalCenter: parent.horizontalCenter

    Text {
        id: status_push_sent
        text: qsTr("На ваше устройство отправлен запрос на подтверждение входа")
        color: "white"
        font.pointSize: 12
        horizontalAlignment: Text.AlignHCenter
        wrapMode: Text.WordWrap
        anchors.fill: parent
        lineHeight: 1.5
    }

    Text {
        id: status_push_error
        text: qsTr("Произошла ошибка")
        color: "white"
        font.pointSize: 12
        horizontalAlignment: Text.AlignHCenter
        wrapMode: Text.WordWrap
        anchors.fill: parent
        lineHeight: 1.5
        visible: false
    }



    Timer {
            interval: 4000; running: pushSentVisible; repeat: true
            onTriggered:
            {
                status_push_sent.visible = false
                status_push_error.visible = targetUser.isSelected
                targetUser.isAnimated = false
            }
        }
}
