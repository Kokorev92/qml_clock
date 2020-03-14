import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.13
import QtQuick.Controls.Material 2.13

Window {
    id: window
    width: 620
    height: 620  + header.height
    visible: true
    title: "QML analog clock"

    Page {
        anchors.fill: parent
        header: Custom_header {
            id: header
        }
        Rectangle {
            width: parent.width
            height: parent.height
            color: "#FFFFFF"
        }
        Clock {}
    }
}
