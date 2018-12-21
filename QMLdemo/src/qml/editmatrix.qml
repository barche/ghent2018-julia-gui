import QtQuick 2.0
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.0

ApplicationWindow {
  id: appRoot
  title: "Arrays"
  width: 300
  height: 300
  visible: true

  Flickable {
    width: appRoot.width
    height: appRoot.height

    contentWidth: grid.width
    contentHeight: grid.height

    Grid { // arrange items in a grid
      id: grid
      columns: cols // from Julia

      Repeater { // Repeat for each array element
        model: arrayModel

        TextField {
          width: 70
          onTextChanged: arrayValue = text
          Component.onCompleted: text = arrayValue
        }
      }
    }
  }
}
