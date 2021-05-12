#ifndef FRIENDSMODEL_H
#define FRIENDSMODEL_H

#include <QObject>
#include <QUrl>
#include <QCryptographicHash>

class friendsModel : public QObject
{
    Q_OBJECT

public:
    friendsModel(const QString &getDomain,
                 const QUrl &getPhoto,
                 const QString &getName,
                 const QString &getSurname);
    QString getId() const; // возвращает domain (id) пользователя.
    QString getName() const; // возвращает имя.
    QString getSurname() const; // возвращает фамилию.
    QUrl getPhoto() const; // возвращает ссылку на фото.
    QString generated_hash; // будущий sig.
public slots:
    void makeHash(QString url); // Для генерации sig.
private:
    QString u_domain; // id (domain) пользователя.
    QString u_name; // имя пользователя.
    QString u_surname; // фалмилия пользователя.
    QUrl u_photo; // ссылка на аватар пользователя.
};

#endif // FRIENDSMODEL_H
