#import "../Dress.h"

BOOL enabled;
BOOL enableEvanescoModeSection;

NSString* evanescoInactivityControl;
NSString* evanescoFadeDurationControl;
NSString* evanescoFadeAlphaControl;
BOOL timeDateEvanescoSwitch;
BOOL faceIDLockEvanescoSwitch;
BOOL homebarEvanescoSwitch;
BOOL pageDotsEvanescoSwitch;
BOOL notificationCellsEvanescoSwitch;
BOOL notificationHintViewEvanescoSwitch;
BOOL notificationHeaderViewEvanescoSwitch;
BOOL unlockTextEvanescoSwitch;
BOOL quickActionsEvanescoSwitch;

BOOL dpkgInvalid = NO;

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

%end

%end

// Evanesco Timer

%group DressEvanesco

%hook NCNotificationListView

// - (void)didMoveToWindow { // start the timer when NCNotificationListView appeared

// 	%orig;
// 	evanescoTimer = [NSTimer scheduledTimerWithTimeInterval:[evanescoInactivityControl doubleValue] target:self selector:@selector(sendFadeNotification) userInfo:nil repeats:NO];

// }

- (void)_scrollViewWillBeginDragging { // send fadeIn notification when starting to drag

	%orig;
	[evanescoTimer invalidate];
	[[NSNotificationCenter defaultCenter] postNotificationName:@"fadeIn" object:nil];

}

- (void)_scrollViewDidEndDecelerating { // start the timer again after stopped dragging

	%orig;
	evanescoTimer = [NSTimer scheduledTimerWithTimeInterval:[evanescoInactivityControl doubleValue] target:self selector:@selector(sendFadeNotification) userInfo:nil repeats:NO];

}

%new
- (void)sendFadeNotification { // send fadeOut notification when timer is up

	[[NSNotificationCenter defaultCenter] postNotificationName:@"fadeOut" object:nil];

}

%end

%hook SBBacklightController // workaround to fix didMoveToWindow in NCNotificationListView not working as intended, breaks notification center evanesco though

- (void)turnOnScreenFullyWithBacklightSource:(long long)source {

	%orig;
	if (source != 26) {
		[[NSNotificationCenter defaultCenter] postNotificationName:@"fadeIn" object:nil];
		evanescoTimer = [NSTimer scheduledTimerWithTimeInterval:[evanescoInactivityControl doubleValue] target:self selector:@selector(sendFadeNotification) userInfo:nil repeats:NO];
	}

}

%new
- (void)sendFadeNotification { // send fadeOut notification when timer is up

	[[NSNotificationCenter defaultCenter] postNotificationName:@"fadeOut" object:nil];

}

%end

%end

