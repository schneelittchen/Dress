#import "../Dress.h"

BOOL enabled;
BOOL enableColorFlowSupportSection;

BOOL dpkgInvalid = NO;

// Time And Date

%group ColorFlowTimeAndDate

%hook SBFLockScreenDateView

- (id)initWithFrame:(CGRect)frame { // add notification observer

	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveColorNotification:) name:@"ColorFlowLockScreenColorReversionNotification" object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveColorNotification:) name:@"ColorFlowLockScreenColorizationNotification" object:nil];

	return %orig;

}

%new
- (void)receiveColorNotification:(NSNotification *)notification {

	if ([notification.name isEqual:@"ColorFlowLockScreenColorizationNotification"]) {
		NSDictionary* userInfo = [notification userInfo];
		UIColor* primaryColor = userInfo[@"PrimaryColor"];
		UIColor *secondaryColor = userInfo[@"SecondaryColor"];
		[self setTextColor:primaryColor];
		UIView* subtitleView = MSHookIvar<UIView *>(self, "_dateSubtitleView");
		SBUILegibilityLabel* label = MSHookIvar<SBUILegibilityLabel *>(subtitleView, "_label");
		[label setTextColor:secondaryColor];
	} else if ([notification.name isEqual:@"ColorFlowLockScreenColorReversionNotification"]) {
		[self setTextColor:[UIColor whiteColor]];
		UIView* subtitleView = MSHookIvar<UIView *>(self, "_dateSubtitleView");
		SBUILegibilityLabel* label = MSHookIvar<SBUILegibilityLabel *>(subtitleView, "_label");
		[label setTextColor:[UIColor whiteColor]];
	}

}

- (void)dealloc { // remove observer
	
	[[NSNotificationCenter defaultCenter] removeObserver:self];
    
	%orig;

}

%end

%end

// FaceID Lock

%group ColorFlowFaceIDLock

%hook SBUIProudLockIconView

- (id)initWithFrame:(CGRect)frame { // add notification observer

	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveColorNotification:) name:@"ColorFlowLockScreenColorReversionNotification" object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveColorNotification:) name:@"ColorFlowLockScreenColorizationNotification" object:nil];

	return %orig;

}

%new
- (void)receiveColorNotification:(NSNotification *)notification {

	if ([notification.name isEqual:@"ColorFlowLockScreenColorizationNotification"]) {
		NSDictionary* userInfo = [notification userInfo];
		UIColor *secondaryColor = userInfo[@"SecondaryColor"];
		[self setContentColor:secondaryColor];
	} else if ([notification.name isEqual:@"ColorFlowLockScreenColorReversionNotification"]) {
		[self setContentColor:[UIColor whiteColor]];
	}

}

- (void)dealloc { // remove observer
	
	[[NSNotificationCenter defaultCenter] removeObserver:self];
    
	%orig;

}

%end

%end

// Status Bar

// todo

// Homebar

%group ColorFlowHomebar

%hook MTStaticColorPillView

- (id)initWithFrame:(CGRect)frame settings:(id)arg2 { // add notification observer

	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveColorNotification:) name:@"ColorFlowLockScreenColorReversionNotification" object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveColorNotification:) name:@"ColorFlowLockScreenColorizationNotification" object:nil];

	return %orig;

}

%new
- (void)receiveColorNotification:(NSNotification *)notification {

	if ([notification.name isEqual:@"ColorFlowLockScreenColorizationNotification"]) {
		NSDictionary* userInfo = [notification userInfo];
		UIColor *secondaryColor = userInfo[@"SecondaryColor"];
		[self setPillColor:secondaryColor];
	} else if ([notification.name isEqual:@"ColorFlowLockScreenColorReversionNotification"]) {
		[self setPillColor:[UIColor whiteColor]];
	}

}

- (void)dealloc { // remove observer
	
	[[NSNotificationCenter defaultCenter] removeObserver:self];
    
	%orig;

}

