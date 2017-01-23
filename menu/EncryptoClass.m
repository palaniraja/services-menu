//
//  EncryptoClass.m
//  menu
//
//  Created by palaniraja on 15/01/17.
//  Copyright © 2017 palaniraja. All rights reserved.
//

#import "EncryptoClass.h"

@implementation EncryptoClass
- (void)simpleEncrypt:(NSPasteboard *)pboard
             userData:(NSString *)userData error:(NSString **)error {
    
    // Test for strings on the pasteboard.
    NSArray *classes = [NSArray arrayWithObject:[NSString class]];
    NSDictionary *options = [NSDictionary dictionary];
    
    if (![pboard canReadObjectForClasses:classes options:options]) {
        *error = NSLocalizedString(@"Error: couldn't encrypt text.",
                                   @"pboard couldn't give string.");
        return;
    }
    
    // Get and encrypt the string.
    NSString *pboardString = [pboard stringForType:NSPasteboardTypeString];
    NSString *newString = [self rotateLettersInString:pboardString];
    if (!newString) {
        *error = NSLocalizedString(@"Error: couldn't encrypt text.",
                                   @"self couldn't rotate letters.");
        return;
    }
    
    // Write the encrypted string onto the pasteboard.
    [pboard clearContents];
    [pboard writeObjects:[NSArray arrayWithObject:newString]];
}


- (NSString *)rotateLettersInString:(NSString *)aString {
    NSString *newString;
    NSUInteger length;
    unichar *buf;
    unsigned i;
    
    length = [aString length];
    buf = malloc( (length + 1) * sizeof(unichar) );
    [aString getCharacters:buf];
    buf[length] = (unichar)0; // not really needed....
    for (i = 0; i < length; i++) {
        if (buf[i] >= (unichar)'a' && buf[i] <= (unichar) 'z') {
            buf[i] += 13;
            if (buf[i] > 'z') buf[i] -= 26;
        } else if (buf[i] >= (unichar)'A' && buf[i] <= (unichar) 'Z') {
            buf[i] += 13;
            if (buf[i] > 'Z') buf[i] -= 26;
        }
    }
    newString = [NSString stringWithCharacters:buf length:length];
    free(buf);
    return newString;
}


@end
