#import "../Dress.h"

BOOL enabled;
BOOL enableEvanescoModeSection;

BOOL dpkgInvalid = NO;

BOOL isLocked = YES; // used to detect if the device is locked

NSTimer* evanescoTimer;

// Date And Time

%group EvanescoTimeDate

%hook SBFLockScreenDateView

- (id)initWithFrame:(CGRect)frame { // add notification observer

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveFadeNotification:) name:@"fadeOut" object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveFadeNotification:) name:@"fadeIn" object:nil];

	return %orig;

}

%new
- (void)receiveFadeNotification:(NSNotification *)notification { // receive notification and determine if should fade out or in

	if ([notification.name isEqual:@"fadeOut"]) {
		[UIView animateWithDuration:[evanescoFadeDurationControl doubleValue] delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
			[self setAlpha:[evanescoFadeAlphaControl doubleValue]];
			
		} completion:nil];
	} else if ([notification.name isEqual:@"fadeIn"]) {
		[UIView animateWithDuration:[evanescoFadeDurationControl doubleValue] delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
			[self setAlpha:1.0];
			
		} completion:nil];
	}

}

- (void)dealloc { // remove observer
	
	[[NSNotificationCenter defaultCenter] removeObserver:self];
    
	%orig;

}

%end

%end

// FaceID Lock

%group EvanescoFaceIDLock

%hook SBUIProudLockIconView

- (id)initWithFrame:(CGRect)frame { // add notification observer

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveFadeNotification:) name:@"fadeOut" object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveFadeNotification:) name:@"fadeIn" object:nil];

	return %orig;

}

%new
- (void)receiveFadeNotification:(NSNotification *)notification { // receive notification and determine if should fade out or in

	if ([notification.name isEqual:@"fadeOut"]) {
		[UIView animateWithDuration:[evanescoFadeDurationControl doubleValue] delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
			[self setAlpha:[evanescoFadeAlphaControl doubleValue]];
			
		} completion:nil];
	} else if ([notification.name isEqual:@"fadeIn"]) {
		[UIView animateWithDuration:[evanescoFadeDurationControl doubleValue] delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
			[self setAlpha:1.0];
			
		} completion:nil];
	}

}

- (void)dealloc { // remove observer
	
	[[NSNotificationCenter defaultCenter] removeObserver:self];
    
	%orig;

}

%end

%end

// Status Bar

%group EvanescoStatusBar

%hook UIStatusBar_Modern

- (void)setFrame:(CGRect)arg1 { // add notification observer

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveFadeNotification:) name:@"fadeOut" object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveFadeNotification:) name:@"fadeIn" object:nil];

	return %orig;

}

%new
- (void)receiveFadeNotification:(NSNotification *)notification { // receive notification and determine if should fade out or in

	if ([notification.name isEqual:@"fadeOut"]) {
		[UIView animateWithDuration:[evanescoFadeDurationControl doubleValue] delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
			[[self statusBar] setAlpha:[evanescoFadeAlphaControl doubleValue]];
			
		} completion:nil];
	} else if ([notification.name isEqual:@"fadeIn"]) {
		[UIView animateWithDuration:[evanescoFadeDurationControl doubleValue] delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
			[[self statusBar] setAlpha:1.0];
			
		} completion:nil];
	}

}

- (void)dealloc { // remove observer
	
	[[NSNotificationCenter defaultCenter] removeObserver:self];
    
	%orig;

}

%end

%end

// Homebar

%group EvanescoHomebar

%hook CSHomeAffordanceView

- (id)initWithFrame:(CGRect)frame { // add notification observer

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveFadeNotification:) name:@"fadeOut" object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveFadeNotification:) name:@"fadeIn" object:nil];

	return %orig;

}

%new
- (void)receiveFadeNotification:(NSNotification *)notification { // receive notification and determine if should fade out or in

	if ([notification.name isEqual:@"fadeOut"]) {
		[UIView animateWithDuration:[evanescoFadeDurationControl doubleValue] delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
			[self setAlpha:[evanescoFadeAlphaControl doubleValue]];
			
		} completion:nil];
	} else if ([notification.name isEqual:@"fadeIn"]) {
		[UIView animateWithDuration:[evanescoFadeDurationControl doubleValue] delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
			[self setAlpha:1.0];
			
		} completion:nil];
	}

}

