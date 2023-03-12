import QtQuick 2.15

Item
{
    property alias      statusText: statusMessage.text


    y: parent.height * 0.65
    width: parent.width * 0.25
    height: parent.height * 0.1
    anchors.horizontalCenter: parent.horizontalCenter

    Text {
        id: statusMessage

        color: "white"
        font.pointSize: 10
        horizontalAlignment: Text.AlignHCenter
        wrapMode: Text.WordWrap
        anchors.fill: parent
        lineHeight: 1.5
    }
}
