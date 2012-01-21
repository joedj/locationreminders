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
    UINavigationController *navController = [self navigationController];
    [self navigationItem].leftBarButtonItem = [[[UIBarButtonItem alloc] initWithTitle:navController.previousViewController.title
                                                                        style:UIBarButtonItemStylePlain
                                                                        target:navController.delegate
                                                                        action:@selector(popViewController)] autorelease];
}
%end

%ctor {
    if (CLLocationManager.regionMonitoringAvailable && !EKAlarm.areLocationsAvailable) {
        %init;
    }
}
