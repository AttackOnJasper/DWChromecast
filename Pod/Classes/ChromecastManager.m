//
//  ChromecastManager.m
//  Pods
//
//  Created by Jasper Wang on 15/10/1.
//
//

#import "ChromecastManager.h"
#import <GoogleCast/GoogleCast.h>

@interface ChromecastManager() <GCKDeviceManagerDelegate,
GCKLoggerDelegate, GCKMediaControlChannelDelegate>

@property (strong, nonatomic) NSString *applicationID;

@end

@implementation ChromecastManager

- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)dealloc {

}

#pragma mark - Public methods

+ (instancetype)sharedInstance {
    static dispatch_once_t p = 0;
    __strong static id _sharedChromecastManager = nil;
    
    dispatch_once(&p, ^{
        _sharedChromecastManager = [[self alloc] init];
    });
    
    return _sharedChromecastManager;
}

- (void)initScan:(NSString *)applicationID {
    self.applicationID = applicationID;
    
//    GCKFilterCriteria *filterCriteria = [GCKFilterCriteria criteriaForAvailableApplicationWithID: applicationID];
//    
//    self.deviceScanner = [[GCKDeviceScanner alloc] initWithFilterCriteria:filterCriteria];
//    
//    [self.deviceScanner addListener:self];
//    [self.deviceScanner startScan];
    
}

#pragma mark - Private helpers


#pragma mark - GCKDeviceManagerDelegate

#pragma mark - GCKLoggerDelegate

#pragma mark - GCKMediaControlChannelDelegate


@end
