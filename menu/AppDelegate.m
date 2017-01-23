//
//  AppDelegate.m
//  menu
//
//  Created by palaniraja on 15/01/17.
//  Copyright © 2017 palaniraja. All rights reserved.
//

#import "AppDelegate.h"
#import "ServiceListener.h"
#import "EncryptoClass.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    
//    ServiceListener *slistener;
//    slistener = [[ServiceListener alloc] init];
//    [NSApp setServicesProvider:slistener];
    
    
    EncryptoClass *encryptor;
    encryptor = [[EncryptoClass alloc] init];
    [NSApp setServicesProvider:encryptor];
    NSUpdateDynamicServices();
    
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