- (void)dealloc { // remove observer
	
	[[NSNotificationCenter defaultCenter] removeObserver:self];
    
	%orig;

}

%end

%end

// Page Dots

%group EvanescoPageDots

%hook CSPageControl

- (id)initWithFrame:(CGRect)frame { // add notification observer

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveFadeNotification:) name:@"fadeOut" object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveFadeNotification:) name:@"fadeIn" object:nil];

	return %orig;

}

%new
- (void)receiveFadeNotification:(NSNotification *)notification { // receive notification and determine if should fade out or in

	if ([notification.name isEqual:@"fadeOut"]) {
		[UIView animateWithDuration:[evanescoFadeDurationControl doubleValue] delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
			[self setAlpha:[evanescoFadeAlphaControl doubleValue]];
			
		} completion:nil];
	} else if ([notification.name isEqual:@"fadeIn"]) {
		[UIView animateWithDuration:[evanescoFadeDurationControl doubleValue] delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
			[self setAlpha:1.0];
			
		} completion:nil];
	}

}

- (void)dealloc { // remove observer
	
	[[NSNotificationCenter defaultCenter] removeObserver:self];
    
	%orig;

}

%end

%end

%group EvanescoMediaPlayer

%hook CSAdjunctItemView

- (id)initWithFrame:(CGRect)frame { // add notification observer

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveFadeNotification:) name:@"fadeOut" object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveFadeNotification:) name:@"fadeIn" object:nil];

	return %orig;

}

%new
- (void)receiveFadeNotification:(NSNotification *)notification { // receive notification and determine if should fade out or in

	if ([notification.name isEqual:@"fadeOut"]) {
		[UIView animateWithDuration:[evanescoFadeDurationControl doubleValue] delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
			[self setAlpha:[evanescoFadeAlphaControl doubleValue]];
			
		} completion:nil];
	} else if ([notification.name isEqual:@"fadeIn"]) {
		[UIView animateWithDuration:[evanescoFadeDurationControl doubleValue] delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
			[self setAlpha:1.0];
			
		} completion:nil];
	}

}

- (void)dealloc { // remove observer
	
	[[NSNotificationCenter defaultCenter] removeObserver:self];
    
	%orig;

}

%end

%end

// Notifications

%group EvanescoNotificationCells

%hook NCNotificationListCell

- (id)initWithFrame:(CGRect)frame { // add notification observer

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveFadeNotification:) name:@"fadeOut" object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveFadeNotification:) name:@"fadeIn" object:nil];

	return %orig;

}

%new
- (void)receiveFadeNotification:(NSNotification *)notification { // receive notification and determine if should fade out or in

	if ([notification.name isEqual:@"fadeOut"]) {
		[UIView animateWithDuration:[evanescoFadeDurationControl doubleValue] delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
			[self setAlpha:[evanescoFadeAlphaControl doubleValue]];
			
		} completion:nil];
	} else if ([notification.name isEqual:@"fadeIn"]) {
		[UIView animateWithDuration:[evanescoFadeDurationControl doubleValue] delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
			[self setAlpha:1.0];
			
		} completion:nil];
	}

}

- (void)dealloc { // remove observer
	
	[[NSNotificationCenter defaultCenter] removeObserver:self];
    
	%orig;

}

%end

%end

%group EvanescoNotificationHintView

%hook NCNotificationListSectionRevealHintView

- (id)initWithFrame:(CGRect)frame { // add notification observer

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveFadeNotification:) name:@"fadeOut" object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveFadeNotification:) name:@"fadeIn" object:nil];

	return %orig;

}

%new
- (void)receiveFadeNotification:(NSNotification *)notification { // receive notification and determine if should fade out or in

	if ([notification.name isEqual:@"fadeOut"]) {
		[UIView animateWithDuration:[evanescoFadeDurationControl doubleValue] delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
			[self setAlpha:[evanescoFadeAlphaControl doubleValue]];
			
		} completion:nil];
	} else if ([notification.name isEqual:@"fadeIn"]) {
		[UIView animateWithDuration:[evanescoFadeDurationControl doubleValue] delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
			[self setAlpha:1.0];
			
		} completion:nil];
	}

}

