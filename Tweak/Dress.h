#import <UIKit/UIKit.h>
#import <Cephei/HBPreferences.h>
#import "SparkColourPickerUtils.h"

HBPreferences* preferences;
NSDictionary* preferencesDictionary;

extern BOOL enabled;
extern BOOL enableTimeDateSection;
extern BOOL enableFaceIDLockSection;
extern BOOL enableStatusBarSection;
extern BOOL enableHomebarSection;
extern BOOL enablePageDotsSection;
extern BOOL enableUnlockTextSection;
extern BOOL enableMediaPlayerSection;
extern BOOL enableNotificationsSection;
extern BOOL enableQuickActionsSection;
extern BOOL enableEvanescoModeSection;
extern BOOL enableOthersSection;

// Time And Date
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

// FaceID Lock
BOOL hideFaceIDLockSwitch = NO;
BOOL hideFaceIDLockLabelSwitch = NO;
NSString* faceIDLockAlphaValue = @"1.0";
BOOL customFaceIDAxisSwitch = NO;
NSString* faceIDXAxisControl = @"176.0";
NSString* faceIDYAxisControl = @"0.0";
NSString* customFaceIDSizeControl = @"0.0";
BOOL colorFaceIDLockSwitch = NO;

// Status Bar
BOOL hideStatusBarSwitch = NO;
NSString* statusBarAlphaControl = @"1.0";

// Homebar
BOOL hideHomebarSwitch = NO;
NSString* homebarAlphaControl = @"1.0";
BOOL colorHomebarSwitch = NO;

// Page Dots
BOOL hidePageDotsSwitch = NO;
NSString* pageDotsAlphaControl = @"1.0";

// CC Grabber
BOOL hideCCGrabberSwitch = NO;
NSString* ccGrabberAlphaControl = @"1.0";

// Unlock Text
BOOL hideUnlockTextSwitch = NO;
NSString* unlockTextInput = @"";
NSString* currentTime;
BOOL lastTimeUnlockedSwitch = NO;
BOOL prefersLastTimeLockedSwitch = NO;
BOOL lastTimeUnlocked24hSwitch = NO;
BOOL lastTimeUnlockedAMPMSwitch = NO;
BOOL lastTimeUnlockedDateSwitch = NO;
BOOL lastTimeUnlockedOnlyTimeAndDateSwitch = NO;
BOOL lastTimeUnlockedSecondsSwitch = NO;
BOOL weatherConditionSwitch = NO;
BOOL weatherTemperatureSwitch = NO;
BOOL colorUnlockTextSwitch = NO;

// Media Player
BOOL hideMediaPlayerSwitch = NO;
NSString* mediaPlayerAlphaControl = @"1.0";
BOOL hideLockscreenPlayerBackgroundSwitch = NO;

// Notifications
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

// Quick Actions
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

// Evanesco Mode
NSString* evanescoInactivityControl;
NSString* evanescoFadeDurationControl;
NSString* evanescoFadeAlphaControl;
BOOL timeDateEvanescoSwitch;
BOOL faceIDLockEvanescoSwitch;
BOOL statusBarEvanescoSwitch;
BOOL homebarEvanescoSwitch;
BOOL pageDotsEvanescoSwitch;
BOOL mediaPlayerEvanescoSwitch;
BOOL notificationCellsEvanescoSwitch;
BOOL notificationHintViewEvanescoSwitch;
BOOL notificationHeaderViewEvanescoSwitch;
BOOL unlockTextEvanescoSwitch;
BOOL quickActionsEvanescoSwitch;
BOOL complicationsEvanescoSwitch;
BOOL grupiEvanescoSwitch;
BOOL axonEvanescoSwitch;
BOOL lockWidgetsEvanescoSwitch;
BOOL kaiEvanescoSwitch;
BOOL aperioEvanescoSwitch;
BOOL vezaEvanescoSwitch;
BOOL ventanaEvanescoSwitch;
BOOL xenHTMLEvanescoSwitch;

// ColorFlow Support
BOOL timeDateColorFlowSwitch = NO;
BOOL faceIDLockColorFlowSwitch = NO;
BOOL statusBarColorFlowSwitch = NO;
BOOL homebarColorFlowSwitch = NO;
BOOL pageDotsColorFlowSwitch = NO;
BOOL unlockTextColorFlowSwitch = NO;
BOOL quickActionsColorFlowSwitch = NO;

// Others
NSString* customLockDurationControl = @"0";
BOOL disableBatteryViewSwitch = NO;
BOOL hideFaceIDAnimationSwitch = NO;

// Time And Date
@interface SBFLockScreenDateView : UIView
@property(nonatomic, retain)UIColor* textColor;
- (void)receiveColorNotification:(NSNotification *)notification;
- (void)receiveFadeNotification:(NSNotification *)notification;
@end

