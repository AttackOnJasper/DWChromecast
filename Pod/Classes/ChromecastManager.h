//
//  ChromecastManager.h
//  Pods
//
//  Created by Jasper Wang on 15/10/1.
//
//

#import <Foundation/Foundation.h>
#import <GoogleCast/GCKDeviceScanner.h>
#import <GoogleCast/GCKMediaStatus.h>

@class GCKDevice;
@class GCKDeviceManager;
@class GCKMediaControlChannel;
@class GCKMediaInformation;

#pragma mark - CastDeviceControllerDelegate

@protocol CastDeviceControllerDelegate <NSObject>

@optional

/**
 * Called when connection to the device was established.
 *
 * @param device The device to which the connection was established.
 */
- (void)didConnectToDevice:(GCKDevice *)device;

/**
 *  Called when the device disconnects.
 */
- (void)didDisconnect;

/**
 *  Initialize device scan
 */

- (void)initScan:(NSString *)applicationID;

/**
 * Called when Cast devices are discoverd on the network.
 */
- (void)didDiscoverDeviceOnNetwork;

/**
 * Called when the connected device's queue updates.
 */
- (void)didUpdateQueueForDevice:(GCKDevice *)device;

/**
 *  Called when the next item in a queue starts preloading.
 *
 *  @param item GCKMediaQueueItem
 */
- (void)didUpdatePreloadStatusForItem:(GCKMediaQueueItem *)item;

/**
 *  Whether or not the device controller should be displayed.
 *
 *  @return YES to display, NO to prevent.
 */
- (BOOL)shouldDisplayModalDeviceController;

@end

#pragma mark - Interface

@interface ChromecastManager : NSObject <GCKDeviceScannerListener>

+ (instancetype)sharedInstance;

@property(nonatomic, weak) id<CastDeviceControllerDelegate> delegate;

/**
 *  The device manager used to manage a connection to a Cast device.
 */
@property(nonatomic, strong) GCKDeviceManager *deviceManager;

/**
 *  The device scanner used to detect devices on the network.
 */
@property(nonatomic, strong) GCKDeviceScanner *deviceScanner;

/**
 *  The media control channel for the playing media.
 */
@property(nonatomic, strong) GCKMediaControlChannel *mediaControlChannel;

/**
 *  Display the media currently being cast.
 */
- (void)displayCurrentlyPlayingMedia;

/**
 *  Sets the position of the playback on the Cast device.
 *
 *  @param newPercent 0.0-1.0
 */
- (void)setPlaybackPercent:(float)newPercent;

/**
 *  Connect to the given Cast device.
 *
 *  @param device A GCKDevice from the deviceScanner list.
 */
- (void)connectToDevice:(GCKDevice *)device;

/**
 *  Enable basic logging of all GCKLogger messages to the console.
 */
- (void)enableLogging;

@end

