import QtQuick 2.13
import QtQuick.Controls 2.13
import QtQuick.Controls.Material 2.13
import QtQuick.Dialogs 1.1

MenuBar {
    id: menu_bar
    contentWidth: 20
    Material.theme: Material.Dark
    Menu {
        id: menu
        Material.theme: Material.Dark
        title: qsTr("Menu")
        Action { 
            text: "About"
            onTriggered: dialog.open()
        }
        MenuSeparator { }
        Action { 
            text: "Exit" 
            onTriggered: close()
        }
    }

    Dialog {
        id: dialog
        parent: Overlay.overlay
        title: "About..."
        standardButtons: StandardButton.Ok
        modal: true
        width: parent.width / 2
        height: parent.height / 2
        anchors.centerIn: parent
        closePolicy: Popup.NoAutoClose

        Text {
            text: qsTr('<font color="red">QML analog clock<br/>It is learning project</font>')
            anchors.centerIn: parent
        }
    }
}
