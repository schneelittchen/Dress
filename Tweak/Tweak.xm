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
BOOL enableColorFlowSupportSection;
BOOL enableOthersSection;

BOOL dpkgInvalid = NO;

BOOL isLocked = YES; // used to detect if the device is locked
BOOL revealed = NO; // used for notification header/clear button alpha

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

- (void)didMoveToWindow {

	%orig;

	if (hideTimeAndDateSwitch)
		[self setHidden:YES];
	else
		[self setHidden:NO];

	if (colorTimeAndDateSwitch) {
		UIColor* customTimeColor = [SparkColourPickerUtils colourWithString:[preferencesDictionary objectForKey:@"timeColor"] withFallback: @"#ffffff"];
		UIColor* customDateColor = [SparkColourPickerUtils colourWithString:[preferencesDictionary objectForKey:@"dateColor"] withFallback: @"#ffffff"];
		UIView* subtitleView = MSHookIvar<UIView *>(self, "_dateSubtitleView");
		SBUILegibilityLabel* label = MSHookIvar<SBUILegibilityLabel *>(subtitleView, "_label");
		[self setTextColor:customTimeColor];
		[label setTextColor:customDateColor];
	}

}

- (void)setAlpha:(double)alpha {

	if ([timeAndDateAlphaValue doubleValue] != 1.0)
		%orig([timeAndDateAlphaValue doubleValue]);
	else
		%orig;

}

- (void)setAlignmentPercent:(double)arg1 {

	if ([timeAndDateAlignmentControl intValue] == 0)
		%orig(-1.0); // left
	else if ([timeAndDateAlignmentControl intValue] == 1)
		%orig(0.0); // center
	else if ([timeAndDateAlignmentControl intValue] == 2)
		%orig(1.0); // right

}

- (void)setUseCompactDateFormat:(BOOL)arg1 {

	if (useCompactDateFormatSwitch)
		%orig(YES);
	else
		%orig;

}

+ (id)timeFont {

	if (customTimeFontSwitch) {
		if (![fontNameTimeInput isEqual:@""] && !useRoundedFontTimeSwitch)
			return [UIFont fontWithName:fontNameTimeInput size:[fontSizeTimeControl doubleValue]];
		else if ([fontNameTimeInput isEqual:@""] && useRoundedFontTimeSwitch)
			return [UIFont fontWithDescriptor:[[[UIFont systemFontOfSize:[fontSizeTimeControl doubleValue] weight:[fontWeightTimeControl doubleValue]] fontDescriptor] fontDescriptorWithDesign:UIFontDescriptorSystemDesignRounded] size:[fontSizeTimeControl doubleValue]];
		else if ([fontNameTimeInput isEqual:@""] && !useRoundedFontTimeSwitch && useItalicFontTimeSwitch)
			return [UIFont italicSystemFontOfSize:[fontSizeTimeControl doubleValue]];
		else if ([fontNameTimeInput isEqual:@""])
			return [UIFont systemFontOfSize:[fontSizeTimeControl doubleValue] weight:[fontWeightTimeControl doubleValue]];
		else
			return %orig;
	} else {
		return %orig;
	}

}

%end

%hook SBFLockScreenDateSubtitleView

+ (id)labelFont {

	if (customDateFontSwitch) {
		if (![fontNameDateInput isEqual:@""])
			return [UIFont fontWithName:fontNameDateInput size:[fontSizeDateControl doubleValue]];
		else if ([fontNameTimeInput isEqual:@""] && useRoundedFontTimeSwitch)
			return [UIFont fontWithDescriptor:[[[UIFont systemFontOfSize:[fontSizeDateControl doubleValue] weight:[fontWeightDateControl doubleValue]] fontDescriptor] fontDescriptorWithDesign:UIFontDescriptorSystemDesignRounded] size:[fontSizeDateControl doubleValue]];
		else if ([fontNameTimeInput isEqual:@""] && !useRoundedFontDateSwitch && useItalicFontDateSwitch)
			return [UIFont italicSystemFontOfSize:[fontSizeDateControl doubleValue]];
		else if ([fontNameDateInput isEqual:@""])
			return [UIFont systemFontOfSize:[fontSizeDateControl doubleValue] weight:[fontWeightDateControl doubleValue]];
		else
			return %orig;
	} else {
		return %orig;
	}

}

%end

%hook SBFLockScreenDateSubtitleDateView

- (void)didMoveToWindow {

	%orig;

	if (hideOnlyDateSwitch)
		[self setHidden:YES];
	else
		[self setHidden:NO];

	SBFLockScreenAlternateDateLabel* label = MSHookIvar<SBFLockScreenAlternateDateLabel *>(self, "_alternateDateLabel");

	if (hideLunarCalendarSwitch)
		[label setHidden:YES];
	else
		[label setHidden:NO];

}

+ (id)dateTimeLunarDateFont {

	if (customDateFontSwitch && customFontLunarSwitch) {
		if (![fontNameDateInput isEqual:@""])
			return [UIFont fontWithName:fontNameDateInput size:[fontSizeDateControl doubleValue]];
		else if ([fontNameTimeInput isEqual:@""] && useRoundedFontTimeSwitch)
			return [UIFont fontWithDescriptor:[[[UIFont systemFontOfSize:[fontSizeDateControl doubleValue] weight:[fontWeightDateControl doubleValue]] fontDescriptor] fontDescriptorWithDesign:UIFontDescriptorSystemDesignRounded] size:[fontSizeDateControl doubleValue]];
		else if ([fontNameTimeInput isEqual:@""] && !useRoundedFontDateSwitch && useItalicFontDateSwitch)
			return [UIFont italicSystemFontOfSize:[fontSizeDateControl doubleValue]];
		else if ([fontNameDateInput isEqual:@""])
			return [UIFont systemFontOfSize:[fontSizeDateControl doubleValue] weight:[fontWeightDateControl doubleValue]];
		else
			return %orig;
	} else {
		return %orig;
	}

}

%end

%end

// FaceID Lock

%group DressFaceIDLock

%hook SBUIProudLockIconView

