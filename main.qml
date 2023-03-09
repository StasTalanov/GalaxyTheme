import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 1024
    height: 800
    visible: true
    title: qsTr("Galaxy")

    Background
    {
        id: background
        source: "qrc:/res/images/wallpaper.png"
        gaussianBlurRadius: 16
        gaussianBlurDeviation: 8
        gaussianBlurSamples: 16
    }

    UserCards
    {
        UserCard
        {
            id: user
            name: "Stas Talanov"
            photoSource: "qrc:/res/images/photo_examp.jpg"
            anchors.centerIn: parent
            scale: isSelected ? background.width / 1024 : background.width / 1100
            opacityChangeDuration: 500
        }
    }

    StatusPrompt
    {
        pushSentVisible: user.isSelected
        pushErrorVisible: !pushSentVisible && user.isSelected
        targetUser: user
        visible: user.isSelected
    }




}
