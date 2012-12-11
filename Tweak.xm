#import <CoreLocation/CoreLocation.h>

@interface EKAlarm
+ (BOOL)areLocationsAvailable;
@end

@interface UINavigationController (LocationReminders)
- (UIViewController *)previousViewController;
@end

%hook EKAlarm
+ (BOOL)areLocationsAvailable {
    return YES;
}
%end

%hook EKReminderLocationPicker

- (void)viewWillAppear:(BOOL)animated {
    %orig;
    [self navigationItem].leftBarButtonItem = [[[UIBarButtonItem alloc] initWithTitle:[self navigationController].previousViewController.title
                                                                        style:UIBarButtonItemStylePlain
                                                                        target:self
                                                                        action:@selector(locationreminders_popViewController)] autorelease];
}

%new - (void)locationreminders_popViewController {
    [[self navigationController] popViewControllerAnimated:YES];
}

%end

%ctor {
    if (CLLocationManager.regionMonitoringAvailable && !EKAlarm.areLocationsAvailable) {
        %init;
    }
}
