//
//  PagePeelDemoViewController.m
//  PagePeelDemo
//
//  Created by Mark Rickert on 6/28/11.
//  Copyright 2011 Mark Rickert. All rights reserved.
//

#import "PagePeelDemoViewController.h"
#import <QuartzCore/QuartzCore.h>

@implementation PagePeelDemoViewController

@synthesize textHere, peelIt;

- (void)viewDidLoad
{
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];
  [self.textHere becomeFirstResponder];
}

- (void)viewDidUnload
{
  [super viewDidUnload];
}

- (void)dealloc
{
  [textHere release];
  [peelIt release];
  [super dealloc];
}

#pragma mark Page Peel Effects
- (IBAction) pressedPeelIt:(UIButton *)sender
{
  //Disable the button so they can't press it
  self.peelIt.enabled = NO;
  
  [self.textHere resignFirstResponder];
  
  //Create a new UIView and set the background color to be a UIColor with
  // pattern image of a screen capture
  UIView *imgView = [[UIView alloc] init];
  imgView.backgroundColor = [UIColor colorWithPatternImage:[self captureScreen]];
  [self.view addSubview:imgView];  
  
  //This is where you would do everything to clear your interface
  self.textHere.text = @""; //Set the text field to blank
  
  [UIView transitionWithView:self.view 
                    duration:1
                     options:UIViewAnimationOptionTransitionCurlUp
                  animations:^{
                    //Nothing here
                  }
                  completion:^(BOOL finished){
                    [self.textHere becomeFirstResponder];
                    [imgView removeFromSuperview];
                    [imgView release];
                    self.peelIt.enabled = YES; //Don't forget to re-enable the button at the completion block handler
                  }
   ];
  
}

/*
 Generic code to capture the whole screen. You could modify this to only capture a portion of the screen.
 If you're seeing a syntax error here, you need to add the QuartzCore.framework to your project and import the header.
*/
-(UIImage *)captureScreen
{
	UIGraphicsBeginImageContext(self.view.frame.size);
	[self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
	UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
  return viewImage;
}

@end
