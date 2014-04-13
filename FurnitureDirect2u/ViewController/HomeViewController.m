//
//  HomeViewController.m
//  FurnitureDirect2u
//
//  Created by Vu Tuan Anh on 4/6/14.
//  Copyright (c) 2014 FurnitureDirect2u. All rights reserved.
//

#import "HomeViewController.h"
#import "CustomImageView.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

@synthesize slideImages;
@synthesize scv_imgHome;
@synthesize pageControlHome;
@synthesize arrCustomView;

typedef enum ScrollSize
{
    sWidth = 320,
    sHeight = 160
} ScrollSize;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //add search bar in navigation
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, 38.0)];
    searchBar.autoresizingMask = UIViewAutoresizingFlexibleWidth;

    [searchBar setBackgroundImage:[UIImage new]];
    [searchBar setTranslucent:YES];
    
    UIView *searchBarView = [[UIView alloc] initWithFrame:CGRectMake(5, 0, 320, 40.0)];
    searchBarView.autoresizingMask = 0;
    [searchBarView setBackgroundColor:[UIColor clearColor]];
    searchBar.delegate = self;
    [searchBarView addSubview:searchBar];
    self.navigationItem.titleView = searchBarView;
    
    
    //custom scrollview
    [scv_imgHome setBackgroundColor:[UIColor clearColor]];
    scv_imgHome.bounces = YES;
    scv_imgHome.pagingEnabled = YES;
    scv_imgHome.delegate = self;
    scv_imgHome.userInteractionEnabled = YES;
    scv_imgHome.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:scv_imgHome];
    
    //add array
    slideImages = [[NSMutableArray alloc] init];
    [slideImages addObject:@"1-1.jpg"];
    [slideImages addObject:@"1-2.jpg"];
    [slideImages addObject:@"1-3.jpg"];
    [slideImages addObject:@"1-4.jpg"];
    
//    CustomImageView* ctImgView = [[CustomImageView alloc]initWithImage:[UIImage imageNamed:@"image_frame.png"]];
//    ctImgView.frame = CGRectMake(0, 100, 320, 209);
//    [self.view addSubview:ctImgView];
    arrCustomView = [[NSMutableArray alloc]init];
    for (NSString* imageName in slideImages)
    {
        CustomImageView* ctImgView = [[CustomImageView alloc]initWithImage:[UIImage imageNamed:imageName]];
        [arrCustomView addObject:ctImgView];
    }
    
    //pageControl
    [pageControlHome setCurrentPageIndicatorTintColor:[UIColor redColor]];
    [pageControlHome setPageIndicatorTintColor:[UIColor grayColor]];
    pageControlHome.numberOfPages = [self.arrCustomView count];
    pageControlHome.currentPage = 0;
    [pageControlHome addTarget:self action:@selector(turnPage) forControlEvents:UIControlEventValueChanged];
    
    //Prepare view
    for (int i = 0;i<[arrCustomView count];i++)
    {
        UIImageView *imgView = [arrCustomView objectAtIndex:i];
        imgView.frame = CGRectMake((sWidth * i) + sWidth, 0, sWidth, sHeight);
        [scv_imgHome addSubview:imgView];
    }
//    UIImageView *imageView = [arrCustomView objectAtIndex:([arrCustomView count]-1)];
//    imageView.frame = CGRectMake(0, 0, 320, 210);
//    [scv_imgHome addSubview:imageView];
//    
//    imageView = [arrCustomView objectAtIndex:0];
//    imageView.frame = CGRectMake((320 * ([slideImages count] + 1)) , 0, 320, 210);
//    [scv_imgHome addSubview:imageView];
//    
    [scv_imgHome setContentSize:CGSizeMake(sWidth * ([arrCustomView count] + 2), sHeight)]; // 4-[1-2-3-4]-1
    [scv_imgHome setContentOffset:CGPointMake(0, 0)];
    [self.scv_imgHome scrollRectToVisible:CGRectMake(sWidth,0,sWidth,sHeight) animated:YES];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat pagewidth = self.scv_imgHome.frame.size.width;
    int currentPage = floor((self.scv_imgHome.contentOffset.x - pagewidth/ ([slideImages count]+2)) / pagewidth) + 1;
    //    int currentPage_ = (int)self.scrollView.contentOffset.x/320; //
    //    NSLog(@"currentPage_==%d",currentPage_);
    if (currentPage==0)
    {
        [self.scv_imgHome scrollRectToVisible:CGRectMake(sWidth * [arrCustomView count],0,sWidth,sHeight) animated:YES];
    }
    else if (currentPage==([slideImages count]+1))
    {
        [self.scv_imgHome scrollRectToVisible:CGRectMake(sWidth,0,sWidth,sHeight) animated:NO];
    }
}

- (void)turnPage
{
    int page = pageControlHome.currentPage;
    [scv_imgHome scrollRectToVisible:CGRectMake(sWidth*(page+1),0,sWidth,sHeight) animated:YES];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat pagewidth = self.scv_imgHome.frame.size.width;
    int page = floor((self.scv_imgHome.contentOffset.x - pagewidth/([arrCustomView count]+2))/pagewidth)+1;
    page --;
    pageControlHome.currentPage = page;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
