//
//  ICParseOperation.h
//  IdentifyCountries
//
//  Created by Rachit on 10/28/15.
//  Copyright © 2015 Rachit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KMLParser.h"

@protocol ICParseDelegate;

@interface ICParseOperation : NSOperation
-(id)initWithCountry:(NSString*)country delegate:(id)delegate;

@property (nonatomic, strong, readonly) NSString *country;
@property (nonatomic, strong, readonly) KMLParser *parser;
@property (nonatomic, weak) id<ICParseDelegate> delegate;
@property (nonatomic, assign, getter=isOcean) BOOL ocean;
@end

@protocol ICParseDelegate <NSObject>

-(void)didCompleteOperationWithParser:(ICParseOperation*)operation;

@end