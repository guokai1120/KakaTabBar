# KakaTabBar
自定义tabbar 
可以push时隐藏 
pop显示

单利的形式调用 保证项目中只有一个

调用方法：
 MainTabBarController *tabBarVC = [MainTabBarController  shareInstance];

 self.window.rootViewController = tabBarVC;

如何设置控制的控制器：

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


如果对你有帮助不要忘了给我star支持
