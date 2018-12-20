import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.3
import org.julialang 1.0

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Text {
        id: element
        x: 346
        y: 127
        text: juliaValue
        font.pixelSize: 12
    }

    Button {
        id: button
        x: 158
        y: 127
        text: qsTr("Button")
        onClicked: Julia.update()
    }
}
