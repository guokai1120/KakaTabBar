//
//  MainTabBarController.m
//  TradeUnion
//
//  Created by Kaka on 2017/2/14.
//  Copyright © 2017年 bzunion. All rights reserved.
//

#import "MainTabBarController.h"
#import "MainTabBar.h"
#import "MainNavigationController.h"
#import "HomePageVC.h"
#import "MineVC.h"
#import "MunicipiosVC.h"
#import "ToolsVC.h"


@interface MainTabBarController ()<MainTabBarDelegate>
@property(nonatomic, weak)MainTabBar *mainTabBar;

@end

@implementation MainTabBarController


/**
 *  单利
 *
 *  @return 唯一性
 */
+ (instancetype)shareInstance{
    static MainTabBarController * instance = nil;
    static dispatch_once_t tocken ;
    
    dispatch_once(&tocken, ^{
        
        instance = [[MainTabBarController alloc] init];
    });
    
    return instance;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    [self SetupMainTabBar];
    [self SetupAllControllers];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    for (UIView *child in self.tabBar.subviews) {
        if ([child isKindOfClass:[UIControl class]]) {
            [child removeFromSuperview];
        }
    }
}

- (void)SetupMainTabBar{
    MainTabBar *mainTabBar = [[MainTabBar alloc] init];
    mainTabBar.frame = self.tabBar.bounds;
    mainTabBar.delegate = self;
    [self.tabBar addSubview:mainTabBar];
    _mainTabBar = mainTabBar;
}

- (void)SetupAllControllers{
    
    
    NSArray *titles = @[@"首页", @"县区", @"工具", @"我的"];
    NSArray *images = @[@"tabbar_home_default", @"tabbar_municipios_default", @"tabbar_tools_default", @"tabbar_mine_default"];
    NSArray *selectedImages = @[@"tabbar_home_select", @"tabbar_municipios_select", @"tabbar_tools_select", @"tabbar_mine_select"];
    
    HomePageVC *home = [[HomePageVC alloc] init];
    MunicipiosVC *municipios = [[MunicipiosVC alloc] init];
    ToolsVC *tools = [[ToolsVC alloc] init];
    MineVC *mine = [[MineVC alloc] init];
    
    //    self.viewControllers=@[homePage,municipio,tools,mine];

    NSArray *viewControllers = @[home,municipios,tools,mine];;
    
    for (int i = 0; i < viewControllers.count; i++) {
        UIViewController *childVc = viewControllers[i];
        [self SetupChildVc:childVc title:titles[i] image:images[i] selectedImage:selectedImages[i]];
    }
}

- (void)SetupChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)imageName selectedImage:(NSString *)selectedImageName{
    MainNavigationController *nav = [[MainNavigationController alloc] initWithRootViewController:childVc];
    childVc.tabBarItem.image = [UIImage imageNamed:imageName];
    childVc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImageName];
    childVc.tabBarItem.title = title;
    [self.mainTabBar addTabBarButtonWithTabBarItem:childVc.tabBarItem];
    [self addChildViewController:nav];
}



#pragma mark --------------------mainTabBar delegate
- (void)tabBar:(MainTabBar *)tabBar didSelectedButtonFrom:(long)fromBtnTag to:(long)toBtnTag{
    self.selectedIndex = toBtnTag;
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
