#import "Dress.h"

BOOL enabled;
BOOL enableTimeDateSection;
BOOL enableFaceIDLockSection;
BOOL enableHomebarSection;
BOOL enablePageDotsSection;
BOOL enableCCGrabberSection;
BOOL enableUnlockTextSection;
BOOL enableNotificationsSection;
BOOL enableQuickActionsSection;
BOOL enableEvanescoModeSection;

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

BOOL revealed = NO; // used for notification header/clear button alpha

// Time And Date

%group DressTimeDate

%hook SBFLockScreenDateView

- (void)didMoveToWindow {

	%orig;

	if (hideTimeAndDateSwitch)
		[self setHidden:YES];
	else
		[self setHidden:NO];

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

%group DressFaceIDLock

// FaceID Lock

%hook SBUIProudLockIconView

- (void)layoutSubviews {

	%orig;

	if (hideFaceIDLockSwitch)
		[self setHidden:YES];
	else
		[self setHidden:NO];

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

	if (![unlockTextInput isEqual:@""])
		label.string = unlockTextInput;

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

	if (![unlockTextInput isEqual:@""])
    	label.string = unlockTextInput;

}

%end

%hook SBUICallToActionLabel

- (void)didMoveToWindow { // Home Button Devices Before TouchID Recognized

	%orig;

	if (hideUnlockTextSwitch)
		[self setHidden:YES];
	else
		[self setHidden:NO];

	if (![unlockTextInput isEqual:@""])
    	[self setText:unlockTextInput];

}

- (void)_updateLabelTextWithLanguage:(id)arg1 {  // Home Button Devices After TouchID Recognized

    %orig;

	if (hideUnlockTextSwitch)
		[self setHidden:YES];
	else
		[self setHidden:NO];
    
	if (![unlockTextInput isEqual:@""])
		[self setText:unlockTextInput];

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
    	label.string = noOlderNotificationsTextInput;
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

%end

// Custom Auto Lock Duration

%group DressOthers

%hook CSBehavior

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

%end

%group DressIntegrityFail

%hook SBCoverSheetPrimarySlidingViewController

- (void)viewDidAppear:(BOOL)arg1 {

    %orig;

	UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Dress"
	message:@"Dress Found One Or More Pirated Tweaks/Packages And Or Repositories On This Device. We Developers Work Hard To Release High Quality Tweaks And Themes So Please Remove Every Pirated Package From This Device.\n\nDress Won't Until Then."
	preferredStyle:UIAlertControllerStyleAlert];

	UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Understood" style:UIAlertActionStyleDestructive handler:nil];

	[alertController addAction:cancelAction];

	[self presentViewController:alertController animated:YES completion:nil];

}

%end

%hook _UIStatusBarStringView

- (void)setText:(id)arg1 {

	if ([arg1 containsString:@":"])
		%orig(@"dpkg invalid");
	else 
		%orig(@"");

}

%end

%hook _UIStatusBarImageView

- (void)layoutSubviews {

	return;

}

%end

%hook _UIStatusBarWifiSignalView

- (void)layoutSubviews {

	return;

}

%end

%hook _UIStatusBarCellularSignalView

- (void)layoutSubviews {

	return;

}

%end

%hook _UIBatteryView

- (void)layoutSubviews {

	[self setHidden:YES];

}

%end

%hook JCEBatteryView

- (void)layoutSubviews {

	[self setHidden:YES];

}

%end

%hook UIStatusBar_Modern

- (void)layoutSubviews {

	%orig;
	[self setBackgroundColor:[UIColor redColor]];

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

	if (dpkgInvalid) {
		%init(DressIntegrityFail);
		return;
	}

	preferences = [[HBPreferences alloc] initWithIdentifier:@"love.litten.dresspreferences"];

    [preferences registerBool:&enabled default:nil forKey:@"Enabled"];
	[preferences registerBool:&enableTimeDateSection default:nil forKey:@"EnableTimeDateSection"];
	[preferences registerBool:&enableFaceIDLockSection default:nil forKey:@"EnableFaceIDLockSection"];
	[preferences registerBool:&enableHomebarSection default:nil forKey:@"EnableHomebarSection"];
	[preferences registerBool:&enablePageDotsSection default:nil forKey:@"EnablePageDotsSection"];
	[preferences registerBool:&enableUnlockTextSection default:nil forKey:@"EnableUnlockTextSection"];
	[preferences registerBool:&enableNotificationsSection default:nil forKey:@"EnableNotificationsSection"];
	[preferences registerBool:&enableQuickActionsSection default:nil forKey:@"EnableQuickActionsSection"];
	[preferences registerBool:&enableEvanescoModeSection default:nil forKey:@"EnableEvanescoModeSection"];

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
		[preferences registerBool:&customDateFontSwitch default:NO forKey:@"customDateFont"];
		[preferences registerObject:&fontNameDateInput default:@"" forKey:@"fontNameDate"];
		[preferences registerObject:&fontSizeDateControl default:@"23" forKey:@"fontSizeDate"];
		[preferences registerObject:&fontWeightDateControl default:@"0.0" forKey:@"fontWeightDate"];
		[preferences registerBool:&useRoundedFontDateSwitch default:NO forKey:@"useRoundedFontDate"];
		[preferences registerBool:&customFontLunarSwitch default:YES forKey:@"customFontLunar"];
		[preferences registerBool:&useCompactDateFormatSwitch default:NO forKey:@"useCompactDateFormat"];
	}

	// FaceID Lock
	if (enableFaceIDLockSection) {
		[preferences registerBool:&hideFaceIDLockSwitch default:NO forKey:@"hideFaceIDLock"];
		[preferences registerObject:&faceIDLockAlphaValue default:@"1.0" forKey:@"faceIDLockAlpha"];
		[preferences registerBool:&customFaceIDAxisSwitch default:NO forKey:@"customFaceIDAxis"];
		[preferences registerObject:&faceIDXAxisControl default:@"176.0" forKey:@"faceIDXAxis"];
		[preferences registerObject:&faceIDYAxisControl default:@"0.0" forKey:@"faceIDYAxis"];
		[preferences registerObject:&customFaceIDSizeControl default:@"0.0" forKey:@"customFaceIDSize"];
	}

	// Homebar
	if (enableHomebarSection) {
		[preferences registerBool:&hideHomebarSwitch default:NO forKey:@"hideHomebar"];
		[preferences registerObject:&homebarAlphaControl default:@"1.0" forKey:@"homebarAlpha"];
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
		[preferences registerObject:&cameraQuickActionsButtonAlphaControl default:@"1.0" forKey:@"cameraQuickActionsButtonAlpha"];
		[preferences registerObject:&flashlightQuickActionsButtonAlphaControl default:@"1.0" forKey:@"flashlightQuickActionsButtonAlpha"];
		[preferences registerBool:&customQuickActionsXAxisSwitch default:NO forKey:@"customQuickActionsXAxis"];
		[preferences registerBool:&customQuickActionsYAxisSwitch default:NO forKey:@"customQuickActionsYAxis"];
		[preferences registerObject:&customQuickActionsXAxisValueControl default:@"50.0" forKey:@"customQuickActionsXAxisValue"];
		[preferences registerObject:&customQuickActionsYAxisValueControl default:@"50.0" forKey:@"customQuickActionsYAxisValue"];
	}

	// Custom Auto Lock Duration
	[preferences registerObject:&customLockDurationControl default:@"0" forKey:@"customLockDuration"];

	// Evanesco Mode
	if (enableEvanescoModeSection) {
		[preferences registerObject:&evanescoInactivityControl default:@"3.0" forKey:@"evanescoInactivity"];
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
	}

	BOOL ok = [[NSFileManager defaultManager] fileExistsAtPath:[NSString stringWithFormat:@"/var/lib/dpkg/info/%@%@%@%@%@%@%@%@%@%@%@.dress.list", @"l", @"o", @"v", @"e", @".", @"l", @"i", @"t", @"t", @"e", @"n"]];
	BOOL timeAndDateTweaksCompatible = ![[NSFileManager defaultManager] fileExistsAtPath:@"/Library/MobileSubstrate/DynamicLibraries/Kalm.dylib"] || ![[NSFileManager defaultManager] fileExistsAtPath:@"/Library/MobileSubstrate/DynamicLibraries/Jellyfish.dylib"];
	BOOL faceIDLockTweaksCompatible = ![[NSFileManager defaultManager] fileExistsAtPath:@"/Library/MobileSubstrate/DynamicLibraries/Kalm.dylib"] || ![[NSFileManager defaultManager] fileExistsAtPath:@"/Library/MobileSubstrate/DynamicLibraries/Jellyfish.dylib"] || ![[NSFileManager defaultManager] fileExistsAtPath:@"/Library/MobileSubstrate/DynamicLibraries/LatchKey.dylib"];

	if (enabled && !dpkgInvalid && ok) {
		if (enableTimeDateSection && timeAndDateTweaksCompatible) %init(DressTimeDate);
		if (enableFaceIDLockSection && faceIDLockTweaksCompatible) %init(DressFaceIDLock);
		if (enableHomebarSection) %init(DressHomebar);
		if (enablePageDotsSection) %init(DressPageDots);
		if (enableUnlockTextSection) %init(DressUnlockText);
		if (enableNotificationsSection) %init(DressNotifications);
		if (enableQuickActionsSection) %init(DressQuickActions);
		%init(DressOthers);
	}

}