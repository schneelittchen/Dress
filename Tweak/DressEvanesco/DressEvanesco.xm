#import "DressEvanesco.h"

BOOL enabled;
BOOL enableEvanescoModeSection;

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

%end

%end

%group EvanescoComplications

%hook ComplicationsView

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

%group EvanescoLockWidgets

%hook LockWidgetsView

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

%group EvanescoKai

%hook KAIBatteryPlatter

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

%group EvanescoAperio

%hook APEPlatter

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

%group EvanescoVeza

%hook VezaContainerView

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

%group EvanescoVentana

%hook CSMetroLockScreenView

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

%group EvanescoXenHTML

%hook XENHWidgetLayerContainerView

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

%hook SBBacklightController // start the timer when turning on screen

- (void)turnOnScreenFullyWithBacklightSource:(long long)source {

	%orig;

	if (![[%c(SBLockScreenManager) sharedInstance] isLockScreenVisible]) return;
	if (!evanescoTimer) evanescoTimer = [NSTimer scheduledTimerWithTimeInterval:[evanescoInactivityControl doubleValue] target:self selector:@selector(sendFadeNotification) userInfo:nil repeats:NO];
	isLocked = YES;

}

%new
- (void)sendFadeNotification { // send fadeOut notification when timer is up

	[[NSNotificationCenter defaultCenter] postNotificationName:@"fadeOut" object:nil];

}

%end

%hook SBLockScreenManager

- (void)lockUIFromSource:(int)arg1 withOptions:(id)arg2 { // stop the time when locked

	%orig;
	
	[evanescoTimer invalidate];
	evanescoTimer = nil;
	[[NSNotificationCenter defaultCenter] postNotificationName:@"fadeIn" object:nil];

}

%end

%hook NCNotificationListView

- (void)_scrollViewWillBeginDragging { // send fadeIn notification when starting to drag

	%orig;

	[evanescoTimer invalidate];
	evanescoTimer = nil;
	[[NSNotificationCenter defaultCenter] postNotificationName:@"fadeIn" object:nil];

}

- (void)_scrollViewDidEndDecelerating { // start the timer again after stopped dragging

	%orig;

	if (!isLocked) return;
	if (!evanescoTimer) evanescoTimer = [NSTimer scheduledTimerWithTimeInterval:[evanescoInactivityControl doubleValue] target:self selector:@selector(sendFadeNotification) userInfo:nil repeats:NO];

}

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 { // send fadeIn notification when tapping the screen

	%orig;

	[evanescoTimer invalidate];
	evanescoTimer = nil;
	[[NSNotificationCenter defaultCenter] postNotificationName:@"fadeIn" object:nil];

}

%new
- (void)sendFadeNotification { // send fadeOut notification when timer is up

	[[NSNotificationCenter defaultCenter] postNotificationName:@"fadeOut" object:nil];

}

%end

%hook CSCoverSheetViewController

- (void)viewWillDisappear:(BOOL)animated { // fade in when unlocking

	%orig;

	isLocked = NO;
	[evanescoTimer invalidate];
	evanescoTimer = nil;
	[[NSNotificationCenter defaultCenter] postNotificationName:@"fadeIn" object:nil];

}

%end

%end

