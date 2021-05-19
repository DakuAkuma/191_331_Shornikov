#include "friendsmodel.h"
#include <QAbstractItemModel>
#include <QMap>

/* Object block */

friendObject::friendObject(const QString &domain, const QUrl &photo, const QString &name, const bool &status, const QString &surname) :
    u_domain(domain), u_photo(photo), u_name(name), u_status(status), u_surname(surname)
{

}

QString friendObject::getDomain() const
{
    return u_domain;
}

QString friendObject::getName() const
{
    return u_name;
}

QString friendObject::getSurname() const
{
    return u_surname;
}

bool friendObject::getStatus() const
{
    return u_status == 0 ? "Не в сети" : "В сети";
}

QUrl friendObject::getPhoto() const
{
    return u_photo;
}

/* Model block */

friendsModel::friendsModel(QObject *parent) : QAbstractListModel(parent)
{
}

int friendsModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return f_items.count();
}

QVariant friendsModel::data(const QModelIndex &index, int role) const
{
    if (index.row() < 0 || (index.row() >= f_items.count())) {
        qDebug() << "I'm here";
        return QVariant();
    }
    const friendObject &itemToReturn = f_items[index.row()];
    if (role == FriendDomain)
        return itemToReturn.getDomain();
    else if (role == FriendName)
        return itemToReturn.getName();
    else if (role == FriendSurname)
        return itemToReturn.getSurname();
    else if (role == FriendPhoto)
        return itemToReturn.getPhoto();
    else if (role == FriendStatus)
        return itemToReturn.getStatus();

    return QVariant();
}

QVariantMap friendsModel::get(int idx) const
{
    QVariantMap map;
    foreach(int k, roleNames().keys()) {
        map[roleNames().value(k)] = data(index(idx, 0), k);
        qDebug() << roleNames().value(k) << map[roleNames().value(k)];
    }
    return map;
}

QHash<int, QByteArray> friendsModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[FriendDomain] = "u_domain";
    roles[FriendPhoto] = "u_img";
    roles[FriendName] = "u_name";
    roles[FriendStatus] = "u_status";
    roles[FriendSurname] = "u_surname";
    return roles;
}

void friendsModel::addItem(const friendObject &item) {
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    f_items << item;
    endInsertRows();
}

void friendsModel::clear() {
    beginRemoveRows(QModelIndex(), 0, rowCount()-1);
    f_items.clear();
    endRemoveRows();
}
