//
//  PagePeelDemoViewController.h
//  PagePeelDemo
//
//  Created by Mark Rickert on 6/28/11.
//  Copyright 2011 Mark Rickert. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PagePeelDemoViewController : UIViewController {
    
}

@property (nonatomic, retain) IBOutlet UITextField *textHere;
@property (nonatomic, retain) IBOutlet UIButton *peelIt;
@property (nonatomic, retain) IBOutlet UISegmentedControl *effect;

- (IBAction) pressedPeelIt:(UIButton *)sender;
- (UIImage *)captureScreen;

@end
