//
//  AddressBook.h
//  Rarci003P4
//
//  Created by roberto arciniegas on 10/7/15.
//  Copyright (c) 2015 roberto arciniegas. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AddressCard.h"

@interface AddressBook: NSObject <NSCopying, NSCoding>

@property (nonatomic, copy) NSString *bookName;
@property (nonatomic, strong) NSMutableArray *book;

-(id) initWithName: (NSString *) name;
-(void) sort;
-(void) sort2;
-(void) addCard: (AddressCard *) theCard;
-(void) removeCard: (AddressCard *) theCard; -(NSUInteger) entries;
-(void) list;
-(AddressCard *) lookup: (NSString *) theName;

@end
