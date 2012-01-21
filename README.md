Introduction
------------

LocationReminders is an iOS tweak that enables location reminders on supported hardware, such as the iPad2.


Compiling
---------

LocationReminders is designed to work with the [Theos](https://github.com/DHowett/theos) Makefile system:

    git clone git://github.com/joedj/locationreminders.git
    cd locationreminders
    ln -s $THEOS theos
    THEOS_DEVICE_IP=1.2.3.4 make package install
