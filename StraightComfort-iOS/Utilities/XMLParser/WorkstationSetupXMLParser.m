//
//  WorkstationSetupXMLParser.m
//  StraightComfort-iOS
//
//  Created by Jun Torii on 2014-06-22.
//  Copyright (c) 2014 Jun Torii. All rights reserved.
//

#import "WorkstationSetupXMLParser.h"

@implementation WorkstationSetupXMLParser

@synthesize curElem = _curElem;
@synthesize imageName = _imageName;
@synthesize pointDesc = _pointDesc;
@synthesize descDictionary = _descDictionary;
@synthesize title = _title;
@synthesize workstationSetupDictionary = _workstationSetupDictionary;

- (WorkstationSetupXMLParser *)initXMLParser 
{
    return self;
}

-(void) parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict
{
    if([elementName isEqualToString:@"Books"]) {
        //Initialize the array.
//        appdelegate.books = [[NSMutableArray alloc] init];
    }
    else if([elementName isEqualToString:@"Book"]) {
        
        //Initialize the book.
//        book = [[Book alloc] init];
        
        //Extract the attribute here.
//        book.bookID = [[attributeDict objectForKey:@"id"] integerValue];
        
//        NSLog(@"Reading id value :%i", book.bookID);
    }
    
    NSLog(@"Processing Element: %@", elementName);
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    
    if(!curElem)
        curElem = [[NSMutableString alloc] initWithString:string];
    else
        [curElem appendString:string];
    
    NSLog(@"Processing Value: %@", curElem);
    
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    
    if([elementName isEqualToString:@"Books"])
        return;
    
    if([elementName isEqualToString:@"Book"]) {
//        [appdelegate.books addObject:book];
        
//        [book release];
//        book = nil;
    }
    else
//        [book setValue:curElem forKey:elementName];
    
//    [curElem release];
    curElem = nil;
}

@end
