#include "friendsmodel.h"

friendsModel::friendsModel(const QString &getDomain,
                           const QUrl &getPhoto,
                           const QString &getName,
                           const QString &getSurname) : u_domain(getDomain),
                           u_name(getName),
                           u_surname(getSurname),
                           u_photo(getPhoto)
{
}

void friendsModel::makeHash(QString url)
{
    if (url.indexOf("session_secret_key=") != -1) // Ищем s-s-key в полученном url.
    {
        QString session_secret_key = url.split("session_secret_key=")[1].split("&")[0]; // Нашли и извлекли key из url.
        // Генерим хэш при помощи s-s-key.
        QByteArray array;
        array.append(session_secret_key);
        generated_hash = QString(QCryptographicHash::hash((array), QCryptographicHash::Md5).toHex());

    }
    else {
    }
}
