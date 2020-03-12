import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.13
import QtQuick.Controls.Material 2.13

Window {
  width: 620
  height: 620
  visible: true
  title: "QML analog clock"

    Page {
      anchors.fill: parent
      header: Custom_header {}
      Clock {}
    }
  }
