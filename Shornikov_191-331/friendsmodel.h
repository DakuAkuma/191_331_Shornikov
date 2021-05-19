#ifndef FRIENDSMODEL_H
#define FRIENDSMODEL_H

#include <QObject>
#include <QDebug>
#include <QUrl>
#include <QAbstractItemModel>
#include <QAbstractListModel>
#include <QModelIndex>
#include <QList>
#include <QCryptographicHash>
#include <QVariant>
#include <QVariantMap>

class friendObject
{
public:
    friendObject(const QString &domain,
                 const QUrl &photo,
                 const QString &name,
                 const bool &status,
                 const QString &surname);
    QString getDomain() const; // возвращает domain (id) пользователя.
    QString getName() const; // возвращает имя.
    QString getSurname() const; // возвращает фамилию.
    bool getStatus() const; // возвращает статус.
    QUrl getPhoto() const; // возвращает ссылку на фото.
private:
    QString u_domain; // id (domain) пользователя.
    QUrl u_photo; // ссылка на аватар пользователя.
    QString u_name; // имя пользователя.
    bool u_status; // статус пользователя.
    QString u_surname; // фалмилия пользователя.
};

class friendsModel : public QAbstractListModel
{
    Q_OBJECT

public:
    enum roles { // Все поля, что мы получаем в виде enum, для удобства обращения.
        FriendDomain,
        FriendPhoto,
        FriendName,
        FriendStatus,
        FriendSurname
    };
    friendsModel(QObject *parent = nullptr);
    void addItem(const friendObject &item); // Добавление друга.
    int rowCount(const QModelIndex &parent = QModelIndex()) const; // Подсчёт строк.
    void clear(); // Очистка модели.
    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const;
    QVariantMap get(int idx) const;
protected:
    QHash<int, QByteArray> roleNames() const;
private:
    QList<friendObject> f_items;
};

#endif // FRIENDSMODEL_H