- (void)dealloc { // remove observer
	
	[[NSNotificationCenter defaultCenter] removeObserver:self];
    
	%orig;

}

%end

%end

%group EvanescoNotificationHeaderView

%hook NCNotificationListSectionHeaderView

- (id)initWithFrame:(CGRect)frame { // add notification observer

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveFadeNotification:) name:@"fadeOut" object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveFadeNotification:) name:@"fadeIn" object:nil];

	return %orig;

}

%new
- (void)receiveFadeNotification:(NSNotification *)notification { // receive notification and determine if should fade out or in

	if ([notification.name isEqual:@"fadeOut"]) {
		[UIView animateWithDuration:[evanescoFadeDurationControl doubleValue] delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
			[self setAlpha:[evanescoFadeAlphaControl doubleValue]];
			
		} completion:nil];
	} else if ([notification.name isEqual:@"fadeIn"]) {
		[UIView animateWithDuration:[evanescoFadeDurationControl doubleValue] delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
			[self setAlpha:1.0];
			
		} completion:nil];
	}

}

- (void)dealloc { // remove observer
	
	[[NSNotificationCenter defaultCenter] removeObserver:self];
    
	%orig;

}

%end

%end

// Unlock Text And CC Grabber

%group EvanescoUnlockText

%hook CSTeachableMomentsContainerView

- (id)initWithFrame:(CGRect)frame { // add notification observer

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveFadeNotification:) name:@"fadeOut" object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveFadeNotification:) name:@"fadeIn" object:nil];

	return %orig;

}

%new
- (void)receiveFadeNotification:(NSNotification *)notification { // receive notification and determine if should fade out or in

	if ([notification.name isEqual:@"fadeOut"]) {
		[UIView animateWithDuration:[evanescoFadeDurationControl doubleValue] delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
			SBUILegibilityLabel* label = MSHookIvar<SBUILegibilityLabel *>(self, "_callToActionLabel");
			[label setAlpha:[evanescoFadeAlphaControl doubleValue]];
			[[self controlCenterGrabberContainerView] setAlpha:[evanescoFadeAlphaControl doubleValue]];
			
		} completion:nil];
	} else if ([notification.name isEqual:@"fadeIn"]) {
		[UIView animateWithDuration:[evanescoFadeDurationControl doubleValue] delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
			SBUILegibilityLabel* label = MSHookIvar<SBUILegibilityLabel *>(self, "_callToActionLabel");
			[label setAlpha:1.0];
			[[self controlCenterGrabberContainerView] setAlpha:1.0];
			
		} completion:nil];
	}

}

- (void)dealloc { // remove observer
	
	[[NSNotificationCenter defaultCenter] removeObserver:self];
    
	%orig;

}

%end

%hook SBUICallToActionLabel // Home Button Devices

- (id)initWithFrame:(CGRect)frame { // add notification observer

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveFadeNotification:) name:@"fadeOut" object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveFadeNotification:) name:@"fadeIn" object:nil];

	return %orig;

}

%new
- (void)receiveFadeNotification:(NSNotification *)notification { // receive notification and determine if should fade out or in

	if ([notification.name isEqual:@"fadeOut"]) {
		[UIView animateWithDuration:[evanescoFadeDurationControl doubleValue] delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
			[self setAlpha:[evanescoFadeAlphaControl doubleValue]];
			
		} completion:nil];
	} else if ([notification.name isEqual:@"fadeIn"]) {
		[UIView animateWithDuration:[evanescoFadeDurationControl doubleValue] delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
			[self setAlpha:1.0];
			
		} completion:nil];
	}

}

- (void)dealloc { // remove observer
	
	[[NSNotificationCenter defaultCenter] removeObserver:self];
    
	%orig;

}

%end

%end

// Quick Actions

%group EvanescoQuickActions

%hook CSQuickActionsButton

- (id)initWithFrame:(CGRect)frame { // add notification observer

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveFadeNotification:) name:@"fadeOut" object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveFadeNotification:) name:@"fadeIn" object:nil];

	return %orig;

}

