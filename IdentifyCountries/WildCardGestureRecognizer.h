//
//  WildCardGestureRecognizer.h
//  IdentifyCountries
//
//  Created by Rachit on 10/27/15.
//  Copyright © 2015 Rachit. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^TouchesEventBlock)(NSSet * touches, UIEvent * event);

@interface WildCardGestureRecognizer : UIGestureRecognizer {
    TouchesEventBlock touchesBeganCallback;
}
@property(copy) TouchesEventBlock touchesBeganCallback;


@end