- (void)didMoveToWindow {

	%orig;

	if (hideFaceIDLockSwitch)
		[self setHidden:YES];
	else
		[self setHidden:NO];

}

- (void)setContentColor:(UIColor *)arg1 {

	if (colorFaceIDLockSwitch)
		%orig([SparkColourPickerUtils colourWithString:[preferencesDictionary objectForKey:@"faceIDLockColor"] withFallback: @"#ffffff"]);
	else
		%orig;

}

- (void)setFrame:(CGRect)frame {

	if (customFaceIDAxisSwitch)
		%orig(CGRectMake([faceIDXAxisControl doubleValue], [faceIDYAxisControl doubleValue], 23 + [customFaceIDSizeControl doubleValue], 33 + [customFaceIDSizeControl doubleValue]));
	else
		%orig;

}

- (void)setAlpha:(double)alpha {

	if ([faceIDLockAlphaValue doubleValue] != 1.0)
		%orig([faceIDLockAlphaValue doubleValue]);
	else
		%orig;

}

%end

%hook UIMorphingLabel

- (void)didMoveToWindow {

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
- (void)receiveStatusBarCustomizationNotification:(NSNotification *)notification {

	if ([notification.name isEqual:@"hideStatusBar"])
    	[[self statusBar] setHidden:YES];
	else if ([notification.name isEqual:@"showStatusBar"])
		[[self statusBar] setHidden:NO];
	else if ([notification.name isEqual:@"changeAlphaStatusBar"])
		[[self statusBar] setAlpha:[statusBarAlphaControl doubleValue]];
	else if ([notification.name isEqual:@"revertAlphaStatusBar"])
		[[self statusBar] setAlpha:1.0];

}

- (void)dealloc { // remove observer
	
	[[NSNotificationCenter defaultCenter] removeObserver:self];
    
	%orig;

}

%end

%hook SBCoverSheetPrimarySlidingViewController // send notifications to hide or show the status bar

- (void)viewWillDisappear:(BOOL)animated {

	%orig;

	if (hideStatusBarSwitch)
		[[NSNotificationCenter defaultCenter] postNotificationName:@"showStatusBar" object:nil];

	if ([statusBarAlphaControl doubleValue] != 1.0)
		[[NSNotificationCenter defaultCenter] postNotificationName:@"revertAlphaStatusBar" object:nil];

}

- (void)viewWillAppear:(BOOL)animated {

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

- (void)didMoveToWindow {

	%orig;

	if (hideHomebarSwitch)
		[self setHidden:YES];
	else
		[self setHidden:NO];

}

- (void)setAlpha:(double)alpha {

	if ([homebarAlphaControl doubleValue] != 1.0)
		%orig([homebarAlphaControl doubleValue]);
	else
		%orig;

}

%end

%hook MTStaticColorPillView

- (void)didMoveToWindow {

	%orig;

	if (colorHomebarSwitch) {
		UIColor* customColor = [SparkColourPickerUtils colourWithString:[preferencesDictionary objectForKey:@"homebarColor"] withFallback: @"#ffffff"];
		[self setPillColor:customColor];
	}

}

%end

%end

// Page Dots

%group DressPageDots

%hook CSPageControl // iOS 13

- (void)didMoveToWindow {

	%orig;

	if (hidePageDotsSwitch)
		[self setHidden:YES];
	else
		[self setHidden:NO];

}

- (void)setAlpha:(double)alpha {

	if ([pageDotsAlphaControl doubleValue] != 1.0)
		%orig([pageDotsAlphaControl doubleValue]);
	else
		%orig;

}

%end

%hook SBDashBoardPageControl // iOS 12

- (void)didMoveToWindow {

	%orig;

	if (hidePageDotsSwitch)
		[self setHidden:YES];
	else
		[self setHidden:NO];

}

- (void)setAlpha:(double)alpha {

	if ([pageDotsAlphaControl doubleValue] != 1.0)
		%orig([pageDotsAlphaControl doubleValue]);
	else
		%orig;

}

%end

%end

// Unlock Text

%group DressUnlockText

%hook CSTeachableMomentsContainerView // iX iOS 13

- (void)_layoutCallToActionLabel {
	
	%orig;

	SBUILegibilityLabel* label = MSHookIvar<SBUILegibilityLabel *>(self, "_callToActionLabel");

	if (hideUnlockTextSwitch)
		[label setHidden:YES];
	else
		[label setHidden:NO];

	if (colorUnlockTextSwitch) {
		UIColor* customColor = [SparkColourPickerUtils colourWithString:[preferencesDictionary objectForKey:@"unlockTextColor"] withFallback: @"#ffffff"];
		SBUILegibilityLabel* label = MSHookIvar<SBUILegibilityLabel *>(self, "_callToActionLabel");
		[label setTextColor:customColor];
	}

	if (![unlockTextInput isEqual:@""]) {
		[label setString:unlockTextInput];
		return;
	}

	if (lastTimeUnlockedSwitch) {
		if (!lastTimeUnlockedOnlyTimeAndDateSwitch) {
			if (!prefersLastTimeLockedSwitch)
				[label setString:[NSString stringWithFormat:@"Last Time Unlocked: %@", [preferences objectForKey:@"lastTimeUnlockedValue"]]];
			else if (prefersLastTimeLockedSwitch)
				[label setString:[NSString stringWithFormat:@"Last Time Locked: %@", [preferences objectForKey:@"lastTimeUnlockedValue"]]];
		} else if (lastTimeUnlockedOnlyTimeAndDateSwitch) {
			if (!prefersLastTimeLockedSwitch)
				[label setString:[NSString stringWithFormat:@"%@", [preferences objectForKey:@"lastTimeUnlockedValue"]]];
			else if (prefersLastTimeLockedSwitch)
				[label setString:[NSString stringWithFormat:@"%@", [preferences objectForKey:@"lastTimeUnlockedValue"]]];	
		}
		return;
	}

	if (ipAddressSwitch) {
		struct ifaddrs* interfaces = NULL;
		struct ifaddrs* temp_addr = NULL;
		NSString* wifiAddress = nil;
		NSString* cellAddress = nil;

		if (!getifaddrs(&interfaces)) {
			temp_addr = interfaces;
			while (temp_addr != NULL) {
				sa_family_t sa_type = temp_addr->ifa_addr->sa_family;
				if (sa_type == AF_INET || sa_type == AF_INET6) {
					NSString *name = [NSString stringWithUTF8String:temp_addr->ifa_name];
					NSString *addr = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];

					if ([name isEqualToString:@"en0"])
						wifiAddress = addr;
					else if ([name isEqualToString:@"pdp_ip0"])
						cellAddress = addr;
				}
				temp_addr = temp_addr->ifa_next;
			}
			freeifaddrs(interfaces);
		}
		ipAddress = wifiAddress ? wifiAddress : cellAddress;
		[label setString:ipAddress];
		return;
	}

	if (weatherConditionSwitch && !weatherTemperatureSwitch) {
		[[PDDokdo sharedInstance] refreshWeatherData];
		[label setString:[NSString stringWithFormat:@"%@", [[PDDokdo sharedInstance] currentConditions]]];
		return;
	} else if (!weatherConditionSwitch && weatherTemperatureSwitch) {
		[[PDDokdo sharedInstance] refreshWeatherData];
		[label setString:[NSString stringWithFormat:@"%@", [[PDDokdo sharedInstance] currentTemperature]]];
		return;
	} else if (weatherConditionSwitch && weatherTemperatureSwitch) {
		[[PDDokdo sharedInstance] refreshWeatherData];
		[label setString:[NSString stringWithFormat:@"%@ %@", [[PDDokdo sharedInstance] currentConditions], [[PDDokdo sharedInstance] currentTemperature]]];
		return;
	}

}

- (void)didMoveToWindow { // CC Grabber

	%orig;

	if (hideCCGrabberSwitch)
		[[self controlCenterGrabberContainerView] setHidden:YES];
	else
		[[self controlCenterGrabberContainerView] setHidden:NO];

	[[self controlCenterGrabberContainerView] setAlpha:[ccGrabberAlphaControl doubleValue]];

}

%end

%hook SBDashBoardTeachableMomentsContainerView // iX iOS 12

- (void)_layoutCallToActionLabel {

	%orig;

	SBUILegibilityLabel* label = MSHookIvar<SBUILegibilityLabel *>(self, "_callToActionLabel");

	if (hideUnlockTextSwitch)
		[label setHidden:YES];
	else
		[label setHidden:NO];

	if (colorUnlockTextSwitch) {
		UIColor* customColor = [SparkColourPickerUtils colourWithString:[preferencesDictionary objectForKey:@"unlockTextColor"] withFallback: @"#ffffff"];
		SBUILegibilityLabel* label = MSHookIvar<SBUILegibilityLabel *>(self, "_callToActionLabel");
		[label setTextColor:customColor];
	}

	if (![unlockTextInput isEqual:@""]) {
		[label setString:unlockTextInput];
		return;	
	}

	if (lastTimeUnlockedSwitch) {
		if (!lastTimeUnlockedOnlyTimeAndDateSwitch) {
			if (!prefersLastTimeLockedSwitch)
				[label setString:[NSString stringWithFormat:@"Last Time Unlocked: %@", [preferences objectForKey:@"lastTimeUnlockedValue"]]];
			else if (prefersLastTimeLockedSwitch)
				[label setString:[NSString stringWithFormat:@"Last Time Locked: %@", [preferences objectForKey:@"lastTimeUnlockedValue"]]];
		} else if (lastTimeUnlockedOnlyTimeAndDateSwitch) {
			if (!prefersLastTimeLockedSwitch)
				[label setString:[NSString stringWithFormat:@"%@", [preferences objectForKey:@"lastTimeUnlockedValue"]]];
			else if (prefersLastTimeLockedSwitch)
				[label setString:[NSString stringWithFormat:@"%@", [preferences objectForKey:@"lastTimeUnlockedValue"]]];	
		}
		return;
	}

	if (ipAddressSwitch) {
		struct ifaddrs* interfaces = NULL;
		struct ifaddrs* temp_addr = NULL;
		NSString* wifiAddress = nil;
		NSString* cellAddress = nil;

		if (!getifaddrs(&interfaces)) {
			temp_addr = interfaces;
			while (temp_addr != NULL) {
				sa_family_t sa_type = temp_addr->ifa_addr->sa_family;
				if (sa_type == AF_INET || sa_type == AF_INET6) {
					NSString *name = [NSString stringWithUTF8String:temp_addr->ifa_name];
					NSString *addr = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];

					if ([name isEqualToString:@"en0"])
						wifiAddress = addr;
					else if ([name isEqualToString:@"pdp_ip0"])
						cellAddress = addr;
				}
				temp_addr = temp_addr->ifa_next;
			}
			freeifaddrs(interfaces);
		}
		ipAddress = wifiAddress ? wifiAddress : cellAddress;
		[label setString:ipAddress];
		return;
	}

	if (weatherConditionSwitch && !weatherTemperatureSwitch) {
		[[PDDokdo sharedInstance] refreshWeatherData];
		[label setString:[NSString stringWithFormat:@"%@", [[PDDokdo sharedInstance] currentConditions]]];
		return;
	} else if (!weatherConditionSwitch && weatherTemperatureSwitch) {
		[[PDDokdo sharedInstance] refreshWeatherData];
		[label setString:[NSString stringWithFormat:@"%@", [[PDDokdo sharedInstance] currentTemperature]]];
		return;
	} else if (weatherConditionSwitch && weatherTemperatureSwitch) {
		[[PDDokdo sharedInstance] refreshWeatherData];
		[label setString:[NSString stringWithFormat:@"%@ %@", [[PDDokdo sharedInstance] currentConditions], [[PDDokdo sharedInstance] currentTemperature]]];
		return;
	}

}

