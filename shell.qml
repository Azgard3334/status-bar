import Quickshell
import QtQuick
import QtQuick.Controls
import Quickshell.Hyprland
import Quickshell.Services.UPower
import Quickshell.Networking

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

      Text {
        anchors {
          left: parent.left
          leftMargin: 12
          verticalCenter: parent.verticalCenter
        }

        color: "white"
        font.pixelSize: 14
        font.bold: true

        text: Hyprland.focusedWorkspace?.id ?? "?"
      }

      Text {
        anchors.centerIn: parent

        color: "white"
        font.pixelSize: 14
        font.bold: true

        text: Qt.formatTime(new Date(), "HH:mm")

        Timer {
          interval: 1000
          running: true
          repeat: true

          onTriggered: {
            parent.text = Qt.formatTime(new Date(), "HH:mm")
          }
        }
      }

      Row {
        anchors {
          right: parent.right
          rightMargin: 12
          verticalCenter: parent.verticalCenter
        }

        spacing: 16

        Text {
          color: "white"
          font.pixelSize: 14

          text: {
            if (Networking.connectivity === Networking.Full) {
              return "Ethernet: on"
            } else {
              return "Ethernet: off"
            }
          }
        }

        Text {
          color: "white"
          font.pixelSize: 14

          text: {
            const battery = UPower.displayDevice

            if (!battery) {
              return "Battery: ?"
            }

            return "Battery: " + Math.round(battery.percentage * 100) + "%"
          }
        }
      }
    }
  }
}
