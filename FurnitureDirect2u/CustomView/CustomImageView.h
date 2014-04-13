//
//  CustomImageView.h
//  FurnitureDirect2u
//
//  Created by Vu Tuan Anh on 4/13/14.
//  Copyright (c) 2014 FurnitureDirect2u. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomImageView : UIView

@property (nonatomic, strong) UIImageView* image;
@property (nonatomic, strong) UIImageView* frameImg;

-(id) initWithImage: (UIImage*)image;

@end