%end

%hook SBUICallToActionLabel

- (void)didMoveToWindow { // home button devices before touchID recognized

	%orig;

	if (hideUnlockTextSwitch)
		[self setHidden:YES];
	else
		[self setHidden:NO];

	if (colorUnlockTextSwitch) {
		UIColor* customColor = [SparkColourPickerUtils colourWithString:[preferencesDictionary objectForKey:@"unlockTextColor"] withFallback: @"#ffffff"];
		SBUILegibilityLabel* label = MSHookIvar<SBUILegibilityLabel *>(self, "_label");
		[label setTextColor:customColor];
	}

	if (![unlockTextInput isEqual:@""]) {
		[self setText:unlockTextInput];
		return;
	}

	if (lastTimeUnlockedSwitch) {
		if (!lastTimeUnlockedOnlyTimeAndDateSwitch) {
			if (!prefersLastTimeLockedSwitch)
				[self setText:[NSString stringWithFormat:@"Last Time Unlocked: %@", [preferences objectForKey:@"lastTimeUnlockedValue"]]];
			else if (prefersLastTimeLockedSwitch)
				[self setText:[NSString stringWithFormat:@"Last Time Locked: %@", [preferences objectForKey:@"lastTimeUnlockedValue"]]];
		} else if (lastTimeUnlockedOnlyTimeAndDateSwitch) {
			if (!prefersLastTimeLockedSwitch)
				[self setText:[NSString stringWithFormat:@"%@", [preferences objectForKey:@"lastTimeUnlockedValue"]]];
			else if (prefersLastTimeLockedSwitch)
				[self setText:[NSString stringWithFormat:@"%@", [preferences objectForKey:@"lastTimeUnlockedValue"]]];	
		}
		return;
	}

	if (ipAddressSwitch) {
		struct ifaddrs* interfaces = NULL;
		struct ifaddrs* temp_addr = NULL;
		NSString* wifiAddress = nil;
		NSString* cellAddress = nil;

		if (!getifaddrs(&interfaces)) {
			temp_addr = interfaces;
			while (temp_addr != NULL) {
				sa_family_t sa_type = temp_addr->ifa_addr->sa_family;
				if (sa_type == AF_INET || sa_type == AF_INET6) {
					NSString *name = [NSString stringWithUTF8String:temp_addr->ifa_name];
					NSString *addr = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];

					if ([name isEqualToString:@"en0"])
						wifiAddress = addr;
					else if ([name isEqualToString:@"pdp_ip0"])
						cellAddress = addr;
				}
				temp_addr = temp_addr->ifa_next;
			}
			freeifaddrs(interfaces);
		}
		ipAddress = wifiAddress ? wifiAddress : cellAddress;
		[self setText:ipAddress];
		return;
	}

	if (weatherConditionSwitch && !weatherTemperatureSwitch) {
		[[PDDokdo sharedInstance] refreshWeatherData];
		[self setText:[NSString stringWithFormat:@"%@", [[PDDokdo sharedInstance] currentConditions]]];
		return;
	} else if (!weatherConditionSwitch && weatherTemperatureSwitch) {
		[[PDDokdo sharedInstance] refreshWeatherData];
		[self setText:[NSString stringWithFormat:@"%@", [[PDDokdo sharedInstance] currentTemperature]]];
		return;
	} else if (weatherConditionSwitch && weatherTemperatureSwitch) {
		[[PDDokdo sharedInstance] refreshWeatherData];
		[self setText:[NSString stringWithFormat:@"%@ %@", [[PDDokdo sharedInstance] currentConditions], [[PDDokdo sharedInstance] currentTemperature]]];
		return;
	}

}

