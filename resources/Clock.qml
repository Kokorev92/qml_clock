import QtQuick 2.13
import QtQuick.Controls 2.13


Label {
    id: my_label
    anchors.fill: parent
    text: "Test"

    Timer {
        interval: 500
        running: true
        repeat: true

        onTriggered: getTime()
    }

    function getTime() {
        var currentTime = new Date()
        my_label.text = currentTime.getSeconds().toString()
    }
}
