#import "DRSEvanescoModeSubPrefsListController.h"

BOOL enableEvanescoModeSection = NO;

@implementation DRSEvanescoModeSubPrefsListController

- (instancetype)init {

    self = [super init];

    if (self) {
        DRSAppearanceSettings *appearanceSettings = [[DRSAppearanceSettings alloc] init];
        self.hb_appearanceSettings = appearanceSettings;
        self.enableSwitch = [[UISwitch alloc] init];
        self.enableSwitch.onTintColor = [UIColor colorWithRed: 0.64 green: 0.49 blue: 1.00 alpha: 1.00];
        [self.enableSwitch addTarget:self action:@selector(toggleState) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem* switchy = [[UIBarButtonItem alloc] initWithCustomView: self.enableSwitch];
        self.navigationItem.rightBarButtonItem = switchy;
    }

    return self;

}

- (id)specifiers {

    return _specifiers;

}

- (void)viewWillAppear:(BOOL)animated {

    [super viewWillAppear:animated];

    [self.navigationController.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];

    [self setCellState];

}

- (void)viewDidAppear:(BOOL)animated {

    [self setEnableSwitchState];

    if ([[NSFileManager defaultManager] fileExistsAtPath:@"/Library/MobileSubstrate/DynamicLibraries/DressEvanesco.disabled"])
        [self disabledAlert];

}

- (void)loadFromSpecifier:(PSSpecifier *)specifier {

    NSString *sub = [specifier propertyForKey:@"DRSSub"];
    NSString *title = [specifier name];

    _specifiers = [[self loadSpecifiersFromPlistName:sub target:self] retain];

    [self setTitle:title];
    [self.navigationItem setTitle:title];

}

- (void)setSpecifier:(PSSpecifier *)specifier {

    [self loadFromSpecifier:specifier];
    [super setSpecifier:specifier];

}

- (bool)shouldReloadSpecifiersOnResume {

    return false;

}

- (void)toggleState {

    NSString* path = [NSString stringWithFormat:@"/var/mobile/Library/Preferences/love.litten.dresspreferences.plist"];
    NSMutableDictionary* dictionary = [NSMutableDictionary dictionaryWithContentsOfFile:path];
    NSSet* allKeys = [NSSet setWithArray:[dictionary allKeys]];
    HBPreferences *preferences = [[HBPreferences alloc] initWithIdentifier: @"love.litten.dresspreferences"];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:@"/var/mobile/Library/Preferences/love.litten.dresspreferences.plist"]) {
        enableEvanescoModeSection = YES;
        [preferences setBool:enableEvanescoModeSection forKey:@"EnableEvanescoModeSection"];
        [self toggleCellState:YES];
    } else if (![allKeys containsObject:@"EnableEvanescoModeSection"]) {
        enableEvanescoModeSection = YES;
        [preferences setBool:enableEvanescoModeSection forKey:@"EnableEvanescoModeSection"];
        [self toggleCellState:YES];
    } else if ([[preferences objectForKey:@"EnableEvanescoModeSection"] isEqual:@(NO)]) {
        enableEvanescoModeSection = YES;
        [preferences setBool:enableEvanescoModeSection forKey:@"EnableEvanescoModeSection"];
        [self toggleCellState:YES];   
    } else if ([[preferences objectForKey:@"EnableEvanescoModeSection"] isEqual:@(YES)]) {
        enableEvanescoModeSection = NO;
        [preferences setBool:enableEvanescoModeSection forKey:@"EnableEvanescoModeSection"];
        [self toggleCellState:NO];
    }

}

- (void)setEnableSwitchState {

    NSString* path = [NSString stringWithFormat:@"/var/mobile/Library/Preferences/love.litten.dresspreferences.plist"];
    NSMutableDictionary* dictionary = [NSMutableDictionary dictionaryWithContentsOfFile:path];
    NSSet* allKeys = [NSSet setWithArray:[dictionary allKeys]];
    HBPreferences* preferences = [[HBPreferences alloc] initWithIdentifier: @"love.litten.dresspreferences"];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:@"/var/mobile/Library/Preferences/love.litten.dresspreferences.plist"]){
        [[self enableSwitch] setOn:NO animated:YES];
        [self toggleCellState:NO];
    } else if (![allKeys containsObject:@"EnableEvanescoModeSection"]) {
        [[self enableSwitch] setOn:NO animated:YES];
        [self toggleCellState:NO];
    } else if ([[preferences objectForKey:@"EnableEvanescoModeSection"] isEqual:@(YES)]) {
        [[self enableSwitch] setOn:YES animated:YES];
        [self toggleCellState:YES];
    } else if ([[preferences objectForKey:@"EnableEvanescoModeSection"] isEqual:@(NO)]) {
        [[self enableSwitch] setOn:NO animated:YES];
        [self toggleCellState:NO];
    }

}

