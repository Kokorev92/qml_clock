import QtQuick.Controls 2.13
import QtQuick.Controls.Material 2.13

MenuBar {
    contentWidth: 20
    Material.theme: Material.Dark
    Material.accent: Material.Orange
    Menu {
        
    Material.theme: Material.Dark
    Material.accent: Material.Orange
        title: qsTr("Menu")
        Action { text: "About" }
        MenuSeparator { }
        Action { text: "Exit" }
    }
}
