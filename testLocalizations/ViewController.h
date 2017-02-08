//
//  ViewController.h
//  testLocalizations
//
//  Created by yuqiang on 2017/2/6.
//  Copyright © 2017年 yuqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *testButton;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)handleChineseButton:(id)sender;
- (IBAction)handleEnglishButton:(id)sender;
- (IBAction)handleNextButton:(id)sender;

@end

