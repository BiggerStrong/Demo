//
//  NextViewController.m
//  testLocalizations
//
//  Created by yuqiang on 2017/2/8.
//  Copyright © 2017年 yuqiang. All rights reserved.
//

#import "NextViewController.h"
#import "NSBundle+Language.h"
#import "ViewController.h"

@interface NextViewController ()

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *ChineseButton = [UIButton buttonWithType:UIButtonTypeCustom];
    ChineseButton.frame = CGRectMake(20, 80, 50, 50);
    ChineseButton.backgroundColor = [UIColor redColor];
    [ChineseButton setTitle:@"中文" forState:UIControlStateNormal];
    [ChineseButton addTarget:self action:@selector(handleChineseButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:ChineseButton];
    
    
    
    UIButton *EnglishButton = [UIButton buttonWithType:UIButtonTypeCustom];
    EnglishButton.frame = CGRectMake(120, 80, 50, 50);
    EnglishButton.backgroundColor = [UIColor redColor];
    [EnglishButton setTitle:@"英文" forState:UIControlStateNormal];
    [EnglishButton addTarget:self action:@selector(handleEnglishButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:EnglishButton];
    
    
    
    UILabel *testLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 150, [UIScreen mainScreen].bounds.size.width, 30)];
    testLabel.text = NSLocalizedStringFromTable(@"test", @"SYQ", nil);
    testLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:testLabel];
    
    
    UIImageView *testImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 200, [UIScreen mainScreen].bounds.size.width, 100)];
    testImageView.backgroundColor = [UIColor greenColor];
    
    NSString *imageString = [[NSString alloc]init];
    NSArray *languages = [[NSUserDefaults standardUserDefaults] valueForKey:@"AppleLanguages"];
    NSString *currentLanguage = languages.firstObject;
    NSLog(@"模拟器当前语言：%@",currentLanguage);

    //此方法切换语言图片能跟着换
    if ([currentLanguage hasPrefix:@"zh-Hans"]){
        imageString = [NSString stringWithFormat:@"%@_zh-Hans",@"icon"];
    } else {
        imageString = [NSString stringWithFormat:@"%@_en",@"icon"];
    }
    
    NSLog(@"%@",imageString);
    testImageView.image = [UIImage imageNamed:imageString];
    
    //此方法切换语言图片不能跟着换
//    NSString *imageName = NSLocalizedString(@"icon", nil);
//    UIImage *image = [UIImage imageNamed:imageName];
//    testImageView.image = image;
//    
//    NSLog(@"%@",testImageView.image);
//    [self.view addSubview:testImageView];
    
    
    // Do any additional setup after loading the view.
}


- (void)handleChineseButton
{
    // 切换语言
    NSArray *lans = @[@"zh-Hans"];
    [[NSUserDefaults standardUserDefaults] setObject:lans forKey:@"AppleLanguages"];

    [self changeLanguageWithLanguage:@"zh-Hans"];
}

- (void)handleEnglishButton
{
    // 切换语言
    NSArray *lans = @[@"en"];
    [[NSUserDefaults standardUserDefaults] setObject:lans forKey:@"AppleLanguages"];

    [self changeLanguageWithLanguage:@"en"];
}

- (void)changeLanguageWithLanguage:(NSString *)language
{
    [NSBundle setLanguage:language];
    
    
    // 然后将设置好的语言存储好，下次进来直接加载
    [[NSUserDefaults standardUserDefaults] setObject:language forKey:@"myLanguage"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    
    
    ViewController *view = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"123"];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:view];
    
    [UIApplication sharedApplication].keyWindow.rootViewController = nav;
    NextViewController *next = [[NextViewController alloc]init];
    [view.navigationController pushViewController:next animated:YES];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