%new
- (void)receiveFadeNotification:(NSNotification *)notification { // receive notification and determine if should fade out or in

	if ([notification.name isEqual:@"fadeOut"]) {
		[UIView animateWithDuration:[evanescoFadeDurationControl doubleValue] delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
			[self setAlpha:[evanescoFadeAlphaControl doubleValue]];
			
		} completion:nil];
	} else if ([notification.name isEqual:@"fadeIn"]) {
		[UIView animateWithDuration:[evanescoFadeDurationControl doubleValue] delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
			[self setAlpha:1.0];
			
		} completion:nil];
	}

}

- (void)dealloc { // remove observer
	
	[[NSNotificationCenter defaultCenter] removeObserver:self];
    
	%orig;

}

%end

%end

%group EvanescoGrupi

%hook GRPView

- (id)initWithFrame:(CGRect)frame { // add notification observer

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveFadeNotification:) name:@"fadeOut" object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveFadeNotification:) name:@"fadeIn" object:nil];

	return %orig;

}

%new
- (void)receiveFadeNotification:(NSNotification *)notification { // receive notification and determine if should fade out or in

	if ([notification.name isEqual:@"fadeOut"]) {
		[UIView animateWithDuration:[evanescoFadeDurationControl doubleValue] delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
			[self setAlpha:[evanescoFadeAlphaControl doubleValue]];
			
		} completion:nil];
	} else if ([notification.name isEqual:@"fadeIn"]) {
		[UIView animateWithDuration:[evanescoFadeDurationControl doubleValue] delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
			[self setAlpha:1.0];
			
		} completion:nil];
	}

}

- (void)dealloc { // remove observer
	
	[[NSNotificationCenter defaultCenter] removeObserver:self];
    
	%orig;

}

%end

%end

%group EvanescoAxon

%hook AXNView

- (id)initWithFrame:(CGRect)frame { // add notification observer

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveFadeNotification:) name:@"fadeOut" object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveFadeNotification:) name:@"fadeIn" object:nil];

	return %orig;

}

%new
- (void)receiveFadeNotification:(NSNotification *)notification { // receive notification and determine if should fade out or in

	if ([notification.name isEqual:@"fadeOut"]) {
		[UIView animateWithDuration:[evanescoFadeDurationControl doubleValue] delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
			[self setAlpha:[evanescoFadeAlphaControl doubleValue]];
			
		} completion:nil];
	} else if ([notification.name isEqual:@"fadeIn"]) {
		[UIView animateWithDuration:[evanescoFadeDurationControl doubleValue] delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
			[self setAlpha:1.0];
			
		} completion:nil];
	}

}

- (void)dealloc { // remove observer
	
	[[NSNotificationCenter defaultCenter] removeObserver:self];
    
	%orig;

}

%end

%end

// %group EvanescoComplications

// %hook ComplicationsView

// - (id)initWithFrame:(CGRect)frame { // add notification observer

//     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveFadeNotification:) name:@"fadeOut" object:nil];
// 	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveFadeNotification:) name:@"fadeIn" object:nil];

// 	return %orig;

// }

// %new
// - (void)receiveFadeNotification:(NSNotification *)notification { // receive notification and determine if should fade out or in

// 	if ([notification.name isEqual:@"fadeOut"]) {
// 		[UIView animateWithDuration:[evanescoFadeDurationControl doubleValue] delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
// 			[self setAlpha:[evanescoFadeAlphaControl doubleValue]];
			
// 		} completion:nil];
// 	} else if ([notification.name isEqual:@"fadeIn"]) {
// 		[UIView animateWithDuration:[evanescoFadeDurationControl doubleValue] delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
// 			[self setAlpha:1.0];
			
// 		} completion:nil];
// 	}

// }

// - (void)dealloc { // remove observer
	
// 	[[NSNotificationCenter defaultCenter] removeObserver:self];
    
// 	%orig;

// }

// %end

// %hook ComplicationsBackgroundView

// - (id)initWithFrame:(CGRect)frame { // add notification observer

