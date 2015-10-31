//
//  ICParseOperation.m
//  IdentifyCountries
//
//  Created by Rachit on 10/28/15.
//  Copyright © 2015 Rachit. All rights reserved.
//

#import "ICParseOperation.h"

@interface ICParseOperation()
@property (nonatomic, strong, readwrite) NSString *country;
@property (nonatomic, strong, readwrite) KMLParser *parser;
@end

@implementation ICParseOperation

-(id)initWithCountry:(NSString*)country delegate:(id)delegate
{
    if (self = [super init])
    {
        self.country = country;
        self.delegate = delegate;
    }
    return self;
}

-(void)main
{
    @autoreleasepool {
        if ([self isCancelled]) return;
        NSString *path = [[NSBundle mainBundle] pathForResource:self.country ofType:@"kml"];
        //NSLog(@"Country:%@ Path:%@",self.country,path);
        if (!path) return;
        if ([self isCancelled]) return;
        NSURL *url = [NSURL fileURLWithPath:path];
        if ([self isCancelled]) return;
        self.parser = [[KMLParser alloc] initWithURL:url];
        if ([self isCancelled]) return;
        [self.parser parseKML];
        if ([self isCancelled]) return;
        [(NSObject*)self.delegate performSelectorOnMainThread:@selector(didCompleteOperationWithParser:) withObject:self waitUntilDone:YES];
    }
}

@end
