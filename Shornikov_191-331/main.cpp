#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "httpcontroller.h"

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);
    // Main preferences
    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);
    // HTTP Objects + Signals
    QObject *main = engine.rootObjects().first();
    HTTPController httpcontroller(main);
    // Signal connection
    QObject::connect(main, SIGNAL(btnHTTPRequest()),
            &httpcontroller, SLOT(getPageInfo()));
    QObject::connect(main, SIGNAL(btnHTTPResponse()),
            &httpcontroller, SLOT(sendPageInfo()));
    return app.exec();
}