- (void)setCellState {

    NSString* path = [NSString stringWithFormat:@"/var/mobile/Library/Preferences/love.litten.dresspreferences.plist"];
    NSMutableDictionary* dictionary = [NSMutableDictionary dictionaryWithContentsOfFile:path];
    NSSet* allKeys = [NSSet setWithArray:[dictionary allKeys]];
    HBPreferences* preferences = [[HBPreferences alloc] initWithIdentifier: @"love.litten.dresspreferences"];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:@"/var/mobile/Library/Preferences/love.litten.dresspreferences.plist"]){
        [self toggleCellState:NO];
    } else if (![allKeys containsObject:@"EnableEvanescoModeSection"]) {
        [self toggleCellState:NO];
    } else if ([[preferences objectForKey:@"EnableEvanescoModeSection"] isEqual:@(YES)]) {
        [self toggleCellState:YES];
    } else if ([[preferences objectForKey:@"EnableEvanescoModeSection"] isEqual:@(NO)]) {
        [self toggleCellState:NO];
    }

}

- (void)toggleCellState:(BOOL)enable {

    if (enable) {
        [self setCellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] enabled:YES];
        [self setCellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0] enabled:YES];
        [self setCellForRowAtIndexPath:[NSIndexPath indexPathForRow:2 inSection:0] enabled:YES];
        [self setCellForRowAtIndexPath:[NSIndexPath indexPathForRow:3 inSection:0] enabled:YES];
        [self setCellForRowAtIndexPath:[NSIndexPath indexPathForRow:4 inSection:0] enabled:YES];
        [self setCellForRowAtIndexPath:[NSIndexPath indexPathForRow:5 inSection:0] enabled:YES];
        [self setCellForRowAtIndexPath:[NSIndexPath indexPathForRow:6 inSection:0] enabled:YES];
        [self setCellForRowAtIndexPath:[NSIndexPath indexPathForRow:7 inSection:0] enabled:YES];
        [self setCellForRowAtIndexPath:[NSIndexPath indexPathForRow:8 inSection:0] enabled:YES];
        [self setCellForRowAtIndexPath:[NSIndexPath indexPathForRow:9 inSection:0] enabled:YES];
        [self setCellForRowAtIndexPath:[NSIndexPath indexPathForRow:13 inSection:0] enabled:YES];
        [self setCellForRowAtIndexPath:[NSIndexPath indexPathForRow:14 inSection:0] enabled:YES];
        [self setCellForRowAtIndexPath:[NSIndexPath indexPathForRow:15 inSection:0] enabled:YES];
        [self setCellForRowAtIndexPath:[NSIndexPath indexPathForRow:16 inSection:0] enabled:YES];
        [self setCellForRowAtIndexPath:[NSIndexPath indexPathForRow:17 inSection:0] enabled:YES];
        [self setCellForRowAtIndexPath:[NSIndexPath indexPathForRow:18 inSection:0] enabled:YES];
        [self setCellForRowAtIndexPath:[NSIndexPath indexPathForRow:19 inSection:0] enabled:YES];
        if ([[NSFileManager defaultManager] fileExistsAtPath:@"/Library/MobileSubstrate/DynamicLibraries/Complications.dylib"])
            [self setCellForRowAtIndexPath:[NSIndexPath indexPathForRow:11 inSection:0] enabled:NO];
        else
            [self setCellForRowAtIndexPath:[NSIndexPath indexPathForRow:11 inSection:0] enabled:NO];
        if ([[NSFileManager defaultManager] fileExistsAtPath:@"/Library/MobileSubstrate/DynamicLibraries/Grupi.dylib"])
            [self setCellForRowAtIndexPath:[NSIndexPath indexPathForRow:12 inSection:0] enabled:YES];
        else
            [self setCellForRowAtIndexPath:[NSIndexPath indexPathForRow:12 inSection:0] enabled:NO];
        if ([[NSFileManager defaultManager] fileExistsAtPath:@"/Library/MobileSubstrate/DynamicLibraries/Axon.dylib"])
            [self setCellForRowAtIndexPath:[NSIndexPath indexPathForRow:13 inSection:0] enabled:YES];
        else
            [self setCellForRowAtIndexPath:[NSIndexPath indexPathForRow:13 inSection:0] enabled:NO];
    } else {
        [self setCellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] enabled:NO];
        [self setCellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0] enabled:NO];
        [self setCellForRowAtIndexPath:[NSIndexPath indexPathForRow:2 inSection:0] enabled:NO];
        [self setCellForRowAtIndexPath:[NSIndexPath indexPathForRow:3 inSection:0] enabled:NO];
        [self setCellForRowAtIndexPath:[NSIndexPath indexPathForRow:4 inSection:0] enabled:NO];
        [self setCellForRowAtIndexPath:[NSIndexPath indexPathForRow:5 inSection:0] enabled:NO];
        [self setCellForRowAtIndexPath:[NSIndexPath indexPathForRow:6 inSection:0] enabled:NO];
        [self setCellForRowAtIndexPath:[NSIndexPath indexPathForRow:7 inSection:0] enabled:NO];
        [self setCellForRowAtIndexPath:[NSIndexPath indexPathForRow:8 inSection:0] enabled:NO];
        [self setCellForRowAtIndexPath:[NSIndexPath indexPathForRow:9 inSection:0] enabled:NO];
        [self setCellForRowAtIndexPath:[NSIndexPath indexPathForRow:10 inSection:0] enabled:NO];
        [self setCellForRowAtIndexPath:[NSIndexPath indexPathForRow:11 inSection:0] enabled:NO];
        [self setCellForRowAtIndexPath:[NSIndexPath indexPathForRow:12 inSection:0] enabled:NO];
        [self setCellForRowAtIndexPath:[NSIndexPath indexPathForRow:13 inSection:0] enabled:NO];
        [self setCellForRowAtIndexPath:[NSIndexPath indexPathForRow:14 inSection:0] enabled:NO];
        [self setCellForRowAtIndexPath:[NSIndexPath indexPathForRow:15 inSection:0] enabled:NO];
        [self setCellForRowAtIndexPath:[NSIndexPath indexPathForRow:16 inSection:0] enabled:NO];
        [self setCellForRowAtIndexPath:[NSIndexPath indexPathForRow:17 inSection:0] enabled:NO];
        [self setCellForRowAtIndexPath:[NSIndexPath indexPathForRow:18 inSection:0] enabled:NO];
        [self setCellForRowAtIndexPath:[NSIndexPath indexPathForRow:19 inSection:0] enabled:NO];
    }

}

