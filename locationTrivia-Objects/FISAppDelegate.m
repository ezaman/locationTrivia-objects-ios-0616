//  FISAppDelegate.m

#import "FISAppDelegate.h"
#import "FISLocation.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

- (NSArray*) allLocationNames {
    
    NSMutableArray *locationNames = [[NSMutableArray alloc]init];
    
    for(FISLocation *location in self.locations)
    {
        [locationNames addObject:location.name];
    }
    
    return locationNames;
}

- (FISLocation*) locationNamed: (NSString*) name{
    FISLocation *locationOfPlaces = [[FISLocation alloc]init];
    for (FISLocation *places in self.locations) {
        if ([places.name isEqualToString:name]){
            return locationOfPlaces = places;
        }
    }
    return nil;
}

- (NSArray*) locationsNearLatitude: (CGFloat) latitude longitude: (CGFloat) longitude margin: (CGFloat) margin{
    NSMutableArray *locationsInNYC = [[NSMutableArray alloc]init];
    for (FISLocation *location in self.locations) {
        if (location.latitude >= longitude - margin && location.latitude <= latitude + margin && location.longitude >= longitude - margin && location.longitude <= longitude + margin) {
            [locationsInNYC addObject:location];
        }
    }
    
    
    return locationsInNYC;
}


@end
