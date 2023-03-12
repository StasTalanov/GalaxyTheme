import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 1280
    height: 800
    visible: true
    title: qsTr("Galaxy")

    QtObject
    {
        id: actionType
        property int notSet:    0
        property int sleep:     1
        property int restart:   2
        property int poweroff:  3
    }

    Background
    {
        id: background
        source: "qrc:/res/images/wallpaper.png"
        gaussianBlurRadius: 16
        gaussianBlurDeviation: 8
        gaussianBlurSamples: 16
    }

    StatusBar
    {

    }

    UserCards
    {
        UserCard
        {
            id: user
            name: "Stas Talanov"
            photoSource: "qrc:/res/images/photo_examp.jpg"
            anchors.centerIn: parent
            scale: isSelected ? background.width / 1280 : background.width / 1280
            opacityChangeDuration: 500
        }
    }

    StatusPrompt
    {
        visible: user.isSelected
        statusText: (user.isSelected && user.isAnimated) ? qsTr("На ваше устройство отправлен запрос на подтверждение входа") : qsTr("Произошла ошибка")
    }

    ButtonsRow
    {
        buttonsSpacing: 20
        buttonsHoverAnimationDuration: 500
        opacity: (user.isSelected && !user.isAnimated) ? 1 : 0
        target: user
    }

    ControlBar
    {
        buttonsSpacing: 60
    }

    Timer {
            interval: 4000; running: user.isAnimated; repeat: true
            onTriggered:
            {
                user.isAnimated = false
            }
        }


}
