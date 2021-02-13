#import "Dress.h"

BOOL enabled;
BOOL enableTimeDateSection;
BOOL enableFaceIDLockSection;
BOOL enableStatusBarSection;
BOOL enableHomebarSection;
BOOL enablePageDotsSection;
BOOL enableCCGrabberSection;
BOOL enableUnlockTextSection;
BOOL enableMediaPlayerSection;
BOOL enableNotificationsSection;
BOOL enableQuickActionsSection;
BOOL enableEvanescoModeSection;
BOOL enableOthersSection;

BOOL isLocked = YES;
BOOL revealed = NO;

// Time And Date

%group Dress

%hook SBUILegibilityLabel // needed to change SBUILegibilityLabel colors

- (BOOL)_needsColorImage {

	return YES;

}

%end

%end

%group DressTimeDate

%hook SBFLockScreenDateView

- (void)setFrame:(CGRect)frame { // change time & date position

	%orig;

	if (!customTimeAndDatePositioningSwitch) return;
	CGRect newFrame = frame;
	newFrame.origin.x += [customTimeAndDateXAxisValue doubleValue];
	newFrame.origin.y += [customTimeAndDateYAxisValue doubleValue];
	%orig(newFrame);

}

- (void)didMoveToWindow { // color time & date

	%orig;

	if (colorTimeAndDateSwitch) {
		UIColor* customTimeColor = [SparkColourPickerUtils colourWithString:[preferencesDictionary objectForKey:@"timeColor"] withFallback: @"#ffffff"];
		UIColor* customDateColor = [SparkColourPickerUtils colourWithString:[preferencesDictionary objectForKey:@"dateColor"] withFallback: @"#ffffff"];
		UIView* subtitleView = MSHookIvar<UIView *>(self, "_dateSubtitleView");
		SBUILegibilityLabel* label = MSHookIvar<SBUILegibilityLabel *>(subtitleView, "_label");
		[self setTextColor:customTimeColor];
		[label setTextColor:customDateColor];
	}

}

- (void)setHidden:(BOOL)hidden { // hide time & date

	%orig(hideTimeAndDateSwitch);

}

- (void)setAlpha:(double)alpha { // set alpha of time & date

	%orig([timeAndDateAlphaValue doubleValue]);

}

- (void)setAlignmentPercent:(double)arg1 { // alignment of time & date

	if ([timeAndDateAlignmentControl intValue] == 0)
		%orig(-1.0); // left
	else if ([timeAndDateAlignmentControl intValue] == 1)
		%orig(0.0); // center
	else if ([timeAndDateAlignmentControl intValue] == 2)
		%orig(1.0); // right

}

- (void)setUseCompactDateFormat:(BOOL)arg1 { // use comapct date format

	%orig(useCompactDateFormatSwitch);

}

+ (id)timeFont { // change time font

	if (!customTimeFontSwitch) return %orig;
	if (!useCustomChosenTimeFontSwitch) {
		if (!useRoundedFontTimeSwitch && !useItalicFontTimeSwitch)
			return [UIFont systemFontOfSize:[fontSizeTimeControl doubleValue] weight:[fontWeightTimeControl doubleValue]];
		else if (useRoundedFontTimeSwitch && !useItalicFontTimeSwitch)
			return [UIFont fontWithDescriptor:[[[UIFont systemFontOfSize:[fontSizeTimeControl doubleValue] weight:[fontWeightTimeControl doubleValue]] fontDescriptor] fontDescriptorWithDesign:UIFontDescriptorSystemDesignRounded] size:[fontSizeTimeControl doubleValue]];
		else if (!useRoundedFontTimeSwitch && useItalicFontTimeSwitch)
			return [UIFont italicSystemFontOfSize:[fontSizeTimeControl doubleValue]];
		else
			return %orig;
	} else if (useCustomChosenTimeFontSwitch) {
		return [UIFont fontWithName:[NSString stringWithFormat:@"%@", [preferences objectForKey:@"customChosenTimeFont"]] size:[fontSizeTimeControl doubleValue]];
	} else {
		return %orig;
	}

}

%end

%hook SBFLockScreenDateSubtitleView

+ (id)labelFont { // change date font

	if (!customDateFontSwitch) return %orig;
	if (!useCustomChosenDateFontSwitch) {
		if (!useRoundedFontDateSwitch && !useItalicFontDateSwitch)
			return [UIFont systemFontOfSize:[fontSizeDateControl doubleValue] weight:[fontWeightDateControl doubleValue]];
		else if (useRoundedFontDateSwitch && !useItalicFontDateSwitch)
			return [UIFont fontWithDescriptor:[[[UIFont systemFontOfSize:[fontSizeDateControl doubleValue] weight:[fontWeightDateControl doubleValue]] fontDescriptor] fontDescriptorWithDesign:UIFontDescriptorSystemDesignRounded] size:[fontSizeDateControl doubleValue]];
		else if (!useRoundedFontDateSwitch && useItalicFontDateSwitch)
			return [UIFont italicSystemFontOfSize:[fontSizeDateControl doubleValue]];
		else
			return %orig;
	} else if (useCustomChosenDateFontSwitch) {
		return [UIFont fontWithName:[NSString stringWithFormat:@"%@", [preferences objectForKey:@"customChosenDateFont"]] size:[fontSizeDateControl doubleValue]];
	} else {
		return %orig;
	}

}