- (void)_updateLabelTextWithLanguage:(id)arg1 {  // home button devices after touchID recognized

    %orig;

	if (hideUnlockTextSwitch)
		[self setHidden:YES];
	else
		[self setHidden:NO];

	if (colorUnlockTextSwitch) {
		UIColor* customColor = [SparkColourPickerUtils colourWithString:[preferencesDictionary objectForKey:@"unlockTextColor"] withFallback: @"#ffffff"];
		SBUILegibilityLabel* label = MSHookIvar<SBUILegibilityLabel *>(self, "_label");
		[label setTextColor:customColor];
	}
    
	if (![unlockTextInput isEqual:@""]) {
		[self setText:unlockTextInput];
		return;
	}

	if (lastTimeUnlockedSwitch) {
		if (!lastTimeUnlockedOnlyTimeAndDateSwitch) {
			if (!prefersLastTimeLockedSwitch)
				[self setText:[NSString stringWithFormat:@"Last Time Unlocked: %@", [preferences objectForKey:@"lastTimeUnlockedValue"]]];
			else if (prefersLastTimeLockedSwitch)
				[self setText:[NSString stringWithFormat:@"Last Time Locked: %@", [preferences objectForKey:@"lastTimeUnlockedValue"]]];
		} else if (lastTimeUnlockedOnlyTimeAndDateSwitch) {
			if (!prefersLastTimeLockedSwitch)
				[self setText:[NSString stringWithFormat:@"%@", [preferences objectForKey:@"lastTimeUnlockedValue"]]];
			else if (prefersLastTimeLockedSwitch)
				[self setText:[NSString stringWithFormat:@"%@", [preferences objectForKey:@"lastTimeUnlockedValue"]]];	
		}
		return;
	}

	if (ipAddressSwitch) {
		struct ifaddrs* interfaces = NULL;
		struct ifaddrs* temp_addr = NULL;
		NSString* wifiAddress = nil;
		NSString* cellAddress = nil;

		if (!getifaddrs(&interfaces)) {
			temp_addr = interfaces;
			while (temp_addr != NULL) {
				sa_family_t sa_type = temp_addr->ifa_addr->sa_family;
				if (sa_type == AF_INET || sa_type == AF_INET6) {
					NSString *name = [NSString stringWithUTF8String:temp_addr->ifa_name];
					NSString *addr = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];

					if ([name isEqualToString:@"en0"])
						wifiAddress = addr;
					else if ([name isEqualToString:@"pdp_ip0"])
						cellAddress = addr;
				}
				temp_addr = temp_addr->ifa_next;
			}
			freeifaddrs(interfaces);
		}
		ipAddress = wifiAddress ? wifiAddress : cellAddress;
		[self setText:ipAddress];
		return;
	}
	
	if (weatherConditionSwitch && !weatherTemperatureSwitch) {
		[[PDDokdo sharedInstance] refreshWeatherData];
		[self setText:[NSString stringWithFormat:@"%@", [[PDDokdo sharedInstance] currentConditions]]];
		return;
	} else if (!weatherConditionSwitch && weatherTemperatureSwitch) {
		[[PDDokdo sharedInstance] refreshWeatherData];
		[self setText:[NSString stringWithFormat:@"%@", [[PDDokdo sharedInstance] currentTemperature]]];
		return;
	} else if (weatherConditionSwitch && weatherTemperatureSwitch) {
		[[PDDokdo sharedInstance] refreshWeatherData];
		[self setText:[NSString stringWithFormat:@"%@ %@", [[PDDokdo sharedInstance] currentConditions], [[PDDokdo sharedInstance] currentTemperature]]];
		return;
	}

}

