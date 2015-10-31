//
//  ICMapViewController.h
//  IdentifyCountries
//
//  Created by Rachit on 10/30/15.
//  Copyright © 2015 Rachit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "ICParseOperation.h"

typedef void (^operationCompletion)();

@protocol ICMapViewDelegate;

@interface ICMapViewController : UIViewController<ICParseDelegate>
@property (weak, nonatomic) id<ICMapViewDelegate> delegate;
@property (nonatomic, strong) KMLParser *kmlParser;
@property (nonatomic, copy) operationCompletion operationCompletionBlock;
@property (nonatomic, strong) NSMutableArray *overlays;

@end

@protocol ICMapViewDelegate <NSObject>

@property (weak, nonatomic) MKMapView *mapView;
-(NSArray*)countries;
-(NSArray*)oceans;
-(void)didCompleteOpeartionWithParsar:(ICParseOperation*)operation;
-(void)didTapOnOverlay:(MKPolygon*)overlay;
-(void)overlayForCountry:(NSString*)country;

@end