%end

%hook SBFLockScreenDateSubtitleDateView

- (void)didMoveToWindow { // hide date & lunar

	%orig;

	[self setHidden:hideOnlyDateSwitch];

	SBFLockScreenAlternateDateLabel* label = MSHookIvar<SBFLockScreenAlternateDateLabel *>(self, "_alternateDateLabel");
	[label setHidden:hideLunarCalendarSwitch];

}

+ (id)dateTimeLunarDateFont { // change lunar font

	if (!customDateFontSwitch) return %orig;
	if (!useCustomChosenDateFontSwitch) {
		if (!useRoundedFontDateSwitch && !useItalicFontDateSwitch)
			return [UIFont systemFontOfSize:[fontSizeDateControl doubleValue] weight:[fontWeightDateControl doubleValue]];
		else if (useRoundedFontDateSwitch && !useItalicFontDateSwitch)
			return [UIFont fontWithDescriptor:[[[UIFont systemFontOfSize:[fontSizeDateControl doubleValue] weight:[fontWeightDateControl doubleValue]] fontDescriptor] fontDescriptorWithDesign:UIFontDescriptorSystemDesignRounded] size:[fontSizeDateControl doubleValue]];
		else if (!useRoundedFontDateSwitch && useItalicFontDateSwitch)
			return [UIFont italicSystemFontOfSize:[fontSizeDateControl doubleValue]];
		else
			return %orig;
	} else if (useCustomChosenDateFontSwitch) {
		return [UIFont fontWithName:[NSString stringWithFormat:@"%@", [preferences objectForKey:@"customChosenDateFont"]] size:[fontSizeDateControl doubleValue]];
	} else {
		return %orig;
	}

}

%end

%end

// FaceID Lock

%group DressFaceIDLock

%hook SBUIProudLockIconView

- (void)didMoveToWindow { // hide faceid lock

	%orig;

	[self setHidden:hideFaceIDLockSwitch];

}

- (void)setContentColor:(UIColor *)arg1 { // change faceid lock color

	if (colorFaceIDLockSwitch)
		%orig([SparkColourPickerUtils colourWithString:[preferencesDictionary objectForKey:@"faceIDLockColor"] withFallback: @"#ffffff"]);
	else
		%orig;

}

- (void)setFrame:(CGRect)frame { // change faceid lock position

	if (customFaceIDAxisSwitch)
		%orig(CGRectMake([faceIDXAxisControl doubleValue], [faceIDYAxisControl doubleValue], 23 + [customFaceIDSizeControl doubleValue], 33 + [customFaceIDSizeControl doubleValue]));
	else
		%orig;

}

- (void)setAlpha:(double)alpha { // change faceid lock alpha

	%orig([faceIDLockAlphaValue doubleValue]);

}

%end

%hook UIMorphingLabel

- (void)didMoveToWindow { // hide faceid lock label

	%orig;

	UIViewController* ancestor = [self _viewControllerForAncestor];
	if (hideFaceIDLockLabelSwitch && [ancestor isKindOfClass:%c(SBUIProudLockContainerViewController)])
		[self setHidden:YES];

}

%end

%end

// Status Bar

%group DressStatusBar

%hook UIStatusBar_Modern

- (void)setFrame:(CGRect)arg1 { // add notification observer

	if (hideStatusBarSwitch) {
		[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveStatusBarCustomizationNotification:) name:@"hideStatusBar" object:nil];
		[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveStatusBarCustomizationNotification:) name:@"showStatusBar" object:nil];
	}

	if ([statusBarAlphaControl doubleValue] != 1.0) {
		[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveStatusBarCustomizationNotification:) name:@"changeAlphaStatusBar" object:nil];
		[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveStatusBarCustomizationNotification:) name:@"revertAlphaStatusBar" object:nil];
	}

	return %orig;

}

%new
- (void)receiveStatusBarCustomizationNotification:(NSNotification *)notification { // hide/unhide status bar

	if ([notification.name isEqual:@"hideStatusBar"])
    	[[self statusBar] setHidden:YES];
	else if ([notification.name isEqual:@"showStatusBar"])
		[[self statusBar] setHidden:NO];
	else if ([notification.name isEqual:@"changeAlphaStatusBar"])
		[[self statusBar] setAlpha:[statusBarAlphaControl doubleValue]];
	else if ([notification.name isEqual:@"revertAlphaStatusBar"])
		[[self statusBar] setAlpha:1.0];

}

%end

%hook CSCoverSheetViewController // send notifications to hide or show the status bar

