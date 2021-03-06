#import "SparkColourPickerUtils.h"
#import <Cephei/HBPreferences.h>

HBPreferences* preferences = nil;
NSDictionary* preferencesDictionary = nil;

BOOL enabled = NO;
BOOL enableTimeDateSection = NO;
BOOL enableFaceIDLockSection = NO;
BOOL enableStatusBarSection = NO;
BOOL enableHomebarSection = NO;
BOOL enablePageDotsSection = NO;
BOOL enableUnlockTextSection = NO;
BOOL enableMediaPlayerSection = NO;
BOOL enableNotificationsSection = NO;
BOOL enableQuickActionsSection = NO;
BOOL enableOthersSection = NO;

BOOL isLocked = YES;
BOOL revealed = NO;

// time and date
BOOL hideTimeAndDateSwitch = NO;
BOOL hideOnlyDateSwitch = NO;
BOOL hideLunarCalendarSwitch = NO;
NSString* timeAndDateAlphaValue = @"1.0";
BOOL customTimeAndDatePositioningSwitch = NO;
NSString* customTimeAndDateXAxisValue = @"0.0";
NSString* customTimeAndDateYAxisValue = @"0.0";
NSString* timeAndDateAlignmentControl = @"1";
BOOL customTimeFontSwitch = NO;
BOOL useCustomChosenTimeFontSwitch = NO;
NSString* fontSizeTimeControl = @"80";
NSString* fontWeightTimeControl = @"0";
BOOL useRoundedFontTimeSwitch = NO;
BOOL useItalicFontTimeSwitch = NO;
BOOL customDateFontSwitch = NO;
BOOL useCustomChosenDateFontSwitch = NO;
NSString* fontSizeDateControl = @"80";
NSString* fontWeightDateControl = @"0";
BOOL useRoundedFontDateSwitch = NO;
BOOL useItalicFontDateSwitch = NO;
BOOL customFontLunarSwitch = NO;
BOOL useCompactDateFormatSwitch = NO;
BOOL colorTimeAndDateSwitch = NO;

// faceID lock
BOOL hideFaceIDLockSwitch = NO;
BOOL hideFaceIDLockLabelSwitch = NO;
NSString* faceIDLockAlphaValue = @"1.0";
BOOL customFaceIDAxisSwitch = NO;
NSString* faceIDXAxisControl = @"176.0";
NSString* faceIDYAxisControl = @"0.0";
NSString* customFaceIDSizeControl = @"0.0";
BOOL colorFaceIDLockSwitch = NO;

// status bar
BOOL hideStatusBarSwitch = NO;
NSString* statusBarAlphaControl = @"1.0";

// homebar
BOOL hideHomebarSwitch = NO;
NSString* homebarAlphaControl = @"1.0";
BOOL colorHomebarSwitch = NO;

// page dots
BOOL hidePageDotsSwitch = NO;
NSString* pageDotsAlphaControl = @"1.0";

// cc grabber
BOOL hideCCGrabberSwitch = NO;
NSString* ccGrabberAlphaControl = @"1.0";

// unlock text
BOOL hideUnlockTextSwitch = NO;
NSString* unlockTextInput = @"";
NSString* currentTime;
BOOL lastTimeUnlockedSwitch = NO;
BOOL prefersLastTimeLockedSwitch = NO;
NSString* lastTimeUnlockedFormatValue = @"HH:mm";
BOOL colorUnlockTextSwitch = NO;

// media player
BOOL hideMediaPlayerSwitch = NO;
NSString* mediaPlayerAlphaControl = @"1.0";
BOOL hideLockscreenPlayerBackgroundSwitch = NO;

// notifications
BOOL hideNoOlderNotificationsSwitch = NO;
BOOL hideNotificationCenterTextSwitch = NO;
BOOL hideNotificationsClearButtonSwitch = NO;
NSString* noOlderNotificationsAlphaControl = @"1.0";
NSString* notificationsAlphaControl = @"1.0";
NSString* notificationsHeaderViewAlphaControl = @"1.0";
NSString* notificationOffsetValue = @"0.0";
NSString* noOlderNotificationsTextInput = @"";
NSString* noOlderNotificationsTextAlignmentControl = @"1";
NSString* notificationCenterTextInput = @"";
BOOL notificationsScrollRevealSwitch = NO;
BOOL hideDNDBannerSwitch = NO;

// quick actions
BOOL hideCameraQuickActionsButtonSwitch = NO;
BOOL hideFlashlightQuickActionsButtonSwitch = NO;
BOOL hideQuickActionsButtonBackgroundSwitch = NO;
NSString* cameraQuickActionsButtonAlphaControl = @"1.0";
NSString* flashlightQuickActionsButtonAlphaControl = @"1.0";
BOOL disableTodaySwipeSwitch = NO;
BOOL disableCameraSwipeSwitch = NO;
BOOL customQuickActionsXAxisSwitch = NO;
BOOL customQuickActionsYAxisSwitch = NO;
NSString* customQuickActionsXAxisValueControl = @"50.0";
NSString* customQuickActionsYAxisValueControl = @"50.0";
BOOL colorQuickActionsSwitch = NO;

//others
NSString* customLockDurationControl = @"0";
BOOL disableBatteryViewSwitch = NO;
BOOL hideFaceIDAnimationSwitch = NO;

@interface SBFLockScreenDateView : UIView
@property(nonatomic, retain)UIColor* textColor;
@end

@interface SBFLockScreenDateSubtitleDateView : UIView
@end

@interface SBFLockScreenAlternateDateLabel : UIView
@end

@interface SBUIProudLockIconView : UIView
@end

@interface UIMorphingLabel : UIView
- (id)_viewControllerForAncestor;
@end

@interface _UIStatusBar : UIView
@end

@interface UIStatusBar_Modern : UIView
- (_UIStatusBar *)statusBar;
@end

@interface CSHomeAffordanceView : UIView
@end

@interface CSPageControl : UIPageControl
@end

@interface CSTeachableMomentsContainerView : UIView
@property(nonatomic, strong, readwrite)UIView* controlCenterGrabberContainerView;
@end

@interface SBUICallToActionLabel : UIView
@property(nonatomic, copy, readwrite)NSString* text;
@end

@interface CSAdjunctItemView : UIView
@end

@interface MTMaterialView : UIView
@end

@interface UIView (Dress)
@property(nonatomic, assign, readwrite)MTMaterialView* backgroundMaterialView;
@end

@interface NCNotificationListHeaderTitleView : UIView
@property(nonatomic, copy, readwrite)NSString* title;
@end

@interface SBUILegibilityLabel : UIView
@property(nonatomic, assign, readwrite)NSString* string;
@property(assign,nonatomic) long long textAlignment;
@property(nonatomic, assign, readwrite)UIColor* textColor;
@end

@interface UICoverSheetButton : UIControl
@end

@interface CSQuickActionsButton : UICoverSheetButton
@end