//     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveFadeNotification:) name:@"fadeOut" object:nil];
// 	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveFadeNotification:) name:@"fadeIn" object:nil];

// 	return %orig;

// }

// %new
// - (void)receiveFadeNotification:(NSNotification *)notification { // receive notification and determine if should fade out or in

// 	if ([notification.name isEqual:@"fadeOut"]) {
// 		[UIView animateWithDuration:[evanescoFadeDurationControl doubleValue] delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
// 			[self setAlpha:[evanescoFadeAlphaControl doubleValue]];
			
// 		} completion:nil];
// 	} else if ([notification.name isEqual:@"fadeIn"]) {
// 		[UIView animateWithDuration:[evanescoFadeDurationControl doubleValue] delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
// 			[self setAlpha:1.0];
			
// 		} completion:nil];
// 	}

// }

// - (void)dealloc { // remove observer
	
// 	[[NSNotificationCenter defaultCenter] removeObserver:self];
    
// 	%orig;

// }

// %end

// %end

// Evanesco Timer

%group DressEvanesco

%hook SBBacklightController // start the timer when turning on screen

- (void)turnOnScreenFullyWithBacklightSource:(long long)source {

	%orig;

	if (source != 26) {
		[[NSNotificationCenter defaultCenter] postNotificationName:@"fadeIn" object:nil];
		evanescoTimer = [NSTimer scheduledTimerWithTimeInterval:[evanescoInactivityControl doubleValue] target:self selector:@selector(sendFadeNotification) userInfo:nil repeats:NO];
		isLocked = YES;
	}

}

%new
- (void)sendFadeNotification { // send fadeOut notification when timer is up

	[[NSNotificationCenter defaultCenter] postNotificationName:@"fadeOut" object:nil];

}

%end

%hook NCNotificationListView

- (void)_scrollViewWillBeginDragging { // send fadeIn notification when starting to drag

	%orig;

	[evanescoTimer invalidate];
	[[NSNotificationCenter defaultCenter] postNotificationName:@"fadeIn" object:nil];

}

- (void)_scrollViewDidEndDecelerating { // start the timer again after stopped dragging

	%orig;

	if (!isLocked) return;
	evanescoTimer = [NSTimer scheduledTimerWithTimeInterval:[evanescoInactivityControl doubleValue] target:self selector:@selector(sendFadeNotification) userInfo:nil repeats:NO];

}

%new
- (void)sendFadeNotification { // send fadeOut notification when timer is up

	[[NSNotificationCenter defaultCenter] postNotificationName:@"fadeOut" object:nil];

}

%end

%hook SBCoverSheetPrimarySlidingViewController // just set isLocked to NO

- (void)viewDidDisappear:(BOOL)animated {

	%orig;

	isLocked = NO;
	[evanescoTimer invalidate];

}

%end

%end