- (void)viewWillDisappear:(BOOL)animated { // show status bar when lockscreen disappears

	%orig;

	if (hideStatusBarSwitch)
		[[NSNotificationCenter defaultCenter] postNotificationName:@"showStatusBar" object:nil];

	if ([statusBarAlphaControl doubleValue] != 1.0)
		[[NSNotificationCenter defaultCenter] postNotificationName:@"revertAlphaStatusBar" object:nil];

}

- (void)viewWillAppear:(BOOL)animated { // hide status bar when lockscreen appears

	%orig;

	if (hideStatusBarSwitch)
		[[NSNotificationCenter defaultCenter] postNotificationName:@"hideStatusBar" object:nil];

	if ([statusBarAlphaControl doubleValue] != 1.0)
		[[NSNotificationCenter defaultCenter] postNotificationName:@"changeAlphaStatusBar" object:nil];

}

%end

%end

// Homebar

%group DressHomebar

%hook CSHomeAffordanceView

- (void)didMoveToWindow { // hide homebar

	%orig;

	[self setHidden:hideHomebarSwitch];

}

- (void)setAlpha:(double)alpha { // change homebar alpha

	%orig([homebarAlphaControl doubleValue]);

}

%end

%hook MTStaticColorPillView

- (void)setPillColor:(UIColor *)arg1 { // change homebar color

	if (colorHomebarSwitch) {
		UIColor* customColor = [SparkColourPickerUtils colourWithString:[preferencesDictionary objectForKey:@"homebarColor"] withFallback: @"#ffffff"];
		%orig(customColor);
	} else {
		%orig;
	}

}

%end

%end

// Page Dots

%group DressPageDots

%hook CSPageControl

- (void)didMoveToWindow { // hide page dots

	%orig;

	[self setHidden:hidePageDotsSwitch];

}

- (void)setAlpha:(double)alpha { // change page dots alpha

	%orig([pageDotsAlphaControl doubleValue]);

}

%end

%end

// Unlock Text

%group DressUnlockText

%hook CSTeachableMomentsContainerView

- (void)_layoutCallToActionLabel { // hide and set unlock text on homebar devices
	
	%orig;

	if (hideUnlockTextSwitch) {
		SBUILegibilityLabel* label = MSHookIvar<SBUILegibilityLabel *>(self, "_callToActionLabel");
		[label setHidden:YES];
		return;
	}

	if (colorUnlockTextSwitch) {
		UIColor* customColor = [SparkColourPickerUtils colourWithString:[preferencesDictionary objectForKey:@"unlockTextColor"] withFallback: @"#ffffff"];
		SBUILegibilityLabel* label = MSHookIvar<SBUILegibilityLabel *>(self, "_callToActionLabel");
		[label setTextColor:customColor];
	}

	if (![unlockTextInput isEqual:@""]) {
		SBUILegibilityLabel* label = MSHookIvar<SBUILegibilityLabel *>(self, "_callToActionLabel");
		[label setString:unlockTextInput];
		return;
	}

	if (lastTimeUnlockedSwitch && !prefersLastTimeLockedSwitch) {
		SBUILegibilityLabel* label = MSHookIvar<SBUILegibilityLabel *>(self, "_callToActionLabel");
		[label setString:[NSString stringWithFormat:@"Last Time Unlocked: %@", [preferences objectForKey:@"lastTimeUnlockedValue"]]];
	} else if (lastTimeUnlockedSwitch && prefersLastTimeLockedSwitch) {
		SBUILegibilityLabel* label = MSHookIvar<SBUILegibilityLabel *>(self, "_callToActionLabel");
		[label setString:[NSString stringWithFormat:@"Last Time Locked: %@", [preferences objectForKey:@"lastTimeUnlockedValue"]]];
	}
		


}

- (void)didMoveToWindow { // hide and set alpha of the control center indicator

	%orig;

	if (hideCCGrabberSwitch)
		[[self controlCenterGrabberContainerView] setHidden:YES];
	else
		[[self controlCenterGrabberContainerView] setHidden:NO];

	[[self controlCenterGrabberContainerView] setAlpha:[ccGrabberAlphaControl doubleValue]];

}

%end

%hook SBUICallToActionLabel

- (void)didMoveToWindow { // hide and set unlock text on home button devices (when unrecognized)

	%orig;

	if (hideUnlockTextSwitch) {
		[self setHidden:YES];
		return;
	}

	if (colorUnlockTextSwitch) {
		UIColor* customColor = [SparkColourPickerUtils colourWithString:[preferencesDictionary objectForKey:@"unlockTextColor"] withFallback: @"#ffffff"];
		SBUILegibilityLabel* label = MSHookIvar<SBUILegibilityLabel *>(self, "_label");
		[label setTextColor:customColor];
	}

	if (![unlockTextInput isEqual:@""]) {
		[self setText:unlockTextInput];
		return;
	}

	if (lastTimeUnlockedSwitch && !prefersLastTimeLockedSwitch) {
		SBUILegibilityLabel* label = MSHookIvar<SBUILegibilityLabel *>(self, "_label");
		[label setString:[NSString stringWithFormat:@"Last Time Unlocked: %@", [preferences objectForKey:@"lastTimeUnlockedValue"]]];
	} else if (lastTimeUnlockedSwitch && prefersLastTimeLockedSwitch) {
		SBUILegibilityLabel* label = MSHookIvar<SBUILegibilityLabel *>(self, "_label");
		[label setString:[NSString stringWithFormat:@"Last Time Locked: %@", [preferences objectForKey:@"lastTimeUnlockedValue"]]];
	}

}

