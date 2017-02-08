//
//  ViewController.m
//  testLocalizations
//
//  Created by yuqiang on 2017/2/6.
//  Copyright © 2017年 yuqiang. All rights reserved.
//

#import "ViewController.h"

#import "NSBundle+Language.h"

#import "NextViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
//    NSString *title = NSLocalizedString(@"click", nil);
//    [self.testButton setTitle:title forState:UIControlStateNormal];
    
    
    NSString *title = NSLocalizedStringFromTable(@"click", @"SYQ", nil);
    [self.testButton setTitle:title forState:UIControlStateNormal];
    

    
    
    NSArray *languages = [[NSUserDefaults standardUserDefaults] valueForKey:@"AppleLanguages"];
    NSString *currentLanguage = languages.firstObject;
    NSLog(@"模拟器当前语言：%@",currentLanguage);
    
    NSString *imageName = NSLocalizedString(@"icon", nil);
    UIImage *image = [UIImage imageNamed:imageName];
    self.imageView.image = image;
    
    NSLog(@"%@",self.imageView.image);


    
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)handleChineseButton:(id)sender {
    // 切换语言
    NSArray *lans = @[@"zh-Hans"];
    [[NSUserDefaults standardUserDefaults] setObject:lans forKey:@"AppleLanguages"];
    
    [self changeLanguageWithLanguage:@"zh-Hans"];

}
    
- (IBAction)handleEnglishButton:(id)sender {
    // 切换语言
    NSArray *lans = @[@"en"];
    [[NSUserDefaults standardUserDefaults] setObject:lans forKey:@"AppleLanguages"];
    
    [self changeLanguageWithLanguage:@"en"];
}

- (IBAction)handleNextButton:(id)sender {
    NextViewController *next = [[NextViewController alloc]init];
    [self.navigationController pushViewController:next animated:YES];
}

- (void)changeLanguageWithLanguage:(NSString *)language
{
    [NSBundle setLanguage:language];
    
    
    // 然后将设置好的语言存储好，下次进来直接加载
    [[NSUserDefaults standardUserDefaults] setObject:language forKey:@"myLanguage"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    ViewController *view = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"123"];
    NSLog(@"%@", self.storyboard);
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:view];
    
    [UIApplication sharedApplication].keyWindow.rootViewController = nav;
    
}

@end