%end

%hook SBCoverSheetPrimarySlidingViewController // save current unlock time, also set isLocked to NO as no longer locked

- (void)viewDidDisappear:(BOOL)animated {

	%orig;

	if (!lastTimeUnlockedSwitch) return;

	if (!prefersLastTimeLockedSwitch && isLocked) {
		NSDateFormatter* timeformat = [[NSDateFormatter alloc] init];
		if (!lastTimeUnlockedDateSwitch) {
			if (lastTimeUnlockedAMPMSwitch && !lastTimeUnlocked24hSwitch && !lastTimeUnlockedSecondsSwitch)
				[timeformat setDateFormat:@"h:mm a"];
			else if (!lastTimeUnlockedAMPMSwitch && !lastTimeUnlocked24hSwitch && !lastTimeUnlockedSecondsSwitch)
				[timeformat setDateFormat:@"h:mm"];
			else if (!lastTimeUnlocked24hSwitch && lastTimeUnlockedSecondsSwitch)
				[timeformat setDateFormat:@"h:mm:ss"];
			else if (lastTimeUnlocked24hSwitch && !lastTimeUnlockedAMPMSwitch && !lastTimeUnlockedSecondsSwitch)
				[timeformat setDateFormat:@"HH:mm"];
			else if (lastTimeUnlocked24hSwitch && lastTimeUnlockedSecondsSwitch)
				[timeformat setDateFormat:@"HH:mm:ss"];
			else
				[timeformat setDateFormat:@"h:mm a"];
		} else if (lastTimeUnlockedDateSwitch) {
			if (lastTimeUnlockedAMPMSwitch && !lastTimeUnlocked24hSwitch && !lastTimeUnlockedSecondsSwitch)
				[timeformat setDateFormat:@"MMM d, h:mm a"];
			else if (!lastTimeUnlockedAMPMSwitch && !lastTimeUnlocked24hSwitch && !lastTimeUnlockedSecondsSwitch)
				[timeformat setDateFormat:@"MMM d, h:mm"];
			else if (!lastTimeUnlockedAMPMSwitch && lastTimeUnlocked24hSwitch && !lastTimeUnlockedSecondsSwitch)
				[timeformat setDateFormat:@"MMM d, HH:mm"];
			else if (lastTimeUnlockedAMPMSwitch && !lastTimeUnlocked24hSwitch && lastTimeUnlockedSecondsSwitch)
				[timeformat setDateFormat:@"MMM d, h:mm:ss a"];
			else if (!lastTimeUnlockedAMPMSwitch && lastTimeUnlocked24hSwitch && lastTimeUnlockedSecondsSwitch)
				[timeformat setDateFormat:@"MMM d, HH:mm:ss"];
			else
				[timeformat setDateFormat:@"h:mm a"];
		}
		currentTime = [timeformat stringFromDate:[NSDate date]];
		[preferences setObject:currentTime forKey:@"lastTimeUnlockedValue"];
		isLocked = NO;
	}

}

%end

%hook SBSleepWakeHardwareButtonInteraction // if user prefers to use last time locked

- (void)_performSleep {

	%orig;

	if (!lastTimeUnlockedSwitch) return;

	if (prefersLastTimeLockedSwitch) {
		NSDateFormatter* timeformat = [[NSDateFormatter alloc] init];
		if (!lastTimeUnlockedDateSwitch) {
			if (lastTimeUnlockedAMPMSwitch && !lastTimeUnlocked24hSwitch && !lastTimeUnlockedSecondsSwitch)
				[timeformat setDateFormat:@"h:mm a"];
			else if (!lastTimeUnlockedAMPMSwitch && !lastTimeUnlocked24hSwitch && !lastTimeUnlockedSecondsSwitch)
				[timeformat setDateFormat:@"h:mm"];
			else if (!lastTimeUnlocked24hSwitch && lastTimeUnlockedSecondsSwitch)
				[timeformat setDateFormat:@"h:mm:ss"];
			else if (lastTimeUnlocked24hSwitch && !lastTimeUnlockedAMPMSwitch && !lastTimeUnlockedSecondsSwitch)
				[timeformat setDateFormat:@"HH:mm"];
			else if (lastTimeUnlocked24hSwitch && lastTimeUnlockedSecondsSwitch)
				[timeformat setDateFormat:@"HH:mm:ss"];
			else
				[timeformat setDateFormat:@"h:mm a"];
		} else if (lastTimeUnlockedDateSwitch) {
			if (lastTimeUnlockedAMPMSwitch && !lastTimeUnlocked24hSwitch && !lastTimeUnlockedSecondsSwitch)
				[timeformat setDateFormat:@"MMM d, h:mm a"];
			else if (!lastTimeUnlockedAMPMSwitch && !lastTimeUnlocked24hSwitch && !lastTimeUnlockedSecondsSwitch)
				[timeformat setDateFormat:@"MMM d, h:mm"];
			else if (!lastTimeUnlockedAMPMSwitch && lastTimeUnlocked24hSwitch && !lastTimeUnlockedSecondsSwitch)
				[timeformat setDateFormat:@"MMM d, HH:mm"];
			else if (lastTimeUnlockedAMPMSwitch && !lastTimeUnlocked24hSwitch && lastTimeUnlockedSecondsSwitch)
				[timeformat setDateFormat:@"MMM d, h:mm:ss a"];
			else if (!lastTimeUnlockedAMPMSwitch && lastTimeUnlocked24hSwitch && lastTimeUnlockedSecondsSwitch)
				[timeformat setDateFormat:@"MMM d, HH:mm:ss"];
			else
				[timeformat setDateFormat:@"h:mm a"];
		}
		currentTime = [timeformat stringFromDate:[NSDate date]];
		[preferences setObject:currentTime forKey:@"lastTimeUnlockedValue"];
	}	

}

