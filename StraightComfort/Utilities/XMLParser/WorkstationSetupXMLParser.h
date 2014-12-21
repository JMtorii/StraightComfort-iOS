//
//  WorkstationSetupXMLParser.h
//  StraightComfort
//
//  Created by Jun Torii on 2014-06-22.
//  Copyright (c) 2014 Jun Torii. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WorkstationSetupXMLParser : NSObject <NSXMLParserDelegate> {
    NSMutableString *curElem;
    NSMutableString *startingElem;
    NSMutableString *imageName;
    NSMutableString *pointDesc;
    NSMutableDictionary *descDictionary;
    NSMutableString *title;
    NSMutableDictionary *workstationSetupDictionary;
}

@property (nonatomic, retain) NSMutableString *curElem;
@property (nonatomic, retain) NSMutableString *startingElem;
@property (nonatomic, retain) NSMutableString *imageName;
@property (nonatomic, retain) NSMutableString *pointDesc;
@property (nonatomic, retain) NSMutableDictionary *descDictionary;
@property (nonatomic, retain) NSMutableString *title;
@property (nonatomic, retain) NSMutableDictionary *workstationSetupDictionary;

- (WorkstationSetupXMLParser*) initXMLParser;
- (NSMutableDictionary *) getDictionary;

@end
