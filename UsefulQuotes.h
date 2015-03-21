//
//  UsefulQuotes.h
//  RussianDzen
//
//  Created by Taras Murzenkov on 22.12.14.
//
//
#import <Foundation/Foundation.h>
@class UsefulQuotes;

@interface UsefulQuotes : NSObject
-(NSString*)getUSDRURQuote;
-(NSString*)getEURRURQuote;
-(NSString*)getBrentQuote;
-(NSString*)formattedOutput:(NSString*)input;
@end
