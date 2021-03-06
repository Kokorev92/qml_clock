import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12

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

         Pane {
            anchors.fill: parent
            Clock {}
            Material.background: "#FFFFFF"
        }
    }
}
