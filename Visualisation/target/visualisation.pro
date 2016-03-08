######################################################################
# generated by pvdevelop at: Tue Sep 1 15:03:06 2015
######################################################################

TEMPLATE = app
CONFIG  += warn_on release console
CONFIG  -= qt

# Input
#HEADERS += rldefine.h
HEADERS += pvapp.h      \
           mask1_slots.h
SOURCES += main.cpp     \
           mask1.cpp

!macx {
//unix:LIBS       += /usr/lib/libpvsmt.so -lpthread
unix:LIBS         += /opt/pvb/pvserver/libpvsmt.so -lpthread
#unix:LIBS        += /usr/lib/libpvsid.so
unix:INCLUDEPATH  += /opt/pvb/pvserver
unix:LIBS         += /opt/pvb/rllib/lib/librllib.so
unix:INCLUDEPATH  += /opt/pvb/rllib/lib
}

macx:LIBS          += /opt/pvb/pvserver/libpvsmt.a /usr/lib/libpthread.dylib
#macx:LIBS         += /opt/pvb/pvserver/libpvsid.a
macx:INCLUDEPATH   += /opt/pvb/pvserver
macx:LIBS         += /usr/lib/librllib.dylib
macx:INCLUDEPATH  += /opt/pvb/rllib/lib

#
# Attention:
# starting with mingw 4.8 we use mingw pthread and not our own mapping to windows threads
# you will have to adjust existing pro files
#
win32-g++ {
QMAKE_LFLAGS      += -static-libgcc
win32:LIBS        += $(PVBDIR)/win-mingw/bin/libserverlib.a 
win32:LIBS        += $(PVBDIR)/win-mingw/bin/librllib.a
win32:LIBS        += -lws2_32 -ladvapi32 -lpthread
win32:INCLUDEPATH += $(PVBDIR)/pvserver
win32:INCLUDEPATH += $(PVBDIR)/rllib/lib
}

#DEFINES += USE_INETD
TARGET = visualisation
