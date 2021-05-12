#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QtWebView>
#include "httpcontroller.h"

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);
    // Main preferences
    QQmlApplicationEngine engine;
    // Context created
    QQmlContext *context = engine.rootContext();
    // General HTTP controller
    HTTPController httpController;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    context->setContextProperty("httpController", &httpController);
    // До сюда можно запихивать в контекст!!!
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);
    QObject *main = engine.rootObjects().first();
    // HTTP Controller for lab. 3.
    HTTPController mainController(main);
    // Signal connection
    QObject::connect(main, SIGNAL(btnHTTPRequest()),
            &mainController, SLOT(getPageInfo()));
    QObject::connect(main, SIGNAL(btnHTTPResponse()),
            &mainController, SLOT(sendPageInfo()));
    QObject::connect(main, SIGNAL(requestMessage()),
                     &httpController, SLOT(messageController()));

    return app.exec();

    /*
     * Нативный:
     * 1) Реализованный на комп. языке и выполняемый непосредственно на CPU.
     * 2) Реализованный инструментами, рекомендованными и предоставляемыми разработчиками платформы.
     */
}
