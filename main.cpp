#include <QApplication>
#include <QQmlApplicationEngine>
#include "accelerometerhandler.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QApplication app(argc, argv);

    QQmlApplicationEngine engine;

    qmlRegisterType<AccelerometerHandler>("com.kmi.accelerometerhandler",1,0,"AccelerometerHandler");

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
