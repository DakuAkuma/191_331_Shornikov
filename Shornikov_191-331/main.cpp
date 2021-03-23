#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
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
    QQmlContext *context = engine.rootContext();
    // HTTP Objects + Signals
    HTTPController httpcontroller;
    // Making HTTP Controller visible in QML
    context->setContextProperty("httpController", &httpcontroller);
    QObject *main = engine.rootObjects().first();
    // Signal connection
    QObject::connect(main, SIGNAL(btnHTTPRequest()),
            &httpcontroller, SLOT(getPageInfo()));
    return app.exec();
}