- (void)_updateLabelTextWithLanguage:(id)arg1 { // hide and set unlock text on home button devices (when recognized)

    %orig;

	if (hideUnlockTextSwitch) {
		[self setHidden:YES];
		return;
	}

	if (colorUnlockTextSwitch) {
		UIColor* customColor = [SparkColourPickerUtils colourWithString:[preferencesDictionary objectForKey:@"unlockTextColor"] withFallback: @"#ffffff"];
		SBUILegibilityLabel* label = MSHookIvar<SBUILegibilityLabel *>(self, "_label");
		[label setTextColor:customColor];
	}
    
	if (![unlockTextInput isEqual:@""]) {
		[self setText:unlockTextInput];
		return;
	}

	if (lastTimeUnlockedSwitch && !prefersLastTimeLockedSwitch) {
		SBUILegibilityLabel* label = MSHookIvar<SBUILegibilityLabel *>(self, "_label");
		[label setString:[NSString stringWithFormat:@"Last Time Unlocked: %@", [preferences objectForKey:@"lastTimeUnlockedValue"]]];
	} else if (lastTimeUnlockedSwitch && prefersLastTimeLockedSwitch) {
		SBUILegibilityLabel* label = MSHookIvar<SBUILegibilityLabel *>(self, "_label");
		[label setString:[NSString stringWithFormat:@"Last Time Locked: %@", [preferences objectForKey:@"lastTimeUnlockedValue"]]];
	}

}

%end

%hook CSCoverSheetViewController

- (void)viewDidDisappear:(BOOL)animated { // save time when devices was unlocked

	%orig;

	if (!lastTimeUnlockedSwitch) return;
	if (!prefersLastTimeLockedSwitch && isLocked) {
		NSDateFormatter* timeformat = [[NSDateFormatter alloc] init];
		[timeformat setDateFormat:lastTimeUnlockedFormatValue];
		currentTime = [timeformat stringFromDate:[NSDate date]];
		[preferences setObject:currentTime forKey:@"lastTimeUnlockedValue"];
		isLocked = NO;
	}

}

%end

%hook SBLockScreenManager

- (void)lockUIFromSource:(int)arg1 withOptions:(id)arg2 completion:(id)arg3 { // note when device was locked

    %orig;

	isLocked = YES;
	if (!lastTimeUnlockedSwitch) return;
	if (prefersLastTimeLockedSwitch) {
		NSDateFormatter* timeformat = [[NSDateFormatter alloc] init];
		[timeformat setDateFormat:lastTimeUnlockedFormatValue];
		currentTime = [timeformat stringFromDate:[NSDate date]];
		[preferences setObject:currentTime forKey:@"lastTimeUnlockedValue"];
	}	

}

%end

%end

// Media Player

%group DressMediaPlayer

%hook CSAdjunctItemView

- (void)didMoveToWindow { // hide media player or media player background

	%orig;

	[self setHidden:hideMediaPlayerSwitch];

	if (hideLockscreenPlayerBackgroundSwitch) {
		UIView* platterView = MSHookIvar<UIView *>(self, "_platterView");
		[[platterView backgroundMaterialView] setHidden:YES];
	}


}

- (void)setAlpha:(double)alpha { // set media palyer alpha

	%orig([mediaPlayerAlphaControl doubleValue]);

}

%end

%end

// Notifications

%group DressNotifications

%hook NCNotificationListView

- (BOOL)isRevealed { // needed to set the alpha of the title and clear button

	revealed = %orig;

	return %orig;

}

- (void)setPerformingGroupingAnimation:(BOOL)arg1 { // scroll animation

	%orig(notificationsScrollRevealSwitch);

}

%end

%hook NCNotificationListCell

- (void)setAlpha:(double)alpha { // set notifications alpha

	%orig([notificationsAlphaControl doubleValue]);

}

%end

// No Older Notifications Text

%hook NCNotificationListSectionRevealHintView

- (void)didMoveToWindow { // hide, set alpha and set alignment of the no older notifications text

	%orig;

	SBUILegibilityLabel* label = MSHookIvar<SBUILegibilityLabel *>(self, "_revealHintTitle");

	if (hideNoOlderNotificationsSwitch)
		[label setHidden:YES];
	else
		[label setHidden:NO];

	if ([noOlderNotificationsAlphaControl doubleValue] != 1.0)
		[label setAlpha:[noOlderNotificationsAlphaControl doubleValue]];

	if (![noOlderNotificationsTextInput isEqual:@""]) {
		[label setTextAlignment:NSTextAlignmentCenter];
    	[label setString:noOlderNotificationsTextInput];
	}

	if ([noOlderNotificationsTextAlignmentControl intValue] == 0)
		[label setTextAlignment:NSTextAlignmentLeft]; // left
	else if ([noOlderNotificationsTextAlignmentControl intValue] == 1)
		[label setTextAlignment:NSTextAlignmentCenter]; // center
	else if ([noOlderNotificationsTextAlignmentControl intValue] == 2)
		[label setTextAlignment:NSTextAlignmentRight]; // right

}

