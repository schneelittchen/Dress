#import <Preferences/PSListController.h>
#import <Preferences/PSListItemsController.h>
#import <Preferences/PSSpecifier.h>
#import <CepheiPrefs/HBListController.h>
#import <CepheiPrefs/HBAppearanceSettings.h>
#import <Cephei/HBPreferences.h>
#import <Preferences/PSControlTableCell.h>
#import <Preferences/PSEditableTableCell.h>

#define SYSTEM_VERSION_LESS_THAN(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)

@interface DRSAppearanceSettings : HBAppearanceSettings
@end

@interface DRSQuickActionsSubPrefsListController : HBListController
@property(nonatomic, retain)UISwitch* enableSwitch;
@property (nonatomic, retain) UILabel *titleLabel;
- (void)toggleState;
- (void)setEnableSwitchState;
- (void)setCellForRowAtIndexPath:(NSIndexPath *)indexPath enabled:(BOOL)enabled;
@end

@interface PSEditableTableCell (Interface)
- (id)textField;
@end