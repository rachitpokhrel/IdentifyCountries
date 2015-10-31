//
//  ViewController.m
//  IdentifyCountries
//
//  Created by Rachit on 9/18/15.
//  Copyright (c) 2015 Rachit. All rights reserved.
//

#import "ICWorldMapViewController.h"
#import "MBProgressHUD.h"
#import "ICMaps.h"

@interface ICWorldMapViewController ()
@property (nonatomic, strong) MKPolygon *tappedOverlay;
@property (nonatomic, strong) ICMaps *maps;
@property (nonatomic, strong) MBProgressHUD *hud;

@end


@implementation ICWorldMapViewController

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


- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    self.delegate.mapView = self.mapView;
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
    return self.maps.countries;
}

-(NSArray*)oceans
{
    return self.maps.oceans;
}

-(void)didTapOnOverlay:(MKPolygon *)overlay
{
    self.tappedOverlay = overlay;
}

-(void)overlayForCountry:(NSString *)country
{
    self.navigationItem.title = country;
}

-(void)didCompleteOpeartionWithParsar:(ICParseOperation *)operation
{
    
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
    
}

- (void)mapViewDidFinishLoadingMap:(MKMapView *)mapView
{
    [self.hud hide:YES];
}

@end
