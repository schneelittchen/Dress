#import <UIKit/UIKit.h>
#import <Cephei/HBPreferences.h>

// Preferences
HBPreferences* preferences;

// Enabled Switch - Extern Because It's Used In The RootListController
extern BOOL enabled;
extern BOOL enableTimeDateSection;
extern BOOL enableFaceIDLockSection;
extern BOOL enableHomebarSection;
extern BOOL enablePageDotsSection;
extern BOOL enableUnlockTextSection;
extern BOOL enableNotificationsSection;
extern BOOL enableQuickActionsSection;
extern BOOL enableEvanescoModeSection;

// Time And Date
BOOL hideTimeAndDateSwitch = NO;
BOOL hideOnlyDateSwitch = NO;
BOOL hideLunarCalendarSwitch = NO;
NSString* timeAndDateAlphaValue = @"1.0";
NSString* timeAndDateAlignmentControl = @"1";
BOOL customTimeFontSwitch = NO;
NSString* fontNameTimeInput = @"";
NSString* fontSizeTimeControl = @"80";
NSString* fontWeightTimeControl = @"0";
BOOL useRoundedFontTimeSwitch = NO;
BOOL customDateFontSwitch = NO;
NSString* fontNameDateInput = @"";
NSString* fontSizeDateControl = @"80";
NSString* fontWeightDateControl = @"0";
BOOL useRoundedFontDateSwitch = NO;
BOOL customFontLunarSwitch = NO;
BOOL useCompactDateFormatSwitch = NO;

// FaceID Lock
BOOL hideFaceIDLockSwitch = NO;
NSString* faceIDLockAlphaValue = @"1.0";
BOOL customFaceIDAxisSwitch = NO;
NSString* faceIDXAxisControl = @"176.0";
NSString* faceIDYAxisControl = @"0.0";
NSString* customFaceIDSizeControl = @"0.0";

// Homebar
BOOL hideHomebarSwitch = NO;
NSString* homebarAlphaControl = @"1.0";

// Page Dots
BOOL hidePageDotsSwitch = NO;
NSString* pageDotsAlphaControl = @"1.0";

// CC Grabber
BOOL hideCCGrabberSwitch = NO;
NSString* ccGrabberAlphaControl = @"1.0";

// Unlock Text
BOOL hideUnlockTextSwitch = NO;
NSString* unlockTextInput = @"";

// Notifications
BOOL hideNoOlderNotificationsSwitch = NO;
BOOL hideNotificationCenterTextSwitch = NO;
BOOL hideNotificationsClearButtonSwitch = NO;
NSString* noOlderNotificationsAlphaControl = @"1.0";
NSString* notificationsAlphaControl = @"1.0";
NSString* notificationsHeaderViewAlphaControl = @"1.0";
NSString* noOlderNotificationsTextInput = @"";
NSString* noOlderNotificationsTextAlignmentControl = @"1";
NSString* notificationCenterTextInput = @"";
BOOL notificationsScrollRevealSwitch = NO;
BOOL hideDNDBannerSwitch = NO;

// Quick Actions
BOOL hideCameraQuickActionsButtonSwitch = NO;
BOOL hideFlashlightQuickActionsButtonSwitch = NO;
NSString* cameraQuickActionsButtonAlphaControl = @"1.0";
NSString* flashlightQuickActionsButtonAlphaControl = @"1.0";
BOOL customQuickActionsXAxisSwitch = NO;
BOOL customQuickActionsYAxisSwitch = NO;
NSString* customQuickActionsXAxisValueControl = @"50.0";
NSString* customQuickActionsYAxisValueControl = @"50.0";

NSString* customLockDurationControl = @"0";

// Evanesco Mode
extern NSString* evanescoInactivityControl;
extern NSString* evanescoFadeDurationControl;
extern NSString* evanescoFadeAlphaControl;
extern BOOL timeDateEvanescoSwitch;
extern BOOL faceIDLockEvanescoSwitch;
extern BOOL homebarEvanescoSwitch;
extern BOOL pageDotsEvanescoSwitch;
extern BOOL notificationCellsEvanescoSwitch;
extern BOOL notificationHintViewEvanescoSwitch;
extern BOOL notificationHeaderViewEvanescoSwitch;
extern BOOL unlockTextEvanescoSwitch;
extern BOOL quickActionsEvanescoSwitch;

// Time And Date
@interface SBFLockScreenDateView : UIView
@end

@interface SBFLockScreenDateSubtitleDateView : UIView
@end

// Lunar Label
@interface SBFLockScreenAlternateDateLabel : UIView
@end

// FaceID Lock
@interface SBUIProudLockIconView : UIView
@end

// Homebar
@interface CSHomeAffordanceView : UIView
@end

// Page Dots
@interface CSPageControl : UIPageControl
@end

@interface SBDashBoardPageControl : UIPageControl
@end

// Unlock Text
@interface CSTeachableMomentsContainerView : UIView
@property(nonatomic, strong, readwrite)UIView* controlCenterGrabberContainerView;
@end

@interface SBUICallToActionLabel : NSObject
@property(nonatomic, assign, readwrite)BOOL hidden;
@property(nonatomic, assign, readwrite)CGFloat alpha;
@property(nonatomic, copy, readwrite)NSString* text;
@end

// Notifications
@interface NCNotificationListView : UIScrollView
- (void)sendFadeNotification;
@end

@interface NCNotificationListCell : UIView
@end

@interface NCNotificationListSectionHeaderView : UIView
@end

// No Older Notifications Text
@interface NCNotificationListSectionRevealHintView : UIView
@end

@interface SBUILegibilityLabel : UIView
@property(nonatomic, assign, readwrite)NSString* string;
@property (assign,nonatomic) long long textAlignment;
@end


// Notification Center Text
@interface NCNotificationListHeaderTitleView : UIView
@property(nonatomic, copy, readwrite)NSString* title;
@end

// Quick Actions
@interface CSQuickActionsView : UIView
@end

@interface UICoverSheetButton : UIControl
@end

@interface CSQuickActionsButton : UICoverSheetButton
@end

// Something Additional For Evanesco Mode
@interface SBLockScreenManager : NSObject
+ (id)sharedInstance;
- (BOOL)isLockScreenActive;
@end

@interface SBCoverSheetPrimarySlidingViewController : UIViewController
@end

@interface UIStatusBar_Base : UIView
@end

@interface UIStatusBar_Modern : UIView
@end

@interface _UIBatteryView : UIView
@end

@interface JCEBatteryView : UIView
@end