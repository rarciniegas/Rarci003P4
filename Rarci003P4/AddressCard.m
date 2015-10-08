//
//  AddressCard.m
//  Rarci003P4
//
//  Created by roberto arciniegas on 10/7/15.
//  Copyright (c) 2015 roberto arciniegas. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AddressCard.h"

@implementation AddressCard

@synthesize name, email;

-(void) setName: (NSString *) theName andEmail: (NSString *) theEmail
{
    self.name = theName;
    self.email = theEmail;
}

// Compare the two names from the specified address cards
-(NSComparisonResult) compareNames: (id) element
{
    return [name compare: [element name]];
}

-(void) print
{
    NSLog (@"====================================");
    NSLog (@"|                                  |");
    NSLog (@"| %-31s |", [name UTF8String]);
    NSLog (@"| %-31s |", [email UTF8String]);
    NSLog (@"|                                  |");
    NSLog (@"|                                  |");
    NSLog (@"|                                  |");
    NSLog (@"|                                  |");
    NSLog (@"====================================");
}

-(id) copyWithZone: (NSZone *) zone
{
    id newCard = [[[self class] allocWithZone: zone] init];
    
    [newCard assignName: name andEmail: email];
    return newCard;
}

-(void) assignName: (NSString *) theName andEmail: (NSString *) theEmail
{
    name = theName;
    email = theEmail;
}

-(void) encodeWithCoder: (NSCoder *) encoder
{
    [encoder encodeObject: name forKey: @"AddressCardName"];
    [encoder encodeObject: email forKey: @"AddressCardEmail"];
}

-(id) initWithCoder: (NSCoder *) decoder
{
    name = [decoder decodeObjectForKey: @"AddressCardName"];
    email = [decoder decodeObjectForKey: @"AddressCardEmail"];
    return self;
}

@end