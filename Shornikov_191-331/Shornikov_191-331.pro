QT += core quick gui qml multimedia multimediawidgets network webview

CONFIG += c++11

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        cryptocontroller.cpp \
        friendsmodel.cpp \
        httpcontroller.cpp \
        main.cpp

RESOURCES += qml.qrc

win32 {
LIBS += C:\Programms\Qt\Tools\OpenSSL\Win_x64\lib\libssl.lib \
        C:\Programms\Qt\Tools\OpenSSL\Win_x64\lib\libcrypto.lib # lib with table and functions.
}
INCLUDEPATH += C:/Programms/Qt/Tools/OpenSSL/Win_x64/include


# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

RC_ICONS = "icon.ico"

android {
    QT += androidextras

    ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android

    my_files.path = /assets
    my_files.files = $$PWD/cryptoTest

    INSTALLS += my_files

#    LIBS += C:\Android\sdk\android_openssl\static\lib\arm\libcrypto.a \
#        C:\Android\sdk\android_openssl\static\lib\arm\libssl.a \
    LIBS += C:\Android\sdk\android_openssl\static\lib\arm64\libcrypto.a \
        C:\Android\sdk\android_openssl\static\lib\arm64\libssl.a

    DISTFILES += \
        android/AndroidManifest.xml \
        android/build.gradle \
        android/gradle.properties \
        android/gradle/wrapper/gradle-wrapper.jar \
        android/gradle/wrapper/gradle-wrapper.properties \
        android/gradlew \
        android/gradlew.bat \
        android/res/values/libs.xml
}

HEADERS += \
    cryptocontroller.h \
    friendsmodel.h \
    httpcontroller.h
android: include(C:/Android/sdk/android_openssl/openssl.pri)
