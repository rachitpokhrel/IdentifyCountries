//
//  ICMapViewController.m
//  IdentifyCountries
//
//  Created by Rachit on 10/30/15.
//  Copyright © 2015 Rachit. All rights reserved.
//

#import "ICMapViewController.h"
#import "WildCardGestureRecognizer.h"
#import "ICParseOperation.h"
#import "ICMaps.h"



@interface ICMapViewController()
@property (nonatomic, strong) NSMutableArray *names;
@property (nonatomic, strong) NSMutableArray *oceanOverlays;
@property (nonatomic, strong) NSOperationQueue *operationQueue;

@end

@implementation ICMapViewController

-(NSOperationQueue *)operationQueue
{
    if (!_operationQueue){
        _operationQueue = [[NSOperationQueue alloc] init];
        _operationQueue.name = @"Parse Operation Queue";
        _operationQueue.maxConcurrentOperationCount = 10;
    }
    return _operationQueue;
}

-(NSMutableArray *)names
{
    if (!_names){
        _names = [[NSMutableArray alloc] init];
    }
    return _names;
}

-(NSMutableArray *)overlays
{
    if (!_overlays){
        _overlays = [[NSMutableArray alloc] init];
    }
    return _overlays;
}

-(NSMutableArray *)oceanOverlays
{
    if (!_oceanOverlays){
        _oceanOverlays = [[NSMutableArray alloc] init];
    }
    return _oceanOverlays;
}

-(void)addOverlaysForCountries:(NSArray *)countries oceans:(NSArray *)oceans
{
    for (ICCountry *country in countries){
        ICParseOperation *operation = [[ICParseOperation alloc] initWithCountry:country.name delegate:self];
        [self.operationQueue addOperation:operation];
    }
    
    for (ICOcean *ocean in oceans){
        ICParseOperation *operation = [[ICParseOperation alloc] initWithCountry:ocean.name delegate:self];
        operation.ocean = YES;
        [self.operationQueue addOperation:operation];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.names = nil;
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self addOverlaysForCountries:[self.delegate countries] oceans:[self.delegate oceans]];
    [self addWildCardGestureRecognizer];
}

#pragma mark scroll view delegates
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.operationQueue setSuspended:YES];
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (!decelerate){
        [self addOverlaysForOnscreenCountries];
        [self.operationQueue setSuspended:NO];
    }
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self addOverlaysForOnscreenCountries];
    [self.operationQueue setSuspended:NO];
}

-(void)addOverlaysForOnscreenCountries
{
    
}

-(void)didCompleteOperationWithParser:(ICParseOperation *)operation
{
    self.kmlParser = operation.parser;
    NSArray *overlays = [operation.parser overlays];
    [self.delegate.mapView addOverlays:overlays];
    [overlays enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self.overlays addObject:obj];
        [self.names addObject:operation.country];
        if (operation.isOcean)
        {
            id view = [self.delegate.mapView rendererForOverlay:(MKPolygon*)obj];
            ((MKPolygonRenderer*)view).fillColor = [UIColor colorWithRed:0.694 green:0.878 blue:0.969 alpha:1];
            ((MKPolygonRenderer*)view).strokeColor = [UIColor colorWithRed:0.694 green:0.878 blue:0.969 alpha:1];
            [self.oceanOverlays addObject:obj];
        }
        
    }];
    if (!operation.isOcean)
        [self.delegate didCompleteOpeartionWithParsar:operation];
    
}

-(void)addWildCardGestureRecognizer
{
    WildCardGestureRecognizer * tapInterceptor = [[WildCardGestureRecognizer alloc] init];
    tapInterceptor.touchesBeganCallback = ^(NSSet * touches, UIEvent * event) {
        UITouch *touch = [touches anyObject];
        CGPoint point = [touch locationInView:self.delegate.mapView];
        
        CLLocationCoordinate2D coord = [self.delegate.mapView convertPoint:point toCoordinateFromView:self.delegate.mapView];
        MKMapPoint mapPoint = MKMapPointForCoordinate(coord);
        for (id overlay in self.delegate.mapView.overlays)
        {
            if ([overlay isKindOfClass:[MKPolygon class]])
            {
                MKPolygon *poly = (MKPolygon*) overlay;
                id view = [self.delegate.mapView rendererForOverlay:poly];
                if ([view isKindOfClass:[MKPolygonRenderer class]])
                {
                    MKPolygonRenderer *polyView = (MKPolygonRenderer*) view;
                    CGPoint polygonViewPoint = [polyView pointForMapPoint:mapPoint];
                    BOOL mapCoordinateIsInPolygon = CGPathContainsPoint(polyView.path, NULL, polygonViewPoint, NO);
                    NSUInteger index = [self.delegate.mapView.overlays indexOfObject:overlay];
                    NSString *country = self.names[index];
                    
                    if (mapCoordinateIsInPolygon) {
                        if (![self.oceanOverlays containsObject:overlay]){
                            [self.delegate didTapOnOverlay:overlay];
                            [self.delegate overlayForCountry:country];
                        }
                    } else {
                        //if (![self.oceanOverlays containsObject:overlay] && [self.tappedOverlay isEqual:overlay])
                        //polyView.fillColor = [UIColor whiteColor];
                        
                    }
                }
            }
        }
        
    };
    [self.delegate.mapView addGestureRecognizer:tapInterceptor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
