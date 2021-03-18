#include "httpcontroller.h"

#include <QEventLoop>

HTTPController::HTTPController(QObject *parent) : QObject(parent)
{
    nam = new QNetworkAccessManager(this);
}

void HTTPController::getPageInfo() {
    QEventLoop evtLoop;
    connect(nam, &QNetworkAccessManager::finished,
            &evtLoop, &QEventLoop::quit);
    QNetworkReply *reply = nam->get(QNetworkRequest(QUrl("https://new.mospolytech.ru/")));
    evtLoop.exec();
    qDebug() << "*** Ожидание сервера завершено, ответ: ***";
    qDebug() << "** Pairs: **";
    for (auto pair : reply->rawHeaderPairs()) {
        // FULL INFO
        //qDebug() << "** Ключ:" << pair.first << "; Значение:" << pair.second <<"\n";
        // ONLY NEEDED INFO
        qDebug() << pair.first << pair.second;
    }
    // HTML code.
    //qDebug() << "** Data: **\n" << reply->readAll();
}

/*void HTTPController::replyFinished(QNetworkReply * reply) {
    // Вывод в GUI.
}*/
