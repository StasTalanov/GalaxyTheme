import QtQuick 2.15

Item {

    id: root
    property alias buttonsSpacing : statusBarRow.spacing
    property int buttonWidth: 35
    property int dateWidth: 80
    property int timeWidth: 50
    height: 40
//  Use this line after language icon adding:
//  width: buttonWidth * 2 + dateWidth + timeWidth + buttonsSpacing * 5

    width: buttonWidth * 1 + dateWidth + timeWidth + buttonsSpacing * 5

    x: parent.width - width
    y: 0

    Row
    {
        id: statusBarRow
        anchors.centerIn: parent
        spacing: 5

//        Rectangle
//        {
//            id: languageFrame
//            width: root.buttonWidth
//            height: root.height
//            color: "transparent"
//            Image
//            {
//                id: languageImage
//                source: "qrc:/res/images/batteryMainPower.png"
//                anchors.centerIn: parent
//                fillMode: Image.PreserveAspectFit
//            }
//        }

        Rectangle
        {
            id: batteryFrame
            width: root.buttonWidth
            height: root.height
            color: "transparent"
            Image
            {
                id: batteryImage
                source: "qrc:/res/images/batteryMainPower.png"
                anchors.centerIn: parent
                fillMode: Image.PreserveAspectFit
            }
        }

        Rectangle
        {
            id: dateFrame
            width: root.dateWidth
            height: root.height
            color: "transparent"
            Text
            {
                id: dateText
                color: "white"
                font.pointSize: 10
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                width: parent.width
                height: parent.height
                text: "Вт 13 Дек"
            }
        }

        Rectangle
        {
            id: timeFrame
            width: root.timeWidth
            height: root.height
            color: "transparent"
            Text
            {
                id: timeText
                color: "white"
                font.pointSize: 10
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                width: parent.width
                height: parent.height
                text: "15:45"
            }
        }
    }

}
