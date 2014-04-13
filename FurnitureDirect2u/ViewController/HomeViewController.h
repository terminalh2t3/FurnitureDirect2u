//
//  HomeViewController.h
//  FurnitureDirect2u
//
//  Created by Vu Tuan Anh on 4/6/14.
//  Copyright (c) 2014 FurnitureDirect2u. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController<UISearchBarDelegate,UIScrollViewDelegate>

@property (strong,nonatomic)NSMutableArray *slideImages;
@property (strong,nonatomic)IBOutlet UIScrollView *scv_imgHome;
@property (strong,nonatomic)NSMutableArray *arrCustomView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControlHome;

@end
