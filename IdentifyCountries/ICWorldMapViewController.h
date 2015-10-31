//
//  ViewController.h
//  IdentifyCountries
//
//  Created by Rachit on 9/18/15.
//  Copyright (c) 2015 Rachit. All rights reserved.
//

#import "ICMapViewController.h"

@interface ICWorldMapViewController : ICMapViewController<ICMapViewDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;


@end

