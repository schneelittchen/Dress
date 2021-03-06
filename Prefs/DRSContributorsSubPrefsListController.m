#import "DRSContributorsSubPrefsListController.h"

@implementation DRSContributorsSubPrefsListController

- (void)viewDidLoad {

    [super viewDidLoad];

    DRSAppearanceSettings* appearanceSettings = [DRSAppearanceSettings new];
    self.hb_appearanceSettings = appearanceSettings;

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

@end