- (void)setCellForRowAtIndexPath:(NSIndexPath *)indexPath enabled:(BOOL)enabled {

    UITableViewCell *cell = [self tableView:self.table cellForRowAtIndexPath:indexPath];

    if (cell) {
        cell.userInteractionEnabled = enabled;
        cell.textLabel.enabled = enabled;
        cell.detailTextLabel.enabled = enabled;
        if ([cell isKindOfClass:[PSControlTableCell class]]) {
            PSControlTableCell *controlCell = (PSControlTableCell *)cell;
            if (controlCell.control)
                controlCell.control.enabled = enabled;
        } else if ([cell isKindOfClass:[PSEditableTableCell class]]) {
            PSEditableTableCell *editableCell = (PSEditableTableCell *)cell;
            ((UITextField*)[editableCell textField]).alpha = enabled ? 1 : 0.4;
        }
    }

}

- (void)disabledAlert {

    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Dress"
	message:@"It Looks Like You Disabled DressEvanesco In iCleaner Pro, Dress Evanesco Won't Work In This State"
	preferredStyle:UIAlertControllerStyleAlert];
	UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Back" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * action) {

        [[self navigationController] popViewControllerAnimated:YES];

	}];

    [alertController addAction:cancelAction];

	[self presentViewController:alertController animated:YES completion:nil];

}

@end