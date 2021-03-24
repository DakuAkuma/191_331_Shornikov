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
        // Kill them (dynamic variables) all!!!
        delete nam;
        delete proto;
        delete reply;
    }
    explicit HTTPController(QObject *parent = nullptr);

    // Вместо глоб. переменной - свойство класса.
    QNetworkAccessManager * nam = nullptr;
public slots:
    void sendPageInfo();
    void getPageInfo();
signals:
protected:
    QObject* proto;
    QNetworkReply* reply;
};

#endif // HTTPCONTROLLER_H
