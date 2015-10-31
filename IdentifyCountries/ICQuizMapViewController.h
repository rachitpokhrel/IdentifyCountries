//
//  ICQuizMapViewController.h
//  IdentifyCountries
//
//  Created by Rachit on 10/28/15.
//  Copyright © 2015 Rachit. All rights reserved.
//

#import "ICMapViewController.h"

@interface ICQuizMapViewController : ICMapViewController<ICMapViewDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end
