#include "httpcontroller.h"
#include <QEventLoop>
#include <QQuickItem>
#include <QQuickView>
#include <QUrl>
#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonArray>

HTTPController::HTTPController(QObject *parent) : proto(parent)
{
    nam = new QNetworkAccessManager(this);
    modelController = new friendsModel();
}

void HTTPController::sendPageInfo()
{
    // Parsing for value //
    QString answerData = QString(reply->readAll());
    QString neededStr = QString(answerData.mid(answerData.indexOf("id=\"pole_2\" class=\"pole_vvod\""),answerData.lastIndexOf("<div class=\"vvod_chsl_2\">")-answerData.indexOf("id=\"pole_2\" class=\"pole_vvod\"")));
    QString parsedValue = QString(neededStr.mid(neededStr.lastIndexOf("=\"")+2,neededStr.lastIndexOf("\">")-(neededStr.lastIndexOf("=\"")+2)));
    //qDebug() << neededStr;
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
    // Init of LoopEvents
    QEventLoop evtLoop;
    connect(nam, &QNetworkAccessManager::finished, &evtLoop, &QEventLoop::quit);
    // Exec of Loop
    evtLoop.exec();
    // Server response handling
    qDebug() << "*** Ожидание сервера завершено, ответ: ***";
    qDebug() << "** Pairs: **";
    qDebug() << "\"HTTP Status\"" << reply->attribute(QNetworkRequest::HttpStatusCodeAttribute).toString();
    for (auto pair : reply->rawHeaderPairs()) {
        qDebug() << pair.first << pair.second;
    }
    qDebug() << "\"Content length\"" << reply->header(QNetworkRequest::ContentLengthHeader).toString();
}

void HTTPController::messageController()
{
    emit sendMessage("Herrington");
}

QString HTTPController::getToken(QString url)
{
    qDebug() << "**Successful auth**" << url;
    if (url.indexOf("access_token=") != -1) // Ищем access_token в полученном url.
    {
        access_token = url.split("access_token=")[1].split("&")[0]; // Нашли и извлекли токен из url.
        qDebug() << "Got: " << access_token; // Смотрим на токен.
        return access_token; // Передаем token.
    }
    else {
        qDebug() << "Got error/-s";
    }
    return " "; // return nothing.
}

void HTTPController::restCall()
{
    modelController->clear();
    QEventLoop loop;
    connect(nam, &QNetworkAccessManager::finished, &loop, &QEventLoop::quit);
    reply = nam->get(QNetworkRequest(QUrl("https://api.vk.com/method/friends.get?order=random&count=10"
                                          "&fields=domain,photo_50,online"
                                          "&access_token="+access_token+"&v=5.21"))); // Запрос на 10 случайных друзей из списка друзей
    loop.exec();

    QJsonDocument document = QJsonDocument::fromJson(reply->readAll());
    QJsonValue response = document.object().value("response");
    QJsonArray array = response.toObject()["items"].toArray();
    qDebug() << "Число друзей: " << array.count();

    for (int i = 0; i < array.count(); i++) {
        QJsonObject item = array.at(i).toObject();
        qDebug() << "Друг #" << i;
        QString i_domain = item.value("domain").toString();
        qDebug() << "id (domain): " << i_domain;
        QString i_name = item.value("first_name").toString();
        qDebug() << "Имя: " << i_name;
        QString i_surname = item.value("last_name").toString();
        qDebug() << "Фамилия: " << i_surname;
        QUrl i_photo = item.value("photo_50").toString();
        qDebug() << "Сслыка на фото: " << i_photo;
        bool i_status = item.value("online").toBool();
        qDebug() << "Статус: " << ((i_status == 0) ? "Не в сети" : "В сети") << i_status;

        modelController->addItem(friendObject(i_domain, i_photo, i_name, i_status, i_surname));
        qDebug() << modelController->FriendDomain;
        qDebug() << modelController->FriendPhoto;
        qDebug() << modelController->FriendName;
        qDebug() << modelController->FriendStatus;
        qDebug() << modelController->FriendSurname;
    }
}
