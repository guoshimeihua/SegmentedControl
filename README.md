# SegmentedControl

# 求start

# 预览 Preview
![image](https://github.com/guoshimeihua/SegmentedControl/blob/master/SwipeViewControllerTestDemo/record14.gif ) 

# 用法 Usage
###### 创建四个UIViewController,从而方便以后对不同的页面进行扩展。
    NewsViewController *newsVC = [[NewsViewController alloc] init];
    HotNewsViewController *hotnewsVC = [[HotNewsViewController alloc] init];
    BlogViewController *blogVC = [[BlogViewController alloc] init];
    RecommendViewController *recommendVC = [[RecommendViewController alloc] init];
    
    SwipableViewController *swipeViewController = [[SwipableViewController alloc] initWithTitle:@"综合" andSubTitles:@[@"资讯", @"热点", @"博客", @"推荐"] andControllers:@[newsVC, hotnewsVC, blogVC, recommendVC]   underTabbar:NO];