%ctor {

	dpkgInvalid = ![[NSFileManager defaultManager] fileExistsAtPath:@"/var/lib/dpkg/info/love.litten.dress.list"];

    if (!dpkgInvalid) dpkgInvalid = ![[NSFileManager defaultManager] fileExistsAtPath:@"/var/lib/dpkg/info/love.litten.dress.md5sums"];

    if (dpkgInvalid) return;

	preferences = [[HBPreferences alloc] initWithIdentifier:@"love.litten.dresspreferences"];

	[preferences registerBool:&enabled default:nil forKey:@"Enabled"];
	[preferences registerBool:&enableEvanescoModeSection default:nil forKey:@"EnableEvanescoModeSection"];

	// Evanesco Mode
	if (enableEvanescoModeSection) {
		[preferences registerObject:&evanescoInactivityControl default:@"5.0" forKey:@"evanescoInactivity"];
		[preferences registerObject:&evanescoFadeDurationControl default:@"0.5" forKey:@"evanescoFadeDuration"];
		[preferences registerObject:&evanescoFadeAlphaControl default:@"0.0" forKey:@"evanescoFadeAlpha"];
		[preferences registerBool:&timeDateEvanescoSwitch default:NO forKey:@"timeDateEvanesco"];
		[preferences registerBool:&faceIDLockEvanescoSwitch default:NO forKey:@"faceIDLockEvanesco"];
		[preferences registerBool:&statusBarEvanescoSwitch default:NO forKey:@"statusBarEvanesco"];
		[preferences registerBool:&homebarEvanescoSwitch default:NO forKey:@"homebarEvanesco"];
		[preferences registerBool:&pageDotsEvanescoSwitch default:NO forKey:@"pageDotsEvanesco"];
		[preferences registerBool:&mediaPlayerEvanescoSwitch default:NO forKey:@"mediaPlayerEvanesco"];
		[preferences registerBool:&notificationCellsEvanescoSwitch default:NO forKey:@"notificationCellsEvanesco"];
		[preferences registerBool:&notificationHintViewEvanescoSwitch default:NO forKey:@"notificationHintViewEvanesco"];
		[preferences registerBool:&notificationHeaderViewEvanescoSwitch default:NO forKey:@"notificationHeaderViewEvanesco"];
		[preferences registerBool:&unlockTextEvanescoSwitch default:NO forKey:@"unlockTextEvanesco"];
		[preferences registerBool:&quickActionsEvanescoSwitch default:NO forKey:@"quickActionsEvanesco"];
		// [preferences registerBool:&complicationsEvanescoSwitch default:NO forKey:@"complicationsEvanesco"];
		[preferences registerBool:&grupiEvanescoSwitch default:NO forKey:@"grupiEvanesco"];
		[preferences registerBool:&axonEvanescoSwitch default:NO forKey:@"axonEvanesco"];
	}

	if (!dpkgInvalid && enabled) {
        BOOL ok = false;
        
        ok = ([[NSFileManager defaultManager] fileExistsAtPath:[NSString stringWithFormat:@"/var/lib/dpkg/info/%@%@%@%@%@%@%@%@%@%@%@.dress.md5sums", @"l", @"o", @"v", @"e", @".", @"l", @"i", @"t", @"t", @"e", @"n"]]
        );

        if (enableEvanescoModeSection && ok && [@"litten" isEqualToString:@"litten"]) {
			if (timeDateEvanescoSwitch) %init(EvanescoTimeDate);
			if (faceIDLockEvanescoSwitch) %init(EvanescoFaceIDLock);
			if (statusBarEvanescoSwitch) %init(EvanescoStatusBar);
			if (homebarEvanescoSwitch) %init(EvanescoHomebar);
			if (pageDotsEvanescoSwitch) %init(EvanescoPageDots);
			if (mediaPlayerEvanescoSwitch) %init(EvanescoMediaPlayer);
			if (notificationCellsEvanescoSwitch) %init(EvanescoNotificationCells);
			if (notificationHintViewEvanescoSwitch) %init(EvanescoNotificationHintView);
			if (notificationHeaderViewEvanescoSwitch) %init(EvanescoNotificationHeaderView);
			if (unlockTextEvanescoSwitch) %init(EvanescoUnlockText);
			if (quickActionsEvanescoSwitch) %init(EvanescoQuickActions);
			// if (complicationsEvanescoSwitch && [[NSFileManager defaultManager] fileExistsAtPath:@"/Library/MobileSubstrate/DynamicLibraries/Complications.dylib"]) {
			// 	dlopen("/Library/MobileSubstrate/DynamicLibraries/Complications.dylib", RTLD_NOW);
			// 	%init(EvanescoComplications);
			// }
			if (grupiEvanescoSwitch && [[NSFileManager defaultManager] fileExistsAtPath:@"/Library/MobileSubstrate/DynamicLibraries/Grupi.dylib"]) {
				dlopen("/Library/MobileSubstrate/DynamicLibraries/Grupi.dylib", RTLD_NOW);
				%init(EvanescoGrupi);
			}
			if (axonEvanescoSwitch && [[NSFileManager defaultManager] fileExistsAtPath:@"/Library/MobileSubstrate/DynamicLibraries/Axon.dylib"]) {
				dlopen("/Library/MobileSubstrate/DynamicLibraries/Axon.dylib", RTLD_NOW);
				%init(EvanescoAxon);
			}
			%init(DressEvanesco);
            return;
        } else {
            dpkgInvalid = YES;
        }
    }

}