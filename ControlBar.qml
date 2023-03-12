import QtQuick 2.15

Item
{
    id: root
    property alias buttonsSpacing : row.spacing
    property int buttonWidth: 200
    height: parent.height * 0.1
    width: buttonWidth * 2 + buttonsSpacing * 3

    x: parent.width / 2 - width / 2
    y: parent.height * 0.85

    Row
    {
        id: row
        anchors.centerIn: parent
        spacing: 50

        RoundButton
        {
            controlBar: root
            text : qsTr("Режим сна")
            iconSource: "qrc:/res/images/sleep.png"
            action: actionType.sleep
        }

        RoundButton
        {
            controlBar: root
            text : qsTr("Перезагрузить")
            iconSource: "qrc:/res/images/restart.png"
            action: actionType.restart
        }

        RoundButton
        {
            controlBar: root
            text : qsTr("Выключить")
            iconSource: "qrc:/res/images/power.png"
            action: actionType.poweroff
        }

    }

}
