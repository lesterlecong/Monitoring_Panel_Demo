#ifndef ACCELEROMETERHANDLER_H
#define ACCELEROMETERHANDLER_H

#include <QObject>

class QTimer;

class AccelerometerHandler : public QObject
{
    Q_OBJECT

public:
    explicit AccelerometerHandler(QObject *parent = nullptr);
    ~AccelerometerHandler();
signals:
    void sendNewValue(float val);

public slots:
    void update();

private:
    QTimer *m_timer;

    float counter;



};

#endif // ACCELEROMETERHANDLER_H
