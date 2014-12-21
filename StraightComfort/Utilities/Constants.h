//
//  Constants.h
//  StraightComfort
//
//  Created by Jun Torii on 2014-05-24.
//  Copyright (c) 2014 Jun Torii. All rights reserved.
//

// Custom fonts
#define kChampagneLimousines @"Champagne&Limousines"
#define kChampagneLimousinesBold @"Champagne&Limousines-Bold"
#define kChampagneLimousinesItalic @"Champagne&Limousines-Italic"
#define kChampagneLimousinesBoldItalic @"Champagne&Limousines-BoldItalic"

#define kRobotoMediumItalic @"Roboto-MediumItalic"
#define kRobotoRegular @"Roboto-Regular"
#define kRobotoThin @"Roboto-Thin"
#define kRobotoMedium @"Roboto-Medium"
#define kRobotoBlack @"Roboto-Black"
#define kRobotoLightItalic @"Roboto-LightItalic"
#define kRobotoBoldCondensedItalic @"Roboto-BoldCondensedItalic"
#define kRobotoBoldItalic @"Roboto-BoldItalic"
#define kRobotoCondensedItalic @"Roboto-CondensedItalic"
#define kRobotoBlackItalic @"Roboto-BlackItalic"
#define kRobotoCondensed @"Roboto-Condensed"
#define kRobotoLight @"Roboto-Light"
#define kRobotoBold @"Roboto-Bold"
#define kRobotoItalic @"Roboto-Italic"
#define kRobotoThinItalic @"Roboto-ThinItalic"
#define kRobotoBoldCondensed @"Roboto-BoldCondensed"

// Screen size
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_IPHONE_5 (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 568.0)
#define IS_RETINA ([[UIScreen mainScreen] scale] == 2.0)
#define IS_IPAD_RETINA (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad && [[UIScreen mainScreen] scale] == 2.0)