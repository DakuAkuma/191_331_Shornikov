#include "httpcontroller.h"
#include <QEventLoop>
#include <QQuickItem>
#include <QQuickView>

HTTPController::HTTPController(QObject *parent) : proto(parent)
{
    nam = new QNetworkAccessManager(this);
}

void HTTPController::sendPageInfo()
{
    // Parsing for value //
    QString answerData = QString(reply->readAll());
    QString neededStr = QString(answerData.mid(answerData.indexOf("id=\"pole_2\" class=\"pole_vvod\""),answerData.lastIndexOf("<div class=\"vvod_chsl_2\">")-answerData.indexOf("id=\"pole_2\" class=\"pole_vvod\"")));
    QString parsedValue = QString(neededStr.mid(neededStr.lastIndexOf("=\"")+2,neededStr.lastIndexOf("\">")-(neededStr.lastIndexOf("=\"")+2)));
    qDebug() << neededStr;
    //qDebug() << reply->readAll();
    // Finding text area
    QObject* textArea = proto->findChild<QObject*>("pageCode");
    // Filling text area
    if(textArea)
        textArea->setProperty("text", answerData);
    // Finding text field (label)
    QObject* textField = proto->findChild<QObject*>("valueKeeper");
    // Filling label
    //qDebug() << ;
    if(textField) {
        textField->setProperty("text", parsedValue);
        textField->setProperty("color", "green");
    }
}

void HTTPController::getPageInfo() {
    // GET request to site.
    reply = nam->get(QNetworkRequest(QUrl("https://calculator888.ru/converter-valut/dollar-v-rubli/2-usd-rub/")));
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
}