%end

// Notification Center Text

%hook NCNotificationListHeaderTitleView

- (void)didMoveToWindow { // hide and change notification header text

	%orig;

	[self setHidden:hideNotificationCenterTextSwitch];

	if  (![notificationCenterTextInput isEqual:@""])
		[self setTitle:notificationCenterTextInput];

}

%end

// Clear Notifications Button And Alpha For Header View

%hook NCNotificationListSectionHeaderView

- (void)didMoveToWindow { // hide clear button

	%orig;

	UIControl* clearButton = MSHookIvar<UIControl *>(self, "_clearButton");

	if (hideNotificationsClearButtonSwitch)
		[clearButton setHidden:YES];
	else
		[clearButton setHidden:NO];

}

- (void)setAlpha:(double)alpha { // change header alpha

	if (revealed && [notificationsHeaderViewAlphaControl doubleValue] != 1.0)
		%orig([notificationsHeaderViewAlphaControl doubleValue]);
	else
		%orig;

}

%end

// DND Banner

%hook DNDNotificationsService

- (void)_queue_postOrRemoveNotificationWithUpdatedBehavior:(BOOL)arg1 significantTimeChange:(BOOL)arg2 { // hide dnd banner

	if (hideDNDBannerSwitch)
		return;
	else
		%orig;

}

%end

%hook CSCombinedListViewController

- (double)_minInsetsToPushDateOffScreen { // adjust notification list position depending on style

	if ([notificationOffsetValue doubleValue] == 0.0) return %orig;
	double orig = %orig;
    return orig + [notificationOffsetValue doubleValue];

}

- (UIEdgeInsets)_listViewDefaultContentInsets { // adjust notification list position depending on style

	if ([notificationOffsetValue doubleValue] == 0.0) return %orig;
    UIEdgeInsets originalInsets = %orig;
    originalInsets.top += [notificationOffsetValue doubleValue];
    return originalInsets;

}

%end

%end

// Quick Actions

%group DressQuickActions

%hook CSQuickActionsView

- (void)didMoveToWindow { // hide flashlight & camera button and set their alpha

	%orig;

	CSQuickActionsButton* cameraButton = MSHookIvar<CSQuickActionsButton *>(self, "_cameraButton");
	CSQuickActionsButton* flashlightButton = MSHookIvar<CSQuickActionsButton *>(self, "_flashlightButton");

	if (hideCameraQuickActionsButtonSwitch)
		[cameraButton setHidden:YES];

	if ([cameraQuickActionsButtonAlphaControl doubleValue] != 1.0)
		[cameraButton setAlpha:[cameraQuickActionsButtonAlphaControl doubleValue]];

	if (hideFlashlightQuickActionsButtonSwitch)	
		[flashlightButton setHidden:YES];

	if ([flashlightQuickActionsButtonAlphaControl doubleValue] != 1.0)
		[flashlightButton setAlpha:[flashlightQuickActionsButtonAlphaControl doubleValue]];

}

- (CGFloat)_insetX { // change quick actions x position

	if (customQuickActionsXAxisSwitch)
		return [customQuickActionsXAxisValueControl doubleValue];
	else
		return %orig;
	
}

- (CGFloat)_insetY { // change quick actions y position

	if (customQuickActionsYAxisSwitch)
		return [customQuickActionsYAxisValueControl doubleValue];
	else
		return %orig;
	
}

%end

%hook CSQuickActionsButton

- (void)didMoveToWindow { // change quick actions color and hide their background

	%orig;

	if (colorQuickActionsSwitch) {
		UIColor* customColor = [SparkColourPickerUtils colourWithString:[preferencesDictionary objectForKey:@"quickActionsColor"] withFallback: @"#ffffff"];
		[self setTintColor:customColor];
	}

	if (hideQuickActionsButtonBackgroundSwitch) {
		UIVisualEffectView* background = MSHookIvar<UIVisualEffectView *>(self, "_backgroundEffectView");
		[background setHidden:YES];
	}

}

%end

%hook SBMainDisplayPolicyAggregator // Disable Today View/Camera Swipe

- (BOOL)_allowsCapabilityTodayViewWithExplanation:(id *)arg1 { // disable today view swipe

    if (disableTodaySwipeSwitch)
		return NO;
	else
		return %orig;

}

- (BOOL)_allowsCapabilityLockScreenCameraWithExplanation:(id *)arg1 { // disable camera swipe

    if (disableCameraSwipeSwitch)
		return NO;
	else
		return %orig;

}

%end

%end

%group DressOthers

// Custom Auto Lock Duration

