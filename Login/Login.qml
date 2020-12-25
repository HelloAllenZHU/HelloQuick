import QtQuick 2.12                         // 导入QtQuick基本库
import QtQuick.Window 2.12                  // 导入QtQuick窗口库
import QtQuick.Controls 2.12                // 导入QtQuick控件库
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.4


ApplicationWindow {
    // id
    id: window_login

    // 是否可见(默认不可见)
    visible: true

    // 宽度
    width: 350

    // 高度
    height: 550

    // 无边框窗口
    flags: Qt.Window | Qt.FramelessWindowHint

    // 窗口阴影(需设置窗口背景色为透明)
    color: "#00000000"
    Rectangle {
        id: rect
        anchors.fill: parent
        anchors.margins: 10
        radius: 5
    }
    DropShadow {
        anchors.fill: rect
        samples: 20
        source: rect
        color: "gray"
    }

    //拖动窗口
    MouseArea { //为窗口添加鼠标事件
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenterOffset: 30
        acceptedButtons: Qt.LeftButton //只处理鼠标左键
        property point clickPos: "0,0"
        onPressed: { //接收鼠标按下事件
                clickPos  = Qt.point(mouse.x,mouse.y)
        }
        onPositionChanged: { //鼠标按下后改变位置
            //鼠标偏移量
            var delta = Qt.point(mouse.x-clickPos.x, mouse.y-clickPos.y)

            //如果mainwindow继承自QWidget,用setPos
            window_login.setX(window_login.x+delta.x)
            window_login.setY(window_login.y+delta.y)
        }
    }

    StackView {
        id: stackView
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenterOffset: 30
        anchors.margins: 10
        initialItem: PageLogin {}
    }

    // 关闭按钮
    Button {
        id: btn_close
        text: qsTr("")
        width: 20
        height: 20
        x: window_login.width-width - rect.anchors.margins * 2
        y: rect.anchors.margins * 2

        background: Rectangle {
            color: "White"
        }

        BorderImage {
            width: parent.width
            height: parent.height
            anchors.fill: parent
            source: "qrc:/Images/Login/btnClose.png"
        }

        Connections {
            target: btn_close
            onClicked: Qt.quit();
        }
    }
}


/*##^##
Designer {
    D{i:0;formeditorZoom:0.9}D{i:1;locked:true}D{i:2;locked:true}D{i:3;locked:true}
}
##^##*/
