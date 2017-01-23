//
//  ServiceListener.m
//  menu
//
//  Created by palaniraja on 15/01/17.
//  Copyright © 2017 palaniraja. All rights reserved.
//
#import <AppKit/AppKit.h>
#import "ServiceListener.h"

@implementation ServiceListener

- (void)serviceListener:(NSPasteboard *)pboard
          userData:(NSString *)userData
             error:(NSString **)error
{
    NSString *pboardString;
    NSArray *types;
    
    types = [pboard types];
    if (![types containsObject:NSStringPboardType]) {
        *error = NSLocalizedString(@"Error: couldn't encrypt text.",
                                   @"pboard couldn't give string.");
        return;
    }
    pboardString = [pboard stringForType:NSStringPboardType];
    if (!pboardString) {
        *error = NSLocalizedString(@"Error: couldn't encrypt text.",
                                   @"pboard couldn't give string.");
        return;
    }
    
    // do something with pboardString and have
    
    NSAlert *alert = [NSAlert alertWithMessageText:@"Service" defaultButton:@"Ok" alternateButton:@"Cancel" otherButton:nil informativeTextWithFormat:pboardString];
    [alert runModal];
    
    
    return;
}


@end