%end

%hook SBBacklightController // set a isLocked to YES as the display was just turned on

- (void)turnOnScreenFullyWithBacklightSource:(long long)source {

	%orig;

	if (source != 26) isLocked = YES;

}

%end

%end

// Media Player

%group DressMediaPlayer

%hook CSAdjunctItemView

- (void)didMoveToWindow {

	%orig;

	if (hideMediaPlayerSwitch)
		[self setHidden:YES];

	if (hideLockscreenPlayerBackgroundSwitch) {
		UIView* platterView = MSHookIvar<UIView *>(self, "_platterView");
		[[platterView backgroundMaterialView] setHidden:YES];
	}


}

- (void)setAlpha:(double)alpha {

	if ([mediaPlayerAlphaControl doubleValue] != 1.0)
		%orig([mediaPlayerAlphaControl doubleValue]);
	else
		%orig;

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

- (void)setPerformingGroupingAnimation:(BOOL)arg1 {

	if (notificationsScrollRevealSwitch)
		%orig(YES);
	else
		%orig;

}

%end

%hook NCNotificationListCell

- (void)setAlpha:(double)alpha {

	if ([notificationsAlphaControl doubleValue] != 1.0)
		%orig([notificationsAlphaControl doubleValue]);
	else
		%orig;

}

%end

// No Older Notifications Text

%hook NCNotificationListSectionRevealHintView

- (void)didMoveToWindow {

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

- (void)didMoveToWindow {

	%orig;

	if (hideNotificationCenterTextSwitch)
		[self setHidden:YES];
	else
		[self setHidden:NO];

	if  (![notificationCenterTextInput isEqual:@""])
		[self setTitle:notificationCenterTextInput];

}

%end

// Clear Notifications Button And Alpha For Header View

%hook NCNotificationListSectionHeaderView

- (void)didMoveToWindow {

	%orig;

	UIControl* clearButton = MSHookIvar<UIControl *>(self, "_clearButton");

	if (hideNotificationsClearButtonSwitch)
		[clearButton setHidden:YES];
	else
		[clearButton setHidden:NO];

}

- (void)setAlpha:(double)alpha {

	if (revealed && [notificationsHeaderViewAlphaControl doubleValue] != 1.0)
		%orig([notificationsHeaderViewAlphaControl doubleValue]);
	else
		%orig;

}

%end

// DND Banner

%hook DNDNotificationsService

- (void)_queue_postOrRemoveNotificationWithUpdatedBehavior:(BOOL)arg1 significantTimeChange:(BOOL)arg2 {

	if (hideDNDBannerSwitch)
		return;
	else
		%orig;

}

%end

%end

// Quick Actions

%group DressQuickActions

%hook CSQuickActionsView

- (void)didMoveToWindow {

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

- (CGFloat)_insetX {

	if (customQuickActionsXAxisSwitch)
		return [customQuickActionsXAxisValueControl doubleValue];
	else
		return %orig;
	
}

- (CGFloat)_insetY {

	if (customQuickActionsYAxisSwitch)
		return [customQuickActionsYAxisValueControl doubleValue];
	else
		return %orig;
	
}

%end

%hook CSQuickActionsButton

- (void)didMoveToWindow {

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

- (BOOL)_allowsCapabilityLockScreenTodayViewWithExplanation:(id*)arg1 {

    if (disableTodaySwipeSwitch)
		return NO;
	else
		return %orig;

}

- (BOOL)_allowsCapabilityTodayViewWithExplanation:(id*)arg1 {

    if (disableTodaySwipeSwitch)
		return NO;
	else
		return %orig;

}

- (BOOL)_allowsCapabilityLockScreenCameraSupportedWithExplanation:(id*)arg1 {

    if (disableCameraSwipeSwitch)
		return NO;
	else
		return %orig;

}

- (BOOL)_allowsCapabilityLockScreenCameraWithExplanation:(id*)arg1 {

    if (disableCameraSwipeSwitch)
		return NO;
	else
		return %orig;

}

%end

%hook CSQuickActionsViewController

- (BOOL)allowsCameraPress {

	if (disableOnlyCameraSwipeSwitch)
		return YES;

	return %orig;

}

%end

%hook UICoverSheetButton

- (void)clickInteractionDidClickUp:(id)arg1 {

	if ([self.localizedAccessoryTitle isEqualToString:@"Press for Camera"] && disableOnlyCameraSwipeSwitch) {
		dispatch_async(dispatch_get_main_queue(), ^{
			[[UIApplication sharedApplication] launchApplicationWithIdentifier:@"com.apple.camera" suspended:0];
			[[%c(SBLockScreenManager) sharedInstance] unlockUIFromSource:2 withOptions:nil];
		});
	}

	%orig;

}

%end

%end

%group DressOthers

// Custom Auto Lock Duration

%hook CSBehavior // iOS 13

- (void)setIdleTimerDuration:(long long)arg1 {

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

%hook SBDashBoardBehavior // iOS 12

- (void)setIdleTimerDuration:(long long)arg1 {

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

%hook CSCoverSheetViewController // Hide Charging View iOS 13

-(void)_transitionChargingViewToVisible:(BOOL)arg1 showBattery:(BOOL)arg2 animated:(BOOL)arg3 {

	if (disableBatteryViewSwitch)
		%orig(NO, NO, NO);
	else
		%orig;

}

%end

%hook SBDashBoardViewController // Hide Charging View iOS 12

- (void)_transitionChargingViewToVisible:(BOOL)arg1 showBattery:(BOOL)arg2 animated:(BOOL)arg3 {

	if (disableBatteryViewSwitch)
		%orig(NO, NO, NO);
	else
		%orig;

}

%end

%end

%ctor {

	preferences = [[HBPreferences alloc] initWithIdentifier:@"love.litten.dresspreferences"];
	preferencesDictionary = [NSDictionary dictionaryWithContentsOfFile: @"/var/mobile/Library/Preferences/love.litten.dresspreferences.plist"];

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
	[preferences registerBool:&enableColorFlowSupportSection default:nil forKey:@"EnableColorFlowSupportSection"];
	[preferences registerBool:&enableOthersSection default:nil forKey:@"EnableOthersSection"];

	// Time And Date
	if (enableTimeDateSection) {
		[preferences registerBool:&hideTimeAndDateSwitch default:NO forKey:@"hideTimeAndDate"];
		[preferences registerBool:&hideOnlyDateSwitch default:NO forKey:@"hideOnlyDate"];
		[preferences registerBool:&hideLunarCalendarSwitch default:NO forKey:@"hideLunarCalendar"];
		[preferences registerObject:&timeAndDateAlphaValue default:@"1.0" forKey:@"timeAndDateAlpha"];
		[preferences registerObject:&timeAndDateAlignmentControl default:@"1" forKey:@"timeAndDateAlignment"];
		[preferences registerBool:&customTimeFontSwitch default:NO forKey:@"customTimeFont"];
		[preferences registerObject:&fontNameTimeInput default:@"" forKey:@"fontNameTime"];
		[preferences registerObject:&fontSizeTimeControl default:@"80" forKey:@"fontSizeTime"];
		[preferences registerObject:&fontWeightTimeControl default:@"-0.4" forKey:@"fontWeightTime"];
		[preferences registerBool:&useRoundedFontTimeSwitch default:NO forKey:@"useRoundedFontTime"];
		[preferences registerBool:&useItalicFontTimeSwitch default:NO forKey:@"useItalicFontTime"];
		[preferences registerBool:&customDateFontSwitch default:NO forKey:@"customDateFont"];
		[preferences registerObject:&fontNameDateInput default:@"" forKey:@"fontNameDate"];
		[preferences registerObject:&fontSizeDateControl default:@"23" forKey:@"fontSizeDate"];
		[preferences registerObject:&fontWeightDateControl default:@"0.0" forKey:@"fontWeightDate"];
		[preferences registerBool:&useRoundedFontDateSwitch default:NO forKey:@"useRoundedFontDate"];
		[preferences registerBool:&useItalicFontDateSwitch default:NO forKey:@"useItalicFontDate"];
		[preferences registerBool:&customFontLunarSwitch default:YES forKey:@"customFontLunar"];
		[preferences registerBool:&useCompactDateFormatSwitch default:NO forKey:@"useCompactDateFormat"];
		[preferences registerBool:&colorTimeAndDateSwitch default:NO forKey:@"colorTimeAndDate"];
		[preferences registerObject:&timeColorValue default:@"ffffff" forKey:@"timeColor"];
		[preferences registerObject:&dateColorValue default:@"ffffff" forKey:@"dateColor"];
	}

	// FaceID Lock
	if (enableFaceIDLockSection) {
		[preferences registerBool:&hideFaceIDLockSwitch default:NO forKey:@"hideFaceIDLock"];
		[preferences registerBool:&hideFaceIDLockLabelSwitch default:NO forKey:@"hideFaceIDLockLabel"];
		[preferences registerObject:&faceIDLockAlphaValue default:@"1.0" forKey:@"faceIDLockAlpha"];
		[preferences registerBool:&customFaceIDAxisSwitch default:NO forKey:@"customFaceIDAxis"];
		[preferences registerObject:&faceIDXAxisControl default:@"176.0" forKey:@"faceIDXAxis"];
		[preferences registerObject:&faceIDYAxisControl default:@"0.0" forKey:@"faceIDYAxis"];
		[preferences registerObject:&customFaceIDSizeControl default:@"0.0" forKey:@"customFaceIDSize"];
		[preferences registerBool:&colorFaceIDLockSwitch default:NO forKey:@"colorFaceIDLock"];
		[preferences registerObject:&faceIDLockColorValue default:@"ffffff" forKey:@"faceIDLockColor"];
	}

	// Status Bar
	if (enableStatusBarSection) {
		[preferences registerBool:&hideStatusBarSwitch default:NO forKey:@"hideStatusBar"];
		[preferences registerObject:&statusBarAlphaControl default:@"1.0" forKey:@"statusBarAlpha"];
	}

	// Homebar
	if (enableHomebarSection) {
		[preferences registerBool:&hideHomebarSwitch default:NO forKey:@"hideHomebar"];
		[preferences registerObject:&homebarAlphaControl default:@"1.0" forKey:@"homebarAlpha"];
		[preferences registerBool:&colorHomebarSwitch default:NO forKey:@"colorHomebar"];
		[preferences registerObject:&homebarColorValue default:@"ffffff" forKey:@"homebarColor"];
	}

	// Page Dots
	if (enablePageDotsSection) {
		[preferences registerBool:&hidePageDotsSwitch default:NO forKey:@"hidePageDots"];
		[preferences registerObject:&pageDotsAlphaControl default:@"1.0" forKey:@"pageDotsAlpha"];
	}

	// Unlock Text, CC Grabber
	if (enableUnlockTextSection) {
		[preferences registerBool:&hideUnlockTextSwitch default:NO forKey:@"hideUnlockText"];
		[preferences registerObject:&unlockTextInput default:@"" forKey:@"unlockText"];
		[preferences registerBool:&hideCCGrabberSwitch default:NO forKey:@"hideCCGrabber"];
		[preferences registerObject:&ccGrabberAlphaControl default:@"1.0" forKey:@"ccGrabberAlpha"];
		[preferences registerBool:&lastTimeUnlockedSwitch default:NO forKey:@"lastTimeUnlocked"];
		[preferences registerBool:&prefersLastTimeLockedSwitch default:NO forKey:@"prefersLastTimeLocked"];
		[preferences registerBool:&lastTimeUnlocked24hSwitch default:NO forKey:@"lastTimeUnlocked24h"];
		[preferences registerBool:&lastTimeUnlockedAMPMSwitch default:NO forKey:@"lastTimeUnlockedAMPM"];
		[preferences registerBool:&lastTimeUnlockedDateSwitch default:NO forKey:@"lastTimeUnlockedDate"];
		[preferences registerBool:&lastTimeUnlockedOnlyTimeAndDateSwitch default:NO forKey:@"lastTimeUnlockedOnlyTimeAndDate"];
		[preferences registerBool:&lastTimeUnlockedSecondsSwitch default:NO forKey:@"lastTimeUnlockedSeconds"];
		[preferences registerBool:&ipAddressSwitch default:NO forKey:@"ipAddress"];
		[preferences registerBool:&weatherConditionSwitch default:NO forKey:@"weatherCondition"];
		[preferences registerBool:&weatherTemperatureSwitch default:NO forKey:@"weatherTemperature"];
		[preferences registerBool:&colorUnlockTextSwitch default:NO forKey:@"colorUnlockText"];
		[preferences registerObject:&unlockTextColorValue default:@"ffffff" forKey:@"unlockTextColor"];
	}

	// Media Player
	if (enableMediaPlayerSection) {
		[preferences registerBool:&hideMediaPlayerSwitch default:NO forKey:@"hideMediaPlayer"];
		[preferences registerBool:&hideLockscreenPlayerBackgroundSwitch default:NO forKey:@"hideLockscreenPlayerBackground"];
		[preferences registerObject:&mediaPlayerAlphaControl default:@"1.0" forKey:@"mediaPlayerAlpha"];
	}

	// Notifications
	if (enableNotificationsSection) {
		[preferences registerBool:&hideNoOlderNotificationsSwitch default:NO forKey:@"hideNoOlderNotifications"];
		[preferences registerBool:&hideNotificationCenterTextSwitch default:NO forKey:@"hideNotificationCenterText"];
		[preferences registerBool:&hideNotificationsClearButtonSwitch default:NO forKey:@"hideNotificationsClearButton"];
		[preferences registerObject:&noOlderNotificationsAlphaControl default:@"1.0" forKey:@"noOlderNotificationsAlpha"];
		[preferences registerObject:&notificationsAlphaControl default:@"1.0" forKey:@"notificationsAlpha"];
		[preferences registerObject:&notificationsHeaderViewAlphaControl default:@"1.0" forKey:@"notificationsHeaderViewAlpha"];
		[preferences registerObject:&noOlderNotificationsTextInput default:@"" forKey:@"noOlderNotificationsText"];
		[preferences registerObject:&noOlderNotificationsTextAlignmentControl default:@"1" forKey:@"noOlderNotificationsTextAlignment"];
		[preferences registerObject:&notificationCenterTextInput default:@"" forKey:@"notificationCenterText"];
		[preferences registerBool:&notificationsScrollRevealSwitch default:NO forKey:@"notificationsScrollReveal"];
		[preferences registerBool:&hideDNDBannerSwitch default:NO forKey:@"hideDNDBanner"];
	}

	// Quick Actions
	if (enableQuickActionsSection) {
		[preferences registerBool:&hideCameraQuickActionsButtonSwitch default:NO forKey:@"hideCameraQuickActionsButton"];
		[preferences registerBool:&hideFlashlightQuickActionsButtonSwitch default:NO forKey:@"hideFlashlightQuickActionsButton"];
		[preferences registerBool:&hideQuickActionsButtonBackgroundSwitch default:NO forKey:@"hideQuickActionsButtonBackground"];
		[preferences registerObject:&cameraQuickActionsButtonAlphaControl default:@"1.0" forKey:@"cameraQuickActionsButtonAlpha"];
		[preferences registerObject:&flashlightQuickActionsButtonAlphaControl default:@"1.0" forKey:@"flashlightQuickActionsButtonAlpha"];
		[preferences registerBool:&disableTodaySwipeSwitch default:NO forKey:@"disableTodaySwipe"];
		[preferences registerBool:&disableCameraSwipeSwitch default:NO forKey:@"disableCameraSwipe"];
		[preferences registerBool:&disableOnlyCameraSwipeSwitch default:NO forKey:@"disableOnlyCameraSwipe"];
		[preferences registerBool:&hideCameraQuickActionsButtonSwitch default:NO forKey:@"hideCameraQuickActionsButton"];
		[preferences registerBool:&customQuickActionsXAxisSwitch default:NO forKey:@"customQuickActionsXAxis"];
		[preferences registerBool:&customQuickActionsYAxisSwitch default:NO forKey:@"customQuickActionsYAxis"];
		[preferences registerObject:&customQuickActionsXAxisValueControl default:@"50.0" forKey:@"customQuickActionsXAxisValue"];
		[preferences registerObject:&customQuickActionsYAxisValueControl default:@"50.0" forKey:@"customQuickActionsYAxisValue"];
		[preferences registerBool:&colorQuickActionsSwitch default:NO forKey:@"colorQuickActions"];
		[preferences registerObject:&quickActionsColorValue default:@"ffffff" forKey:@"quickActionsColor"];
	}

	// Others
	if (enableOthersSection) {
		[preferences registerObject:&customLockDurationControl default:@"0" forKey:@"customLockDuration"];
		[preferences registerBool:&disableBatteryViewSwitch default:NO forKey:@"disableBatteryView"];
	}

	if (enabled) {
		BOOL timeAndDateTweaksCompatible = ![[NSFileManager defaultManager] fileExistsAtPath:@"/Library/MobileSubstrate/DynamicLibraries/Kalm.dylib"] && ![[NSFileManager defaultManager] fileExistsAtPath:@"/Library/MobileSubstrate/DynamicLibraries/Jellyfish.dylib"];
		BOOL faceIDLockTweaksCompatible = ![[NSFileManager defaultManager] fileExistsAtPath:@"/Library/MobileSubstrate/DynamicLibraries/Kalm.dylib"] && ![[NSFileManager defaultManager] fileExistsAtPath:@"/Library/MobileSubstrate/DynamicLibraries/Jellyfish.dylib"] && ![[NSFileManager defaultManager] fileExistsAtPath:@"/Library/MobileSubstrate/DynamicLibraries/LatchKey.dylib"];

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