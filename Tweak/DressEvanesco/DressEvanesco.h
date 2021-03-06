#import <UIKit/UIKit.h>
#import <dlfcn.h>
#import <Cephei/HBPreferences.h>

HBPreferences* preferences = nil;

BOOL enableEvanescoSectionSwitch = NO;

// evanesco mode
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

@interface _UIStatusBar : UIView
@end

@interface UIStatusBar_Modern : UIView
- (_UIStatusBar *)statusBar;
- (void)receiveFadeNotification:(NSNotification *)notification;
@end

@interface SBFLockScreenDateView : UIView
- (void)receiveFadeNotification:(NSNotification *)notification;
@end

@interface SBUIProudLockIconView : UIView
- (void)receiveFadeNotification:(NSNotification *)notification;
@end

@interface CSHomeAffordanceView : UIView
- (void)receiveFadeNotification:(NSNotification *)notification;
@end

@interface CSPageControl : UIPageControl
- (void)receiveFadeNotification:(NSNotification *)notification;
@end

@interface CSTeachableMomentsContainerView : UIView
@property(nonatomic, strong, readwrite)UIView* controlCenterGrabberContainerView;
- (void)receiveFadeNotification:(NSNotification *)notification;
@end

@interface SBUICallToActionLabel : UIView
- (void)receiveFadeNotification:(NSNotification *)notification;
@end

@interface CSAdjunctItemView : UIView
- (void)receiveFadeNotification:(NSNotification *)notification;
@end

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

@interface CSQuickActionsView : UIView
@end

@interface UICoverSheetButton : UIControl
@end

@interface CSQuickActionsButton : UICoverSheetButton
- (void)receiveFadeNotification:(NSNotification *)notification;
- (void)receiveColorNotification:(NSNotification *)notification;
@end

@interface SBBacklightController : NSObject
- (void)sendFadeNotification;
@end

@interface SBLockScreenManager : NSObject
+ (id)sharedInstance;
- (BOOL)isLockScreenVisible;
@end