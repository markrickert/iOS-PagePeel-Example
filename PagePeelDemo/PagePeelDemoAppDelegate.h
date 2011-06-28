//
//  PagePeelDemoAppDelegate.h
//  PagePeelDemo
//
//  Created by Mark Rickert on 6/28/11.
//  Copyright 2011 Mark Rickert. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PagePeelDemoViewController;

@interface PagePeelDemoAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet PagePeelDemoViewController *viewController;

@end
