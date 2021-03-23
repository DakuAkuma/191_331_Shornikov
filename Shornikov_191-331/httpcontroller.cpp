#include "httpcontroller.h"
#include <QEventLoop>
#include <QQuickItem>
#include <QQuickView>

HTTPController::HTTPController(QObject *parent) : proto(parent)
{
    nam = new QNetworkAccessManager(this);
}

void HTTPController::getPageInfo() {
    // GET request to site.
    QNetworkReply *reply = nam->get(QNetworkRequest(QUrl("https://www.youtube.com"))); // /search?q=1+доллар+в+рублях
    // Init of LOOPEvents
    QEventLoop evtLoop;
    connect(nam, &QNetworkAccessManager::finished, &evtLoop, &QEventLoop::quit);
    // Exec of LOOP
    evtLoop.exec();
    // Server response handling
    qDebug() << "*** Ожидание сервера завершено, ответ: ***";
    qDebug() << "** Pairs: **";
    qDebug() << "\"HTTP Status\"" << reply->attribute(QNetworkRequest::HttpStatusCodeAttribute).toString();
    for (auto pair : reply->rawHeaderPairs()) {
        qDebug() << pair.first << pair.second;
    }
    // HTML code.
    qDebug() << "\"Content length\"" << reply->header(QNetworkRequest::ContentLengthHeader).toString();

    // Emit server to answer to QML.
    emit toQML(QString(reply->readAll()), NULL);

    delete reply;
}