%end

%end

// Page Dots

%group ColorFlowPageDots

%hook CSPageControl // iOS 13

- (id)initWithFrame:(CGRect)frame { // add notification observer

	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveColorNotification:) name:@"ColorFlowLockScreenColorReversionNotification" object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveColorNotification:) name:@"ColorFlowLockScreenColorizationNotification" object:nil];

	return %orig;

}

%new
- (void)receiveColorNotification:(NSNotification *)notification {

	if ([notification.name isEqual:@"ColorFlowLockScreenColorizationNotification"]) {
		NSDictionary* userInfo = [notification userInfo];
		UIColor* primaryColor = userInfo[@"PrimaryColor"];
		// please make this better
		NSMutableArray* pageDots = MSHookIvar<NSMutableArray *>(self, "_indicators");
		for (int i = pageDots.count - 1; i > -1; i--) {
			UIView* view = pageDots[i];
			for (UIImageView* imageView in view.subviews) {
				imageView.image = [imageView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
				if ([imageView isKindOfClass:%c(_UILegibilityImageView)]) {
					[imageView setTintColor:primaryColor];
				}
			}
		}
	} else if ([notification.name isEqual:@"ColorFlowLockScreenColorReversionNotification"]) {
		// please make this better
		NSMutableArray* pageDots = MSHookIvar<NSMutableArray *>(self, "_indicators");
		for (int i = pageDots.count - 1; i > -1; i--) {
			UIView* view = pageDots[i];
			for (UIImageView* imageView in view.subviews) {
				imageView.image = [imageView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
				if ([imageView isKindOfClass:%c(_UILegibilityImageView)]) {
					[imageView setTintColor:[UIColor whiteColor]];
				}
			}
		}
	}

}

- (void)dealloc { // remove observer
	
	[[NSNotificationCenter defaultCenter] removeObserver:self];
    
	%orig;

}

%end

%hook SBDashBoardPageControl // iOS 12

- (id)initWithFrame:(CGRect)frame { // add notification observer

	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveColorNotification:) name:@"ColorFlowLockScreenColorReversionNotification" object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveColorNotification:) name:@"ColorFlowLockScreenColorizationNotification" object:nil];

	return %orig;

}

%new
- (void)receiveColorNotification:(NSNotification *)notification {

	if ([notification.name isEqual:@"ColorFlowLockScreenColorizationNotification"]) {
		NSDictionary* userInfo = [notification userInfo];
		UIColor* primaryColor = userInfo[@"PrimaryColor"];
		// please make this better
		NSMutableArray* pageDots = MSHookIvar<NSMutableArray *>(self, "_indicators");
		for (int i = pageDots.count - 1; i > -1; i--) {
			UIView* view = pageDots[i];
			for (UIImageView* imageView in view.subviews) {
				imageView.image = [imageView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
				if ([imageView isKindOfClass:%c(_UILegibilityImageView)]) {
					[imageView setTintColor:primaryColor];
				}
			}
		}
	} else if ([notification.name isEqual:@"ColorFlowLockScreenColorReversionNotification"]) {
		// please make this better
		NSMutableArray* pageDots = MSHookIvar<NSMutableArray *>(self, "_indicators");
		for (int i = pageDots.count - 1; i > -1; i--) {
			UIView* view = pageDots[i];
			for (UIImageView* imageView in view.subviews) {
				imageView.image = [imageView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
				if ([imageView isKindOfClass:%c(_UILegibilityImageView)]) {
					[imageView setTintColor:[UIColor whiteColor]];
				}
			}
		}
	}

}

- (void)dealloc { // remove observer
	
	[[NSNotificationCenter defaultCenter] removeObserver:self];
    
	%orig;

}

%end

%end

// Unlock Text

%group ColorFlowUnlockText

%hook CSTeachableMomentsContainerView // iX iOS 13

- (id)initWithFrame:(CGRect)frame { // add notification observer

	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveColorNotification:) name:@"ColorFlowLockScreenColorReversionNotification" object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveColorNotification:) name:@"ColorFlowLockScreenColorizationNotification" object:nil];

	return %orig;

}

