//
//  SEGFirebaseIntegrationFactory.m
//  Pods
//

#import "SEGFirebaseIntegrationFactory.h"
#import "SEGFirebaseIntegration.h"


@implementation SEGFirebaseIntegrationFactory

+ (instancetype)instance
{
    static dispatch_once_t once;
    static SEGFirebaseIntegrationFactory *sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (id)init
{
    self = [super init];
    return self;
}

- (id<SEGIntegration>)createWithSettings:(NSDictionary *)settings forAnalytics:(SEGAnalytics *)analytics
{
    __block SEGFirebaseIntegration* integration;
    dispatch_sync(dispatch_get_main_queue(), ^{
        integration = [[SEGFirebaseIntegration alloc] initWithSettings:settings];
    });
    return integration;
}

- (NSString *)key
{
    return @"Firebase";
}

@end
