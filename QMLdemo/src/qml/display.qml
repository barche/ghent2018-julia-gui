import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0
import org.julialang 1.0

ApplicationWindow {
  title: "My Application"
  width: 600
  height: 600
  visible: true
  onClosing: Qt.quit()

  ListView {
    id: thelist
    anchors.fill: parent
    model: ndisplays
    cacheBuffer: height*ndisplays
    highlightMoveDuration: 100
    delegate: JuliaDisplay {
      width: parent.width
      height: 400
      MouseArea { anchors.fill: parent; onClicked: thelist.currentIndex = index }
    }
    highlight: Rectangle { color: "lightsteelblue"; radius: 5 }
    focus: true
    onCurrentItemChanged: if(currentItem != null) { display = currentItem; }
  }
}
