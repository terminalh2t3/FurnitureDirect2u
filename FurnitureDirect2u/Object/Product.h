//
//  Product.h
//  FurnitureDirect2u
//
//  Created by Vu Tuan Anh on 4/11/14.
//  Copyright (c) 2014 FurnitureDirect2u. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Product : NSObject

@property (strong,nonatomic) NSString* productName;
@property (strong,nonatomic) NSString* productCode;
@property (strong,nonatomic) NSString* brandName;
@property (strong,nonatomic) NSString* price;
@property (strong,nonatomic) NSString* thumImg;

@end
