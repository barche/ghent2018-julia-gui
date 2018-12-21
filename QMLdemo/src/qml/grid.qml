import QtQuick 2.12
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.0
import org.julialang 1.0

ApplicationWindow {
  id: appRoot
  title: "Arrays"
  width: 300
  height: 300
  visible: true

  Grid { // arrange items in a grid
    id: grid
    columns: cols // from Julia
    width: appRoot.width
    height: appRoot.height
    
    Repeater { // Repeat for each emoji
      model: emojiModel

      Rectangle { // Each emoji is a rectangle with text in the center
        width: appRoot.width/cols
        height: appRoot.height/cols
        color: bgcolor // from emoji state
        Text {
          height: parent.height
          width: parent.width
          font.pixelSize: height
          font.letterSpacing : -height/4
          fontSizeMode: Text.Fit
          horizontalAlignment: Text.Text.AlignHCenter
          verticalAlignment: Text.AlignVCenter
          text: emoji // from emoji state
        }

        MouseArea {
          anchors.fill: parent
          onClicked: numclicks += 1 // updates the clicks on the Julia side
          onPressed: parent.color = "white" // visual feedback for the clicking
          onReleased: parent.color = bgcolor
        }
      }
    }
  }
}
