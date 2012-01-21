What is it?
-----------

LocationReminders is an iOS tweak for the Reminders app that enables location-based reminders on devices with region monitoring support, such as the iPad2+3G.

LocationReminders has no effect on devices that already support location-based reminders, such as the iPhone4 and iPhone4S, but it can be used as a dependency by developers wishing to target all capable devices.


Installing LocationReminders
----------------------------

LocationReminders is designed to work with the [Theos](https://github.com/DHowett/theos) Makefile system:

    git clone git://github.com/joedj/locationreminders.git
    cd locationreminders
    ln -s $THEOS theos
    THEOS_DEVICE_IP=1.2.3.4 make package install