%hook CSBehavior

- (void)setIdleTimerDuration:(long long)arg1 { // change auto lock timer duration

	if ([customLockDurationControl intValue] == 0)
		%orig;
	else if ([customLockDurationControl intValue] == 1)
		%orig(3); // apparently 10 seconds
	else if ([customLockDurationControl intValue] == 2)
		%orig(4); // apparently 15 seconds
	else if ([customLockDurationControl intValue] == 3)
		%orig(5); // apparently 20 seconds
	else if ([customLockDurationControl intValue] == 4)
		%orig(6); // apparently 25 seconds
	else if ([customLockDurationControl intValue] == 5)
		%orig(7); // apparently 30 seconds

}

%end

// Hide Charging View

%hook CSCoverSheetViewController

- (void)_transitionChargingViewToVisible:(BOOL)arg1 showBattery:(BOOL)arg2 animated:(BOOL)arg3 { // hide charging view

	if (disableBatteryViewSwitch)
		%orig(NO, NO, NO);
	else
		%orig;

}

%end

// Hide FaceID Animation

%hook SBUIPasscodeBiometricResource

- (BOOL)hasBiometricAuthenticationCapabilityEnabled { // hide faceid animation when swiping up

	return hideFaceIDAnimationSwitch;

}

%end

%end

