//
//  PagePeelDemoViewController.m
//  PagePeelDemo
//
//  Created by Mark Rickert on 6/28/11.
//  Copyright 2011 Mark Rickert. All rights reserved.
//

#import "PagePeelDemoViewController.h"

@implementation PagePeelDemoViewController

@synthesize textHere, peelIt, effect;

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
  [effect release];
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
  [self.view addSubview:imgView];  
  
  //This is where you would do everything to clear your interface
  self.textHere.text = @""; //Set the text field to blank

  //Pick the effect
  int effectToUse;
  if(self.effect.selectedSegmentIndex == 0)
  {
    effectToUse = UIViewAnimationOptionTransitionCurlUp;
  }
  else if(self.effect.selectedSegmentIndex == 1)
  {
    effectToUse = UIViewAnimationOptionTransitionFlipFromLeft;
  }
  else
  {
    effectToUse = UIViewAnimationOptionTransitionCurlDown;
  }
  
  
  [UIView transitionWithView:self.view 
                    duration:1
                     options:effectToUse
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

@end
