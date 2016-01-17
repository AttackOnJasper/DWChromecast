//
//  ChromecastManager.h
//  Pods
//
//  Created by Jasper Wang on 15/10/1.
//
//

#import <Foundation/Foundation.h>
#import <GoogleCast/GCKCastChannel.h>

@interface ChromecastManager : NSObject

@property (strong, nonatomic) GCKCastChannel *castChannel;

@end
