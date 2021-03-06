//  PROGRAMMER: Roberto Arciniegas
//  PANTHERID: 1385020
//  CLASS:          COP 465501 TR 5:00
//  INSTRUCTOR:     Steve Luis  ECS 282
//  ASSIGNMENT:     #4 Address Book
//  DUE:            Thursday 10/08/15
//
//  ViewController.m
//  Rarci003P4
//
//  Created by roberto arciniegas on 10/7/15.
//  Copyright (c) 2015 roberto arciniegas. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize nameText, emailText, myBook, myCard;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    myBook = [AddressBook alloc];
    myBook = [myBook initWithName: @"Roberto’s Address book"];
    
    NSString *aName = @"Julia Kochan";
    NSString *aEmail = @"jewls337@axlc.com";
    NSString *bName = @"Tony Iannino";
    NSString *bEmail = @"tony.iannino@techfitness.com";
    NSString *cName = @"Stephen Kochan";
    NSString *cEmail = @"steve@classroomM.com";

    AddressCard * card1 = [[AddressCard alloc] init];
    AddressCard * card2 = [[AddressCard alloc] init];
    AddressCard * card3 = [[AddressCard alloc] init];
    myCard = [[AddressCard alloc] init];

    // First set up three address cards
    [card1 setName: aName andEmail: aEmail];
    [card2 setName: bName andEmail: bEmail];
    [card3 setName: cName andEmail: cEmail];
  
    // Add some cards to the address book
    [myBook addCard: card1];
    [myBook addCard: card2];
    [myBook addCard: card3];

    // List the unsorted book [myBook list];
    // Sort it and list it again
    [myBook sort];
    [myBook list];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)newButton:(id)sender {
    nameText.text = @"";
    emailText.text = @"";
}

- (IBAction)updateButton:(id)sender {
    if (![nameText.text isEqualToString:@""]) {
        // set up address card
        myCard = [[AddressCard alloc] init];
        myCard = [myBook findName:nameText.text];

        if ([myBook.book containsObject:myCard])   {
            [myCard setName: nameText.text andEmail: emailText.text];
        }
        myCard = [myBook findEmail:emailText.text];
        
        if ([myBook.book containsObject:myCard])   {
            [myCard setName: nameText.text andEmail: emailText.text];
        }
        else   {
            AddressCard * newCard = [[AddressCard alloc] init];

            [newCard setName: nameText.text andEmail: emailText.text];

            [myBook addCard: newCard];
        }

        [myBook sort];
        [myBook list];
    }
}

- (IBAction)prevButton:(id)sender {
    if ([myBook entries] > 0){
        myCard = [myBook findName:nameText.text];

        NSUInteger index = [myBook.book indexOfObject:myCard];
        if ((index > [myBook entries] ) || (index < 1))
            index = [myBook entries];

        index--;
        myCard = [myBook.book objectAtIndex:index];
        
        nameText.text = [myCard name];
        emailText.text = [myCard email];
    }
}

- (IBAction)nextButton:(id)sender {
    if ([myBook entries] > 0){
        myCard = [myBook findName:nameText.text];
        NSUInteger index = [myBook.book indexOfObject:myCard] + 1;
        if (index > [myBook entries] - 1 ) {
            index = 0;
        }
        myCard = [myBook.book objectAtIndex:index];
 
        nameText.text = [myCard name];
        emailText.text = [myCard email];
    }
}

- (IBAction)deleteButton:(id)sender {
    
    // set up address card
    [myCard setName: nameText.text andEmail: emailText.text];
    
    // Add card to the address book
    [myBook removeCard:myCard];
    nameText.text = @"";
    emailText.text = @"";
    [myBook sort2];
    [myBook list];
}
@end
