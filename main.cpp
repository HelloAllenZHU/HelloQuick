#include <QGuiApplication>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[])
{
    //高分辨率支持
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    //应用程序实例
    QGuiApplication app(argc, argv);

    //Qml应用程序引擎
    QQmlApplicationEngine engine;

    //主UI文件
    const QUrl url(QStringLiteral("qrc:/Login/Login.qml"));

    //???
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);

    //加载主UI文件
    engine.load(url);

    //消息循环
    return app.exec();
}