%ctor {

	preferences = [[HBPreferences alloc] initWithIdentifier:@"love.litten.dresspreferences"];
	preferencesDictionary = [NSDictionary dictionaryWithContentsOfFile: @"/var/mobile/Library/Preferences/love.litten.dress.colorspreferences.plist"];

    [preferences registerBool:&enabled default:nil forKey:@"Enabled"];
	[preferences registerBool:&enableTimeDateSection default:nil forKey:@"EnableTimeDateSection"];
	[preferences registerBool:&enableFaceIDLockSection default:nil forKey:@"EnableFaceIDLockSection"];
	[preferences registerBool:&enableStatusBarSection default:nil forKey:@"EnableStatusBarSection"];
	[preferences registerBool:&enableHomebarSection default:nil forKey:@"EnableHomebarSection"];
	[preferences registerBool:&enablePageDotsSection default:nil forKey:@"EnablePageDotsSection"];
	[preferences registerBool:&enableUnlockTextSection default:nil forKey:@"EnableUnlockTextSection"];
	[preferences registerBool:&enableMediaPlayerSection default:nil forKey:@"EnableMediaPlayerSection"];
	[preferences registerBool:&enableNotificationsSection default:nil forKey:@"EnableNotificationsSection"];
	[preferences registerBool:&enableQuickActionsSection default:nil forKey:@"EnableQuickActionsSection"];
	[preferences registerBool:&enableEvanescoModeSection default:nil forKey:@"EnableEvanescoModeSection"];
	[preferences registerBool:&enableOthersSection default:nil forKey:@"EnableOthersSection"];

	// time and date
	if (enableTimeDateSection) {
		[preferences registerBool:&hideTimeAndDateSwitch default:NO forKey:@"hideTimeAndDate"];
		[preferences registerBool:&hideOnlyDateSwitch default:NO forKey:@"hideOnlyDate"];
		[preferences registerBool:&hideLunarCalendarSwitch default:NO forKey:@"hideLunarCalendar"];
		[preferences registerObject:&timeAndDateAlphaValue default:@"1.0" forKey:@"timeAndDateAlpha"];
		[preferences registerBool:&customTimeAndDatePositioningSwitch default:NO forKey:@"customTimeAndDatePositioning"];
		[preferences registerObject:&customTimeAndDateXAxisValue default:@"1.0" forKey:@"customTimeAndDateXAxis"];
		[preferences registerObject:&customTimeAndDateYAxisValue default:@"1.0" forKey:@"customTimeAndDateYAxis"];
		[preferences registerObject:&timeAndDateAlignmentControl default:@"1" forKey:@"timeAndDateAlignment"];
		[preferences registerBool:&customTimeFontSwitch default:NO forKey:@"customTimeFont"];
		[preferences registerBool:&useCustomChosenTimeFontSwitch default:NO forKey:@"useCustomChosenTimeFont"];
		[preferences registerObject:&fontSizeTimeControl default:@"80" forKey:@"fontSizeTime"];
		[preferences registerObject:&fontWeightTimeControl default:@"-0.4" forKey:@"fontWeightTime"];
		[preferences registerBool:&useRoundedFontTimeSwitch default:NO forKey:@"useRoundedFontTime"];
		[preferences registerBool:&useItalicFontTimeSwitch default:NO forKey:@"useItalicFontTime"];
		[preferences registerBool:&customDateFontSwitch default:NO forKey:@"customDateFont"];
		[preferences registerBool:&useCustomChosenDateFontSwitch default:NO forKey:@"useCustomChosenDateFont"];
		[preferences registerObject:&fontSizeDateControl default:@"23" forKey:@"fontSizeDate"];
		[preferences registerObject:&fontWeightDateControl default:@"0.0" forKey:@"fontWeightDate"];
		[preferences registerBool:&useRoundedFontDateSwitch default:NO forKey:@"useRoundedFontDate"];
		[preferences registerBool:&useItalicFontDateSwitch default:NO forKey:@"useItalicFontDate"];
		[preferences registerBool:&customFontLunarSwitch default:YES forKey:@"customFontLunar"];
		[preferences registerBool:&useCompactDateFormatSwitch default:NO forKey:@"useCompactDateFormat"];
		[preferences registerBool:&colorTimeAndDateSwitch default:NO forKey:@"colorTimeAndDate"];
	}

	// faceID lock
	if (enableFaceIDLockSection) {
		[preferences registerBool:&hideFaceIDLockSwitch default:NO forKey:@"hideFaceIDLock"];
		[preferences registerBool:&hideFaceIDLockLabelSwitch default:NO forKey:@"hideFaceIDLockLabel"];
		[preferences registerObject:&faceIDLockAlphaValue default:@"1.0" forKey:@"faceIDLockAlpha"];
		[preferences registerBool:&customFaceIDAxisSwitch default:NO forKey:@"customFaceIDAxis"];
		[preferences registerObject:&faceIDXAxisControl default:@"176.0" forKey:@"faceIDXAxis"];
		[preferences registerObject:&faceIDYAxisControl default:@"0.0" forKey:@"faceIDYAxis"];
		[preferences registerObject:&customFaceIDSizeControl default:@"0.0" forKey:@"customFaceIDSize"];
		[preferences registerBool:&colorFaceIDLockSwitch default:NO forKey:@"colorFaceIDLock"];
	}

	// status bar
	if (enableStatusBarSection) {
		[preferences registerBool:&hideStatusBarSwitch default:NO forKey:@"hideStatusBar"];
		[preferences registerObject:&statusBarAlphaControl default:@"1.0" forKey:@"statusBarAlpha"];
	}

	// homebar
	if (enableHomebarSection) {
		[preferences registerBool:&hideHomebarSwitch default:NO forKey:@"hideHomebar"];
		[preferences registerObject:&homebarAlphaControl default:@"1.0" forKey:@"homebarAlpha"];
		[preferences registerBool:&colorHomebarSwitch default:NO forKey:@"colorHomebar"];
	}

	// page dots
	if (enablePageDotsSection) {
		[preferences registerBool:&hidePageDotsSwitch default:NO forKey:@"hidePageDots"];
		[preferences registerObject:&pageDotsAlphaControl default:@"1.0" forKey:@"pageDotsAlpha"];
	}

	// unlock text, cc grabber
	if (enableUnlockTextSection) {
		[preferences registerBool:&hideUnlockTextSwitch default:NO forKey:@"hideUnlockText"];
		[preferences registerObject:&unlockTextInput default:@"" forKey:@"unlockText"];
		[preferences registerBool:&hideCCGrabberSwitch default:NO forKey:@"hideCCGrabber"];
		[preferences registerObject:&ccGrabberAlphaControl default:@"1.0" forKey:@"ccGrabberAlpha"];
		[preferences registerBool:&lastTimeUnlockedSwitch default:NO forKey:@"lastTimeUnlocked"];
		[preferences registerBool:&prefersLastTimeLockedSwitch default:NO forKey:@"prefersLastTimeLocked"];
		[preferences registerObject:&lastTimeUnlockedFormatValue default:@"HH:mm" forKey:@"lastTimeUnlockedFormat"];
		[preferences registerBool:&colorUnlockTextSwitch default:NO forKey:@"colorUnlockText"];
	}

	// media player
	if (enableMediaPlayerSection) {
		[preferences registerBool:&hideMediaPlayerSwitch default:NO forKey:@"hideMediaPlayer"];
		[preferences registerBool:&hideLockscreenPlayerBackgroundSwitch default:NO forKey:@"hideLockscreenPlayerBackground"];
		[preferences registerObject:&mediaPlayerAlphaControl default:@"1.0" forKey:@"mediaPlayerAlpha"];
	}

	// notifications
	if (enableNotificationsSection) {
		[preferences registerBool:&hideNoOlderNotificationsSwitch default:NO forKey:@"hideNoOlderNotifications"];
		[preferences registerBool:&hideNotificationCenterTextSwitch default:NO forKey:@"hideNotificationCenterText"];
		[preferences registerBool:&hideNotificationsClearButtonSwitch default:NO forKey:@"hideNotificationsClearButton"];
		[preferences registerObject:&noOlderNotificationsAlphaControl default:@"1.0" forKey:@"noOlderNotificationsAlpha"];
		[preferences registerObject:&notificationsAlphaControl default:@"1.0" forKey:@"notificationsAlpha"];
		[preferences registerObject:&notificationsHeaderViewAlphaControl default:@"1.0" forKey:@"notificationsHeaderViewAlpha"];
		[preferences registerObject:&notificationOffsetValue default:@"0.0" forKey:@"notificationOffset"];
		[preferences registerObject:&noOlderNotificationsTextInput default:@"" forKey:@"noOlderNotificationsText"];
		[preferences registerObject:&noOlderNotificationsTextAlignmentControl default:@"1" forKey:@"noOlderNotificationsTextAlignment"];
		[preferences registerObject:&notificationCenterTextInput default:@"" forKey:@"notificationCenterText"];
		[preferences registerBool:&notificationsScrollRevealSwitch default:NO forKey:@"notificationsScrollReveal"];
		[preferences registerBool:&hideDNDBannerSwitch default:NO forKey:@"hideDNDBanner"];
	}

	// quick actions
	if (enableQuickActionsSection) {
		[preferences registerBool:&hideCameraQuickActionsButtonSwitch default:NO forKey:@"hideCameraQuickActionsButton"];
		[preferences registerBool:&hideFlashlightQuickActionsButtonSwitch default:NO forKey:@"hideFlashlightQuickActionsButton"];
		[preferences registerBool:&hideQuickActionsButtonBackgroundSwitch default:NO forKey:@"hideQuickActionsButtonBackground"];
		[preferences registerObject:&cameraQuickActionsButtonAlphaControl default:@"1.0" forKey:@"cameraQuickActionsButtonAlpha"];
		[preferences registerObject:&flashlightQuickActionsButtonAlphaControl default:@"1.0" forKey:@"flashlightQuickActionsButtonAlpha"];
		[preferences registerBool:&disableTodaySwipeSwitch default:NO forKey:@"disableTodaySwipe"];
		[preferences registerBool:&disableCameraSwipeSwitch default:NO forKey:@"disableCameraSwipe"];
		[preferences registerBool:&hideCameraQuickActionsButtonSwitch default:NO forKey:@"hideCameraQuickActionsButton"];
		[preferences registerBool:&customQuickActionsXAxisSwitch default:NO forKey:@"customQuickActionsXAxis"];
		[preferences registerBool:&customQuickActionsYAxisSwitch default:NO forKey:@"customQuickActionsYAxis"];
		[preferences registerObject:&customQuickActionsXAxisValueControl default:@"50.0" forKey:@"customQuickActionsXAxisValue"];
		[preferences registerObject:&customQuickActionsYAxisValueControl default:@"50.0" forKey:@"customQuickActionsYAxisValue"];
		[preferences registerBool:&colorQuickActionsSwitch default:NO forKey:@"colorQuickActions"];
	}

	// others
	if (enableOthersSection) {
		[preferences registerObject:&customLockDurationControl default:@"0" forKey:@"customLockDuration"];
		[preferences registerBool:&disableBatteryViewSwitch default:NO forKey:@"disableBatteryView"];
		[preferences registerBool:&hideFaceIDAnimationSwitch default:NO forKey:@"hideFaceIDAnimation"];
	}

	if (enabled) {
		BOOL timeAndDateTweaksCompatible = ![[NSFileManager defaultManager] fileExistsAtPath:@"/Library/MobileSubstrate/DynamicLibraries/Kalm.dylib"] && ![[NSFileManager defaultManager] fileExistsAtPath:@"/Library/MobileSubstrate/DynamicLibraries/Jellyfish.dylib"] && ![[NSFileManager defaultManager] fileExistsAtPath:@"/Library/MobileSubstrate/DynamicLibraries/Heartlines.dylib"] && ![[NSFileManager defaultManager] fileExistsAtPath:@"/Library/MobileSubstrate/DynamicLibraries/Lara.dylib"];
		BOOL faceIDLockTweaksCompatible = ![[NSFileManager defaultManager] fileExistsAtPath:@"/Library/MobileSubstrate/DynamicLibraries/Kalm.dylib"] && ![[NSFileManager defaultManager] fileExistsAtPath:@"/Library/MobileSubstrate/DynamicLibraries/Jellyfish.dylib"] && ![[NSFileManager defaultManager] fileExistsAtPath:@"/Library/MobileSubstrate/DynamicLibraries/LatchKey.dylib"] && ![[NSFileManager defaultManager] fileExistsAtPath:@"/Library/MobileSubstrate/DynamicLibraries/Heartlines.dylib"] && ![[NSFileManager defaultManager] fileExistsAtPath:@"/Library/MobileSubstrate/DynamicLibraries/Lara.dylib"];

		%init(Dress);
        if (enableTimeDateSection && timeAndDateTweaksCompatible) %init(DressTimeDate);
		if (enableFaceIDLockSection && faceIDLockTweaksCompatible) %init(DressFaceIDLock);
		if (enableStatusBarSection) %init(DressStatusBar);
		if (enableHomebarSection) %init(DressHomebar);
		if (enablePageDotsSection) %init(DressPageDots);
		if (enableUnlockTextSection) %init(DressUnlockText);
		if (enableMediaPlayerSection) %init(DressMediaPlayer);
		if (enableNotificationsSection) %init(DressNotifications);
		if (enableQuickActionsSection) %init(DressQuickActions);
		if (enableOthersSection) %init(DressOthers);
        return;
    }

}