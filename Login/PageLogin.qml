import QtQuick 2.0

import QtQuick 2.12                         // 导入QtQuick基本库
import QtQuick.Window 2.12                  // 导入QtQuick窗口库
import QtQuick.Controls 2.12                // 导入QtQuick控件库
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.4


Page {
    // id
    id: page_login

    // 是否可见(默认不可见)
    visible: true

    anchors.fill: parent

    // 标题
    title: qsTr("Hello World")

    // 头像
    Image {
        id: img_head
        width: 150
        height:150
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: -130
        source: "qrc:/Images/Main/head.png"
    }

    // 账号输入框
    TextField {
        id: text_id
        width: 200
        height: 40
        placeholderText: qsTr("请输入账号")
        font.family: "Microsoft Arial"
        font.bold: true
        font.pointSize: 10
        color: "#000000"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: 10
        background: Rectangle {
            anchors.fill: parent
            border.width: 1
            border.color: "#ffc107"
            radius: 5
        }
    }

    // 密码输入框
    TextField {
        id: text_pw
        width: text_id.width
        height: text_id.height
        placeholderText: qsTr("请输入密码")
        font.family: text_id.font.family
        font.bold: text_id.font.bold
        font.pointSize: text_id.font.pointSize
        color: text_id.color
        anchors.horizontalCenter: text_id.horizontalCenter
        anchors.verticalCenter: text_id.verticalCenter
        anchors.verticalCenterOffset: 45
        echoMode: TextInput.Password                        // 密码输入
        //passwordCharacter: "*"                            // 设置作为密码输入框时所显示的字符
        background: Rectangle {
            anchors.fill: parent
            border.width: text_id.background.border.width
            border.color: text_id.background.border.color
            radius: text_id.background.radius
        }
    }

    // 登录
    RoundButton {
        id: btn_login
        width: text_pw.width
        height: text_pw.height
        anchors.horizontalCenter: text_pw.horizontalCenter
        anchors.verticalCenter: text_pw.verticalCenter
        anchors.verticalCenterOffset: 65
        radius: 5

        background: Rectangle {
            color: "#ffc107"
            radius: btn_login.radius
        }

        contentItem: Text {
            text: qsTr("登  录")
            font.family: "Microsoft Arial"
            font.bold: true
            font.pointSize: 15
            color: "#ffffff"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
        }
    }

}
