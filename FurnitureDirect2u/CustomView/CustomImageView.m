//
//  CustomImageView.m
//  FurnitureDirect2u
//
//  Created by Vu Tuan Anh on 4/13/14.
//  Copyright (c) 2014 FurnitureDirect2u. All rights reserved.
//

#import "CustomImageView.h"

@implementation CustomImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithImage:(UIImage *)image{
    if(self = [super init]){
        self.image = [[UIImageView alloc]initWithFrame:CGRectMake(35, 0, 251, 145)];
        self.frameImg = [[UIImageView alloc]initWithFrame:CGRectMake(12, 146, 290, 15)];
        
//        [self setBackgroundColor:[UIColor redColor]];
        [self.image setImage:image];
        [self.image setContentMode:UIViewContentModeScaleAspectFit];
        [self.frameImg setImage:[UIImage imageNamed:@"image_frame.png"]];
        
        [self addSubview:self.image];
        [self addSubview:self.frameImg];
    }
    return self;
}

@end
