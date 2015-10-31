//
//  ICQuizMapViewController.m
//  IdentifyCountries
//
//  Created by Rachit on 10/28/15.
//  Copyright © 2015 Rachit. All rights reserved.
//

#import "ICQuizMapViewController.h"
#import "ICMaps.h"
#import "MBProgressHUD.h"

@interface ICQuizMapViewController()

@property (nonatomic, strong) MKPolygon *tappedOverlay;
@property (nonatomic, strong) ICMaps *maps;
@property (nonatomic, strong) NSArray *randomRegion;
@property (nonatomic, strong) NSString *tapOnCountry;
@property (nonatomic, assign) MKMapRect flyTo;
@property (nonatomic, strong) MBProgressHUD *hud;


@end

@implementation ICQuizMapViewController

-(ICMaps *)maps
{
    if (!_maps){
        _maps = [[ICMaps alloc] init];
    }
    return _maps;
}

-(void)setTappedOverlay:(MKPolygon *)tappedOverlay
{
    if (_tappedOverlay){
        id _view = [self.mapView rendererForOverlay:_tappedOverlay];
        ((MKPolygonRenderer*)_view).fillColor = [UIColor whiteColor];
    }
    
    id view = [self.mapView rendererForOverlay:tappedOverlay];
    ((MKPolygonRenderer*)view).fillColor = [UIColor redColor];
    
    _tappedOverlay = tappedOverlay;
    
}

-(void)selectCountryInRandomRegion:(NSArray*)randomRegion
{
    NSUInteger index = arc4random_uniform((u_int32_t)self.randomRegion.count);
    ICCountry *country = randomRegion[index];
    self.tapOnCountry = country.name;
    self.navigationItem.title = [NSString stringWithFormat:@"Tap on %@",country.name];
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.flyTo = MKMapRectNull;
    self.delegate = self;
    self.delegate.mapView = self.mapView;
    self.randomRegion = self.maps.randomRegion;
    [self selectCountryInRandomRegion:self.randomRegion[0]];
    UIBarButtonItem *bbitem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(nextQuestion:)];
    self.navigationItem.rightBarButtonItem = bbitem;
    self.hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    self.hud.mode = MBProgressHUDModeAnnularDeterminate;
    self.hud.labelText = @"Loading...";
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark ICMapViewDelegate


-(NSArray *)countries
{
    return self.randomRegion[0];
}

-(NSArray*)oceans
{
    return self.randomRegion[1];
}

-(void)didTapOnOverlay:(MKPolygon *)overlay
{
    self.tappedOverlay = overlay;
}

-(void)overlayForCountry:(NSString *)country
{
    NSLog(@"%@%@",self.tapOnCountry,country);
    if ([self.tapOnCountry isEqualToString:country])
    {
        self.navigationItem.title = @"Correct";
        id _view = [self.mapView rendererForOverlay:_tappedOverlay];
        ((MKPolygonRenderer*)_view).fillColor = [UIColor greenColor];
        
    }else{
        self.navigationItem.title = @"Incorrect";
    }
    
}

-(void)didCompleteOpeartionWithParsar:(ICParseOperation *)operation
{
    NSArray *overlays = [operation.parser overlays];
    [overlays enumerateObjectsUsingBlock:^(id <MKOverlay> _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (!operation.isOcean)
        {
            if (MKMapRectIsNull(self.flyTo)) {
                self.flyTo = [obj boundingMapRect];
            } else {
                self.flyTo = MKMapRectUnion(self.flyTo, [obj boundingMapRect]);
            }
        }
    }];
    // Position the map so that all overlays and annotations are visible on screen.
    UIEdgeInsets inset = UIEdgeInsetsZero;
    self.mapView.visibleMapRect = [self.mapView mapRectThatFits:self.flyTo edgePadding:inset];
}

#pragma mark map view delegates
- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay {
    return [super.kmlParser rendererForOverlay:overlay];
}



- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    return [super.kmlParser viewForAnnotation:annotation];
}

- (void)mapViewDidFinishRenderingMap:(MKMapView *)mapView fullyRendered:(BOOL)fullyRendered
{
    [self.hud hide:YES];
}

- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated
{
    [self.hud hide:YES];
}

- (void)nextQuestion:(id)sender {
    self.tappedOverlay = nil;
    self.randomRegion = nil;
    self.maps = nil;
    self.tapOnCountry = nil;
    self.delegate = nil;
    [self.mapView removeOverlays:self.overlays];
    [self viewDidLoad];
    [self viewWillAppear:YES];
}
@end
