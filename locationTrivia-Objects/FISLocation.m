//
//  FISLocation.m
//  locationTrivia-Objects
//
//  Created by Ehsan Zaman on 6/14/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "FISLocation.h"

@interface FISLocation()

@end

@implementation FISLocation


- (instancetype) init {
    self = [self initWithName: @"" latitude:0 longitude: 0];
    
    return self;
}
- (instancetype) initWithName:(NSString*)name latitude:(CGFloat) latitude longitude: (CGFloat) longitude {
    self = [super init];
    
    if (self) {
        _name = name;
        _latitude = latitude;
        _longitude = longitude;
        _trivia = [NSMutableArray new];
    }
    return self;
}

- (NSString*) stringByTruncatingNameToLength: (NSUInteger) length {
    
    NSString *names = self.name;
    if (length > names.length){
        return names;
    }else{
        return [names substringToIndex:length];
    }
    return names;
    }


-(BOOL) hasValidData {
    if (self.name == nil)
        return NO;
    if (self.name.length == 0)
        return NO;
    if (self.latitude > 90.0 || self.latitude < -90.0)
        return NO;
    if (self.longitude > 180.0 || self.longitude <= -180.0)
        return NO;

    return YES;
}

- (FISTrivium*) triviumWithMostLikes{
   // NSString *numberOfLikes = self.trivia[1];
    if (!self.trivia || !self.trivia.count){
        return nil;
    }
    NSSortDescriptor *likes = [NSSortDescriptor sortDescriptorWithKey:@"likes" ascending:NO];
    NSArray *topLikes = [self.trivia sortedArrayUsingDescriptors:@[likes]];
    return topLikes[0];
        
}





@end