%new
- (void)receiveColorNotification:(NSNotification *)notification {

	if ([notification.name isEqual:@"ColorFlowLockScreenColorizationNotification"]) {
		NSDictionary* userInfo = [notification userInfo];
		UIColor* primaryColor = userInfo[@"PrimaryColor"];
		SBUILegibilityLabel* label = MSHookIvar<SBUILegibilityLabel *>(self, "_callToActionLabel");
		[label setTextColor:primaryColor];
	} else if ([notification.name isEqual:@"ColorFlowLockScreenColorReversionNotification"]) {
		SBUILegibilityLabel* label = MSHookIvar<SBUILegibilityLabel *>(self, "_callToActionLabel");
		[label setTextColor:[UIColor whiteColor]];
	}

}

- (void)dealloc { // remove observer
	
	[[NSNotificationCenter defaultCenter] removeObserver:self];
    
	%orig;

}

%end

%hook SBDashBoardTeachableMomentsContainerView // iX iOS 12

- (id)initWithFrame:(CGRect)frame { // add notification observer

	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveColorNotification:) name:@"ColorFlowLockScreenColorReversionNotification" object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveColorNotification:) name:@"ColorFlowLockScreenColorizationNotification" object:nil];

	return %orig;

}

%new
- (void)receiveColorNotification:(NSNotification *)notification {

	if ([notification.name isEqual:@"ColorFlowLockScreenColorizationNotification"]) {
		NSDictionary* userInfo = [notification userInfo];
		UIColor* primaryColor = userInfo[@"PrimaryColor"];
		SBUILegibilityLabel* label = MSHookIvar<SBUILegibilityLabel *>(self, "_callToActionLabel");
		[label setTextColor:primaryColor];
	} else if ([notification.name isEqual:@"ColorFlowLockScreenColorReversionNotification"]) {
		SBUILegibilityLabel* label = MSHookIvar<SBUILegibilityLabel *>(self, "_callToActionLabel");
		[label setTextColor:[UIColor whiteColor]];
	}

}

- (void)dealloc { // remove observer
	
	[[NSNotificationCenter defaultCenter] removeObserver:self];
    
	%orig;

}

%end

%hook SBUICallToActionLabel // home button devices

- (id)initWithFrame:(CGRect)frame { // add notification observer

	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveColorNotification:) name:@"ColorFlowLockScreenColorReversionNotification" object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveColorNotification:) name:@"ColorFlowLockScreenColorizationNotification" object:nil];

	return %orig;

}

%new
- (void)receiveColorNotification:(NSNotification *)notification {

	if ([notification.name isEqual:@"ColorFlowLockScreenColorizationNotification"]) {
		NSDictionary* userInfo = [notification userInfo];
		UIColor* primaryColor = userInfo[@"PrimaryColor"];
		SBUILegibilityLabel* label = MSHookIvar<SBUILegibilityLabel *>(self, "_label");
		[label setTextColor:primaryColor];
	} else if ([notification.name isEqual:@"ColorFlowLockScreenColorReversionNotification"]) {
		SBUILegibilityLabel* label = MSHookIvar<SBUILegibilityLabel *>(self, "_label");
		[label setTextColor:[UIColor whiteColor]];
	}

}

- (void)dealloc { // remove observer
	
	[[NSNotificationCenter defaultCenter] removeObserver:self];
    
	%orig;

}

%end

%end

// Quick Actions

%group ColorFlowQuickActions

%hook CSQuickActionsButton

- (id)initWithFrame:(CGRect)frame { // add notification observer

	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveColorNotification:) name:@"ColorFlowLockScreenColorReversionNotification" object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveColorNotification:) name:@"ColorFlowLockScreenColorizationNotification" object:nil];

	return %orig;

}

