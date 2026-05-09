import Quickshell
import QtQuick

ShellRoot {
  PanelWindow {
    anchors {
      top: true
      left: true
      right: true
    }

    implicitHeight: 32

    Rectangle {
      anchors.fill: parent
      color: "#111111"
    }
  }
}
