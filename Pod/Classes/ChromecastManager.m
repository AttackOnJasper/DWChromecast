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

@property(nonatomic) UIBarButtonItem *castButton;

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

#pragma mark - Accessors

- (NSTimeInterval)streamDuration {
    return self.mediaInformation.streamDuration;
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
    
    GCKFilterCriteria *filterCriteria = [GCKFilterCriteria criteriaForAvailableApplicationWithID: applicationID];
    
    self.deviceScanner = [[GCKDeviceScanner alloc] initWithFilterCriteria:filterCriteria];
    
    [self.deviceScanner addListener:self];
    [self.deviceScanner startScan];
    
}

- (void)connectToDevice:(GCKDevice *)device {
    NSLog(@"Connecting to device address: %@:%d", device.ipAddress, (unsigned int)device.servicePort);
    
    NSDictionary *info = [[NSBundle mainBundle] infoDictionary];
    NSString *appIdentifier = [info objectForKey:@"CFBundleIdentifier"];
    self.deviceManager =
    [[GCKDeviceManager alloc] initWithDevice:device clientPackageName:appIdentifier];
    self.deviceManager.delegate = self;
    [self.deviceManager connect];
    
    // Start animating the cast connect images.
}

- (void)setPlaybackPercent:(float)newPercent {
    newPercent = MAX(MIN(1.0, newPercent), 0.0);
    
    NSTimeInterval newTime = newPercent * self.streamDuration;
    if (newTime > 0 && _deviceManager.applicationConnectionState == GCKConnectionStateConnected) {
        [self.mediaControlChannel seekToTimeInterval:newTime];
    }
}

#pragma mark - Private helpers


#pragma mark - GCKDeviceManagerDelegate

#pragma mark - GCKLoggerDelegate
- (void)enableLogging {
    [[GCKLogger sharedInstance] setDelegate:self];
}

- (void)logFromFunction:(const char *)func message:(NSString *)mes {
    NSLog(@"%s  %@", func, mes);
}

#pragma mark - GCKMediaControlChannelDelegate


@end