%new
- (void)receiveColorNotification:(NSNotification *)notification {

	if ([notification.name isEqual:@"ColorFlowLockScreenColorizationNotification"]) {
		NSDictionary* userInfo = [notification userInfo];
		UIColor *secondaryColor = userInfo[@"SecondaryColor"];
		[self setTintColor:secondaryColor];
	} else if ([notification.name isEqual:@"ColorFlowLockScreenColorReversionNotification"]) {
		[self setTintColor:[UIColor whiteColor]];
	}

}

- (void)dealloc { // remove observer
	
	[[NSNotificationCenter defaultCenter] removeObserver:self];
    
	%orig;

}

%end

%end

%group DressColorFlow

%hook SBUILegibilityLabel // needed to change SBUILegibilityLabel colors

- (BOOL)_needsColorImage {

	return YES;

}

%end

%end

%ctor {

	if (![[NSFileManager defaultManager] fileExistsAtPath:@"/Library/MobileSubstrate/DynamicLibraries/ColorFlow5.dylib"] && ![[NSFileManager defaultManager] fileExistsAtPath:@"/Library/MobileSubstrate/DynamicLibraries/ColorFlow4.dylib"]) return;

	dpkgInvalid = ![[NSFileManager defaultManager] fileExistsAtPath:@"/var/lib/dpkg/info/love.litten.dress.list"];

    if (!dpkgInvalid) dpkgInvalid = ![[NSFileManager defaultManager] fileExistsAtPath:@"/var/lib/dpkg/info/love.litten.dress.md5sums"];

    if (dpkgInvalid) return;

	preferences = [[HBPreferences alloc] initWithIdentifier:@"love.litten.dresspreferences"];

	[preferences registerBool:&enabled default:nil forKey:@"Enabled"];
	[preferences registerBool:&enableColorFlowSupportSection default:nil forKey:@"EnableColorFlowSupportSection"];

	// ColorFlow Support
	if (enableColorFlowSupportSection) {
        [preferences registerBool:&timeDateColorFlowSwitch default:NO forKey:@"timeDateColorFlow"];
		[preferences registerBool:&faceIDLockColorFlowSwitch default:NO forKey:@"faceIDLockColorFlow"];
        [preferences registerBool:&homebarColorFlowSwitch default:NO forKey:@"homebarColorFlow"];
		[preferences registerBool:&pageDotsColorFlowSwitch default:NO forKey:@"pageDotsColorFlow"];
		[preferences registerBool:&unlockTextColorFlowSwitch default:NO forKey:@"unlockTextColorFlow"];
		[preferences registerBool:&quickActionsColorFlowSwitch default:NO forKey:@"quickActionsColorFlow"];
	}

	if (!dpkgInvalid && enabled) {
        BOOL ok = false;
        
        ok = ([[NSFileManager defaultManager] fileExistsAtPath:[NSString stringWithFormat:@"/var/lib/dpkg/info/%@%@%@%@%@%@%@%@%@%@%@.dress.md5sums", @"l", @"o", @"v", @"e", @".", @"l", @"i", @"t", @"t", @"e", @"n"]]
        );

        if (enableColorFlowSupportSection && ok && [@"litten" isEqualToString:@"litten"]) {
			if (timeDateColorFlowSwitch) %init(ColorFlowTimeAndDate);
            if (faceIDLockColorFlowSwitch) %init(ColorFlowFaceIDLock);
			// %init(ColorFlowStatusBar);
			if (homebarColorFlowSwitch) %init(ColorFlowHomebar);
			if (pageDotsColorFlowSwitch) %init(ColorFlowPageDots);
            if (unlockTextColorFlowSwitch) %init(ColorFlowUnlockText);
			if (quickActionsColorFlowSwitch) %init(ColorFlowQuickActions);
			%init(DressColorFlow);
            return;
        } else {
            dpkgInvalid = YES;
        }
    }

}