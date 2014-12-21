//
//  WorkstationSetupXMLParser.m
//  StraightComfort
//
//  Created by Jun Torii on 2014-06-22.
//  Copyright (c) 2014 Jun Torii. All rights reserved.
//

#import "WorkstationSetupXMLParser.h"

@implementation WorkstationSetupXMLParser

@synthesize curElem = _curElem;
@synthesize startingElem = _startingElem;
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
    if ([elementName isEqualToString:@"workstationSetup"]) {
        workstationSetupDictionary = [[NSMutableDictionary alloc] init];
        startingElem = nil;
        
    } else if([elementName isEqualToString:@"allDesc"]) {
        descDictionary = [[NSMutableDictionary alloc] init];
        startingElem = nil;
        
    } else if([elementName isEqualToString:@"title"] || [elementName isEqualToString:@"descImage"] || [elementName isEqualToString:@"descPoint"]) {
        startingElem = [NSMutableString stringWithString:elementName];
        
    } else {
        startingElem = nil;
        
    }
    
    NSLog(@"didStartElement: %@", elementName);
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string 
{
    NSString *stringToDisplay = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if (!curElem && startingElem) {
        if (![stringToDisplay isEqual:@""]) {
            curElem = [[NSMutableString alloc] initWithString:stringToDisplay];
            NSLog(@"foundCharacters: %@", curElem);
        }
        
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName 
{
    if([elementName isEqualToString:@"workstationSetup"]){
        return;
    
    } else if([elementName isEqualToString:@"descImage"]) {
        imageName = curElem;
        curElem = nil;

    } else if([elementName isEqualToString:@"descPoint"]) {
        pointDesc = curElem;
        curElem = nil;

    } else if([elementName isEqualToString:@"descGroup"]) {
        [descDictionary setObject:pointDesc forKey:imageName];
        
    } else if([elementName isEqualToString:@"title"]) {
        title = curElem;
        curElem = nil;
        
    } else if([elementName isEqualToString:@"allDesc"]) {
        [workstationSetupDictionary setObject:descDictionary forKey:title];
        
    } else if([elementName isEqualToString:@"workstationGroup"]) {
        NSArray *keys = [workstationSetupDictionary allKeys];
        NSLog(@"Count: %d", (int)[keys count]);
        for (NSString *str in keys) {
            NSLog(@"%@", str);
        }
        
    }
    
}

- (NSMutableDictionary *) getDictionary
{
    return workstationSetupDictionary;
}

@end
