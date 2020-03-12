import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.13
import QtQuick.Controls.Material 2.13

Window {
  width: 620
  height: 500
  visible: true

    Page {
      anchors.fill: parent
      header: Custom_header {}
      Clock {}
    }
  }
