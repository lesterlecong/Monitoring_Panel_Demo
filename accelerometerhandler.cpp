#include "accelerometerhandler.h"

#include <QTimer>
#include <QRandomGenerator>

AccelerometerHandler::AccelerometerHandler(QObject *parent) : QObject(parent)
{
    m_timer = new QTimer(this);

    connect(m_timer, SIGNAL(timeout()), this, SLOT(update()));

    m_timer->start(500);
    counter = 0.01;
}

void AccelerometerHandler::update() {

    //quint32 value = QRandomGenerator::global()->generate();
    emit sendNewValue(counter);
    counter += 0.01;
}

AccelerometerHandler::~AccelerometerHandler()
{
    delete m_timer;
}


