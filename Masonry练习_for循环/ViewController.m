//
//  ViewController.m
//  Masonry练习_for循环
//
//  Created by tarena002 on 16/7/1.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "ViewController.h"
#define MAS_SHORTHAND_GLOBALS
#import "Masonry.h"
@interface ViewController ()
@property (nonatomic) UIColor *randomColor;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *lastBtn = nil;
    
    for (int i = 0; i<9; i++)
    {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
        btn.backgroundColor = self.randomColor;
        [self.view addSubview:btn];
        
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(20);
            make.height.equalTo(50);
            if (i == 0) {
                make.top.equalTo(20);
                make.width.equalTo(self.view).multipliedBy(0.25);
            }
            else if(i > 0 && i < 5)
            {
                make.width.equalTo(lastBtn).equalTo(40);
                make.top.equalTo(lastBtn.mas_bottom).equalTo(20);
            }
            else
            {
                make.width.equalTo(lastBtn.mas_width).equalTo(-40);
                make.top.equalTo(lastBtn.mas_bottom).equalTo(20);
            }
        }];
        lastBtn = btn;
        //添加按钮点击事件
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    }
}

- (void)btnAction:(UIButton*)sender
{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        for (int i = 0; i<10000; i++)
        {
            NSLog(@"%d",i);
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            sender.backgroundColor = self.randomColor;
        });
        
    });
    
    /**
     *  oihsfvsohvskjnvwhvwnvvhskvbnisulahv nvasd vidsalkvnah safoashosdhfkasbv ilfgh
     *
     *  @return <#return value description#>
     */
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIColor *)randomColor {
	
    CGFloat r = arc4random() % 256 / 255.0;
    CGFloat g = arc4random() % 256 / 255.0;
    CGFloat b = arc4random() % 256 / 255.0;
    
    return [UIColor colorWithRed:r green:g blue:b alpha:1.0];
}

@end
