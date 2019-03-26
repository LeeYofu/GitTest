//
//  ViewController.m
//  Test
//
//  Created by 李友富 on 2019/3/26.
//  Copyright © 2019 李友富. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import <objc/runtime.h>

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    UIView *containerView = [[UIView alloc] initWithFrame:CGRectMake(0, 200, self.view.frame.size.width, 200)];
    containerView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:containerView];
    
    UIPageControl *pageControler = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 180, self.view.frame.size.width, 20)];
    pageControler.numberOfPages = 4;
    [pageControler setPageIndicatorTintColor:[UIColor blueColor]];
    [pageControler setCurrentPageIndicatorTintColor:[UIColor blackColor]];
    [containerView addSubview:pageControler];
   
    
    
    
    unsigned int count = 0;
    // 该方法是C函数，获取所有属性
    Ivar *ivars = class_copyIvarList([pageControler class], &count);
    
    for (unsigned int i = 0; i < count; i ++) {
        
        Ivar ivar = ivars[i];
        // 获取属性名
        const char *name = ivar_getName(ivar);
        // 使用KVC直接获取相关属性的值
        NSObject *value = [pageControler valueForKey:[NSString stringWithUTF8String:name]];
        NSLog(@"%s %@", name, value);
    }
    // 需要释放获取到的属性
    free(ivars);

}


@end
