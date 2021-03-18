#ifndef HTTPCONTROLLER_H
#define HTTPCONTROLLER_H

#include <QObject>
#include <QNetworkAccessManager>
#include <QNetworkRequest>
#include <QNetworkReply>

class HTTPController : public QObject
{
    Q_OBJECT

public:
    ~HTTPController()
    {
        delete nam;
    }
    explicit HTTPController(QObject *parent = nullptr);

    // Вместо глоб. переменной - свойство класса.
    QNetworkAccessManager * nam = nullptr;
public slots:
    void getPageInfo();
    //void replyFinished(QNetworkReply *reply);
signals:

};

#endif // HTTPCONTROLLER_H
