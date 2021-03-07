#import "DRSTimeAndDateSubPrefsListController.h"

@implementation DRSTimeAndDateSubPrefsListController

- (void)viewDidLoad {

    [super viewDidLoad];

    self.appearanceSettings = [DRSAppearanceSettings new];
    self.hb_appearanceSettings = [self appearanceSettings];


    self.preferences = [[HBPreferences alloc] initWithIdentifier: @"love.litten.dresspreferences"];


    self.enableSwitch = [UISwitch new];
    [[self enableSwitch] setOnTintColor:[UIColor colorWithRed: 0.64 green: 0.49 blue: 1.00 alpha: 1.00]];
    [[self enableSwitch] addTarget:self action:@selector(setEnabled) forControlEvents:UIControlEventTouchUpInside];


    self.item = [[UIBarButtonItem alloc] initWithCustomView: [self enableSwitch]];
    self.navigationItem.rightBarButtonItem = [self item];
    [[self navigationItem] setRightBarButtonItem:[self item]];


    self.blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleRegular];
    self.blurView = [[UIVisualEffectView alloc] initWithEffect:[self blur]];

}

- (void)viewWillAppear:(BOOL)animated {

    [super viewWillAppear:animated];

    [[self blurView] setFrame:[[self view] bounds]];
    [[self blurView] setAlpha:1.0];
    [[self view] addSubview:[self blurView]];

    [UIView animateWithDuration:0.4 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        [[self blurView] setAlpha:0.0];
    } completion:nil];

}

- (void)viewDidAppear:(BOOL)animated {

    [super viewDidAppear:animated];

    [self setEnabledState];

}

- (id)specifiers {

    return _specifiers;

}

- (void)loadFromSpecifier:(PSSpecifier *)specifier {

    NSString* sub = [specifier propertyForKey:@"DRSSub"];
    NSString* title = [specifier name];

    _specifiers = [self loadSpecifiersFromPlistName:sub target:self];

    [self setTitle:title];
    [[self navigationItem] setTitle:title];

}

- (void)setSpecifier:(PSSpecifier *)specifier {

    [self loadFromSpecifier:specifier];
    [super setSpecifier:specifier];

}

- (void)setEnabled {
        
    if ([[[self preferences] objectForKey:@"EnableTimeDateSection"] isEqual:@(YES)])
        [[self preferences] setBool:NO forKey:@"EnableTimeDateSection"];
    else
        [[self preferences] setBool:YES forKey:@"EnableTimeDateSection"];

}

- (void)setEnabledState {

    if ([[[self preferences] objectForKey:@"EnableTimeDateSection"] isEqual:@(YES)])
        [[self enableSwitch] setOn:YES animated:YES];
    else
        [[self enableSwitch] setOn:NO animated:YES];

}

- (void)showTimeFontPicker {
    
    self.timeFontPicker = [UIFontPickerViewController new];
    self.timeFontPicker.delegate = self;
    [self presentViewController:[self timeFontPicker] animated:YES completion:nil];
    
}

- (void)showDateFontPicker {
    
    self.dateFontPicker = [UIFontPickerViewController new];
    self.dateFontPicker.delegate = self;
    [self presentViewController:[self dateFontPicker] animated:YES completion:nil];
    
}

- (void)fontPickerViewControllerDidPickFont:(UIFontPickerViewController *)viewController {
    
    UIFontDescriptor* descriptor = [viewController selectedFontDescriptor];
    UIFont* font = [UIFont fontWithDescriptor:descriptor size:17];

    if ([viewController isEqual:[self timeFontPicker]])
        [[self preferences] setObject:[font familyName] forKey:@"customChosenTimeFont"];
    else if ([viewController isEqual:[self dateFontPicker]])
        [[self preferences] setObject:[font familyName] forKey:@"customChosenDateFont"];
    
}

@end