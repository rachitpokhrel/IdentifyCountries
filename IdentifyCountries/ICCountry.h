//
//  ICCountry.h
//  IdentifyCountries
//
//  Created by Rachit on 10/29/15.
//  Copyright © 2015 Rachit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ICCountry : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *capital;
@property (nonatomic, strong) NSArray *neighbors;
@property (nonatomic, strong) NSArray *region;

@end
