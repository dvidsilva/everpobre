//
//  DVDAppDelegate.h
//  coreData
//
//  Created by Dvid Silva on 5/9/13.
//  Copyright (c) 2013 Dvid Silva. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AGTCoreDataStack;


@interface DVDAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong,nonatomic) AGTCoreDataStack *model;
@end