%ctor {

	NSArray* owo = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:@"/var/lib/dpkg/info/" error:nil];
    for (NSString* name in owo) {
        if ([name containsString:@"hackyouriphone"] || [name containsString:@"rejail"] || [name containsString:@"kiimo"] || [name containsString:@"pulandres"]) {
			dpkgInvalid = YES;
			break;
		}
    }

	if (!dpkgInvalid) dpkgInvalid = ([[NSFileManager defaultManager] fileExistsAtPath:@"/Library/MobileSubstrate/DynamicLibraries/CyDown.dylib"] || [[NSFileManager defaultManager] fileExistsAtPath:@"/Applications/cydown.app"]);

	if (!dpkgInvalid) {
		if ([[NSFileManager defaultManager] fileExistsAtPath:@"/Applications/Cydia.app"]) {
			NSData* cydiaReposData = [[NSFileManager defaultManager] contentsAtPath:@"/private/etc/apt/sources.list.d/cydia.list"];
    		NSString* cydiaRepos = [[NSString alloc] initWithData:cydiaReposData encoding:NSUTF8StringEncoding];
			dpkgInvalid = [cydiaRepos containsString:@"hackyouriphone"] || [cydiaRepos containsString:@"rejail"] || [cydiaRepos containsString:@"kiiimo"] || [cydiaRepos containsString:@"pulandres"];
		}
		if ([[NSFileManager defaultManager] fileExistsAtPath:@"/Applications/Zebra.app"] && !dpkgInvalid) {
			NSData* zebraReposData = [[NSFileManager defaultManager] contentsAtPath:@"/var/mobile/Library/Application Support/xyz.willy.Zebra/sources.list"];
    		NSString* zebraRepos = [[NSString alloc] initWithData:zebraReposData encoding:NSUTF8StringEncoding];
			dpkgInvalid = [zebraRepos containsString:@"hackyouriphone"] || [zebraRepos containsString:@"rejail"] || [zebraRepos containsString:@"kiiimo"] || [zebraRepos containsString:@"pulandres"];
		}
		if ([[NSFileManager defaultManager] fileExistsAtPath:@"/Applications/Sileo.app"] && !dpkgInvalid) {
			NSData* sileoReposData = [[NSFileManager defaultManager] contentsAtPath:@"/private/etc/apt/sileo.list.d/sileo.sources"];
    		NSString* sileoRepos = [[NSString alloc] initWithData:sileoReposData encoding:NSUTF8StringEncoding];
			dpkgInvalid = [sileoRepos containsString:@"hackyouriphone"] || [sileoRepos containsString:@"rejail"] || [sileoRepos containsString:@"kiiimo"] || [sileoRepos containsString:@"pulandres"];
		}
		if ([[NSFileManager defaultManager] fileExistsAtPath:@"/Applications/Installer.app"] && !dpkgInvalid) {
			NSData* installerReposData = [[NSFileManager defaultManager] contentsAtPath:@"/var/mobile/Library/Application Support/Installer/APT/sources.list"];
    		NSString* installerRepos = [[NSString alloc] initWithData:installerReposData encoding:NSUTF8StringEncoding];
			dpkgInvalid = [installerRepos containsString:@"hackyouriphone"] || [installerRepos containsString:@"rejail"] || [installerRepos containsString:@"kiiimo"] || [installerRepos containsString:@"pulandres"];
		}
	}

	if (dpkgInvalid) return;

	preferences = [[HBPreferences alloc] initWithIdentifier:@"love.litten.dresspreferences"];

	[preferences registerBool:&enabled default:YES forKey:@"Enabled"];
	[preferences registerBool:&enableEvanescoModeSection default:nil forKey:@"EnableEvanescoModeSection"];

	// Evanesco Mode
	[preferences registerObject:&evanescoInactivityControl default:@"5.0" forKey:@"evanescoInactivity"];
	[preferences registerObject:&evanescoFadeDurationControl default:@"0.5" forKey:@"evanescoFadeDuration"];
	[preferences registerObject:&evanescoFadeAlphaControl default:@"0.0" forKey:@"evanescoFadeAlpha"];
	[preferences registerBool:&timeDateEvanescoSwitch default:NO forKey:@"timeDateEvanesco"];
	[preferences registerBool:&faceIDLockEvanescoSwitch default:NO forKey:@"faceIDLockEvanesco"];
	[preferences registerBool:&homebarEvanescoSwitch default:NO forKey:@"homebarEvanesco"];
	[preferences registerBool:&pageDotsEvanescoSwitch default:NO forKey:@"pageDotsEvanesco"];
	[preferences registerBool:&notificationCellsEvanescoSwitch default:NO forKey:@"notificationCellsEvanesco"];
	[preferences registerBool:&notificationHintViewEvanescoSwitch default:NO forKey:@"notificationHintViewEvanesco"];
	[preferences registerBool:&notificationHeaderViewEvanescoSwitch default:NO forKey:@"notificationHeaderViewEvanesco"];
	[preferences registerBool:&unlockTextEvanescoSwitch default:NO forKey:@"unlockTextEvanesco"];
	[preferences registerBool:&quickActionsEvanescoSwitch default:NO forKey:@"quickActionsEvanesco"];

	BOOL ok = [[NSFileManager defaultManager] fileExistsAtPath:[NSString stringWithFormat:@"/var/lib/dpkg/info/%@%@%@%@%@%@%@%@%@%@%@.dress.list", @"l", @"o", @"v", @"e", @".", @"l", @"i", @"t", @"t", @"e", @"n"]];

	if (enabled && enableEvanescoModeSection && !dpkgInvalid && ok) {
		if (timeDateEvanescoSwitch) %init(EvanescoTimeDate);
		if (faceIDLockEvanescoSwitch) %init(EvanescoFaceIDLock);
		if (homebarEvanescoSwitch) %init(EvanescoHomebar);
		if (pageDotsEvanescoSwitch) %init(EvanescoPageDots);
		if (notificationCellsEvanescoSwitch) %init(EvanescoNotificationCells);
		if (notificationHintViewEvanescoSwitch) %init(EvanescoNotificationHintView);
		if (notificationHeaderViewEvanescoSwitch) %init(EvanescoNotificationHeaderView);
		if (unlockTextEvanescoSwitch) %init(EvanescoUnlockText);
		if (quickActionsEvanescoSwitch) %init(EvanescoQuickActions);
		%init(DressEvanesco);
	}

}