@interface SBFLockScreenDateSubtitleDateView : UIView
@end

@interface SBFLockScreenAlternateDateLabel : UIView
@end

// FaceID Lock
@interface SBUIProudLockIconView : UIView
@property(nonatomic, assign, readwrite)UIColor* contentColor;
- (void)receiveColorNotification:(NSNotification *)notification;
- (void)receiveFadeNotification:(NSNotification *)notification;
@end

@interface UIMorphingLabel : UIView
- (id)_viewControllerForAncestor;
@end

@interface _UIStatusBar : UIView
@end

@interface UIStatusBar_Modern : UIView
- (_UIStatusBar *)statusBar;
- (void)receiveStatusBarCustomizationNotification:(NSNotification *)notification;
@end

// Homebar
@interface CSHomeAffordanceView : UIView
- (void)receiveFadeNotification:(NSNotification *)notification;
@end

@interface MTPillView : UIView
@end

@interface MTStaticColorPillView : MTPillView
- (void)setPillColor:(UIColor *)arg1;
@end

// Page Dots
@interface CSPageControl : UIPageControl
- (void)receiveFadeNotification:(NSNotification *)notification;
@end

// Unlock Text
@interface CSTeachableMomentsContainerView : UIView
@property(nonatomic, strong, readwrite)UIView* controlCenterGrabberContainerView;
- (void)receiveFadeNotification:(NSNotification *)notification;
- (NSString *)getIPAddress;
@end

@interface SBUICallToActionLabel : UIView
@property(nonatomic, copy, readwrite)NSString* text;
- (void)receiveFadeNotification:(NSNotification *)notification;
@end

// Media Player
@interface CSAdjunctItemView : UIView
- (void)receiveFadeNotification:(NSNotification *)notification;
@end

@interface MTMaterialView : UIView
@end

@interface UIView (Dress)
@property(nonatomic, assign, readwrite)MTMaterialView* backgroundMaterialView;
@end

// Notifications
@interface NCNotificationListView : UIScrollView
- (void)sendFadeNotification;
@end

@interface NCNotificationListCell : UIView
- (void)receiveFadeNotification:(NSNotification *)notification;
@end

@interface NCNotificationListSectionRevealHintView : UIView
- (void)receiveFadeNotification:(NSNotification *)notification;
@end

@interface NCNotificationListSectionHeaderView : UIView
- (void)receiveFadeNotification:(NSNotification *)notification;
@end

@interface NCNotificationListHeaderTitleView : UIView
@property(nonatomic, copy, readwrite)NSString* title;
@end

@interface ComplicationsView : UIView
- (void)receiveFadeNotification:(NSNotification *)notification;
@end

@interface GRPView : UIView
- (void)receiveFadeNotification:(NSNotification *)notification;
@end

@interface AXNView : UIView
- (void)receiveFadeNotification:(NSNotification *)notification;
@end

@interface LockWidgetsView : UIView
- (void)receiveFadeNotification:(NSNotification *)notification;
@end

@interface KAIBatteryPlatter : UIView
- (void)receiveFadeNotification:(NSNotification *)notification;
@end

@interface APEPlatter : UIView
- (void)receiveFadeNotification:(NSNotification *)notification;
@end

@interface VezaContainerView : UIView
- (void)receiveFadeNotification:(NSNotification *)notification;
@end

@interface CSMetroLockScreenView : UIView
- (void)receiveFadeNotification:(NSNotification *)notification;
@end

@interface XENHWidgetLayerContainerView : UIView
- (void)receiveFadeNotification:(NSNotification *)notification;
@end

@interface SBUILegibilityLabel : UIView
@property(nonatomic, assign, readwrite)NSString* string;
@property(assign,nonatomic) long long textAlignment;
@property(nonatomic, assign, readwrite)UIColor* textColor;
@end

// Quick Actions
@interface CSQuickActionsView : UIView
@end

@interface UICoverSheetButton : UIControl
@end

@interface CSQuickActionsButton : UICoverSheetButton
- (void)receiveFadeNotification:(NSNotification *)notification;
- (void)receiveColorNotification:(NSNotification *)notification;
@end

@interface UICoverSheetButton (Dress)
@property(nonatomic, copy)NSString* localizedAccessoryTitle; 
@end

@interface CSBatteryChargingView : UIView
@end

@interface SBBacklightController : NSObject
- (void)sendFadeNotification;
@end

@interface SBLockScreenManager : NSObject
+ (id)sharedInstance;
- (BOOL)unlockUIFromSource:(int)arg1 withOptions:(id)arg2 ;
@end

@interface UIApplication (Dress)
- (BOOL)launchApplicationWithIdentifier:(id)arg1 suspended:(BOOL)arg2;
@end