%ctor {

	preferences = [[HBPreferences alloc] initWithIdentifier:@"love.litten.dresspreferences"];

	[preferences registerBool:&enabled default:NO forKey:@"Enabled"];
	[preferences registerBool:&enableEvanescoModeSection default:NO forKey:@"EnableEvanescoModeSection"];
	if (!enabled || !enableEvanescoModeSection) return;

	// Evanesco Mode
	[preferences registerObject:&evanescoInactivityControl default:@"5.0" forKey:@"evanescoInactivity"];
	[preferences registerObject:&evanescoFadeDurationControl default:@"0.5" forKey:@"evanescoFadeDuration"];
	[preferences registerObject:&evanescoFadeAlphaControl default:@"0.0" forKey:@"evanescoFadeAlpha"];
	[preferences registerBool:&timeDateEvanescoSwitch default:NO forKey:@"timeDateEvanesco"];
	[preferences registerBool:&faceIDLockEvanescoSwitch default:NO forKey:@"faceIDLockEvanesco"];
	[preferences registerBool:&statusBarEvanescoSwitch default:NO forKey:@"statusBarEvanesco"];
	[preferences registerBool:&homebarEvanescoSwitch default:NO forKey:@"homebarEvanesco"];
	[preferences registerBool:&pageDotsEvanescoSwitch default:NO forKey:@"pageDotsEvanesco"];
	[preferences registerBool:&mediaPlayerEvanescoSwitch default:NO forKey:@"mediaPlayerEvanesco"];
	[preferences registerBool:&unlockTextEvanescoSwitch default:NO forKey:@"unlockTextEvanesco"];
	[preferences registerBool:&quickActionsEvanescoSwitch default:NO forKey:@"quickActionsEvanesco"];
	[preferences registerBool:&complicationsEvanescoSwitch default:NO forKey:@"complicationsEvanesco"];
	[preferences registerBool:&grupiEvanescoSwitch default:NO forKey:@"grupiEvanesco"];
	[preferences registerBool:&axonEvanescoSwitch default:NO forKey:@"axonEvanesco"];
	[preferences registerBool:&lockWidgetsEvanescoSwitch default:NO forKey:@"lockWidgetsEvanesco"];
	[preferences registerBool:&kaiEvanescoSwitch default:NO forKey:@"kaiEvanesco"];
	[preferences registerBool:&aperioEvanescoSwitch default:NO forKey:@"aperioEvanesco"];
	[preferences registerBool:&vezaEvanescoSwitch default:NO forKey:@"vezaEvanesco"];
	[preferences registerBool:&ventanaEvanescoSwitch default:NO forKey:@"ventanaEvanesco"];
	[preferences registerBool:&xenHTMLEvanescoSwitch default:NO forKey:@"xenHTMLEvanesco"];

	if (timeDateEvanescoSwitch) %init(EvanescoTimeDate);
	if (faceIDLockEvanescoSwitch) %init(EvanescoFaceIDLock);
	if (statusBarEvanescoSwitch) %init(EvanescoStatusBar);
	if (homebarEvanescoSwitch) %init(EvanescoHomebar);
	if (pageDotsEvanescoSwitch) %init(EvanescoPageDots);
	if (mediaPlayerEvanescoSwitch) %init(EvanescoMediaPlayer);
	if (unlockTextEvanescoSwitch) %init(EvanescoUnlockText);
	if (quickActionsEvanescoSwitch) %init(EvanescoQuickActions);
	if (complicationsEvanescoSwitch && [[NSFileManager defaultManager] fileExistsAtPath:@"/Library/MobileSubstrate/DynamicLibraries/Complications.dylib"]) {
		dlopen("/Library/MobileSubstrate/DynamicLibraries/Complications.dylib", RTLD_NOW);
		%init(EvanescoComplications);
	}
	if (grupiEvanescoSwitch && [[NSFileManager defaultManager] fileExistsAtPath:@"/Library/MobileSubstrate/DynamicLibraries/Grupi.dylib"]) {
		dlopen("/Library/MobileSubstrate/DynamicLibraries/Grupi.dylib", RTLD_NOW);
		%init(EvanescoGrupi);
	}
	if (axonEvanescoSwitch && [[NSFileManager defaultManager] fileExistsAtPath:@"/Library/MobileSubstrate/DynamicLibraries/Axon.dylib"]) {
		dlopen("/Library/MobileSubstrate/DynamicLibraries/Axon.dylib", RTLD_NOW);
		%init(EvanescoAxon);
	}
	if (lockWidgetsEvanescoSwitch && [[NSFileManager defaultManager] fileExistsAtPath:@"/Library/MobileSubstrate/DynamicLibraries/LockWidgets.dylib"]) {
		dlopen("/Library/MobileSubstrate/DynamicLibraries/LockWidgets.dylib", RTLD_NOW);
		%init(EvanescoLockWidgets);
	}
	if (kaiEvanescoSwitch && [[NSFileManager defaultManager] fileExistsAtPath:@"/Library/MobileSubstrate/DynamicLibraries/kai.dylib"]) {
		dlopen("/Library/MobileSubstrate/DynamicLibraries/kai.dylib", RTLD_NOW);
		%init(EvanescoKai);
	}
	if (aperioEvanescoSwitch && [[NSFileManager defaultManager] fileExistsAtPath:@"/Library/MobileSubstrate/DynamicLibraries/Aperio.dylib"]) {
		dlopen("/Library/MobileSubstrate/DynamicLibraries/Aperio.dylib", RTLD_NOW);
		%init(EvanescoAperio);
	}
	if (vezaEvanescoSwitch && [[NSFileManager defaultManager] fileExistsAtPath:@"/Library/MobileSubstrate/DynamicLibraries/Veza.dylib"]) {
		dlopen("/Library/MobileSubstrate/DynamicLibraries/Veza.dylib", RTLD_NOW);
		%init(EvanescoVeza);
	}
	if (ventanaEvanescoSwitch && [[NSFileManager defaultManager] fileExistsAtPath:@"/Library/MobileSubstrate/DynamicLibraries/Ventana.dylib"]) {
		dlopen("/Library/MobileSubstrate/DynamicLibraries/Ventana.dylib", RTLD_NOW);
		%init(EvanescoVentana);
	}
	if (xenHTMLEvanescoSwitch && [[NSFileManager defaultManager] fileExistsAtPath:@"/Library/MobileSubstrate/DynamicLibraries/XenHTML_Loader.dylib"]) {
		dlopen("/Library/MobileSubstrate/DynamicLibraries/XenHTML_Loader.dylib", RTLD_NOW);
		%init(EvanescoXenHTML);
	}
	%init(DressEvanesco);

}