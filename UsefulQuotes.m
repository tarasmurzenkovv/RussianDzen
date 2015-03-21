//
//  UsefulQuotes.m
//  RussianDzen
//
//  Created by Taras Murzenkov on 22.12.14.
//
//

#import "UsefulQuotes.h"
#import <Foundation/Foundation.h>

@interface UsefulQuotes : NSObject
-(NSString*)getUSDRURQuote;
-(NSString*)getEURRURQuote;
-(NSString*)getBrentQuote;
-(NSString*)formattedOutput:(NSString*)input;
@end
@class UsefulQuotes;

@implementation UsefulQuotes
-(NSString*)formattedOutput:(NSString *)input
{
    return [NSString stringWithFormat:@"%0.2f", [input doubleValue]];
}
-(NSString*)getUSDRURQuote
{
    NSString *str=@"https://query.yahooapis.com/v1/public/yql?q=select+*+from+yahoo.finance.xchange+where+pair+=+%22USDRUB%22&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys&callback=";
    NSURL *url=[NSURL URLWithString:str];
    NSURLRequest *theRequest=[NSURLRequest requestWithURL:url
                                              cachePolicy:NSURLRequestUseProtocolCachePolicy
                                          timeoutInterval:5.0];
    
    NSData *data = [NSURLConnection sendSynchronousRequest:theRequest
                                         returningResponse:nil
                                                     error:nil];
    if(data)
    {
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data
                                                                   options:kNilOptions
                                                                     error:nil];
        
        NSDictionary* results =[dictionary valueForKey:@"query"];
        NSDictionary* rate_params=[results valueForKey:@"results"];
        NSDictionary* current_rate_params=[rate_params valueForKey:@"rate"];
        return [self formattedOutput:[current_rate_params valueForKey:@"Rate"]];
    }
    else
    {
        return @"Oops";
    }
}
-(NSString* )getEURRURQuote
{
    NSString *str=@"https://query.yahooapis.com/v1/public/yql?q=select+*+from+yahoo.finance.xchange+where+pair+=+%22EURRUB%22&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys&callback=";
    NSURL *url=[NSURL URLWithString:str];
    NSURLRequest *theRequest=[NSURLRequest requestWithURL:url
                                              cachePolicy:NSURLRequestUseProtocolCachePolicy
                                          timeoutInterval:5.0];
    
    NSData *data = [NSURLConnection sendSynchronousRequest:theRequest
                                         returningResponse:nil
                                                     error:nil];
    if(data)
    {
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data
                                                                   options:kNilOptions
                                                                     error:nil];
        
        NSDictionary* results =[dictionary valueForKey:@"query"];
        NSDictionary* rate_params=[results valueForKey:@"results"];
        NSDictionary* current_rate_params=[rate_params valueForKey:@"rate"];
        return [self formattedOutput:[current_rate_params valueForKey:@"Rate"]];
    }
    else
    {
        return @"Oops";
        
    }
}
-(NSString* )getBrentQuote
{
    NSString *str=@"https://www.quandl.com/api/v1/datasets/DOE/RBRTE.json?auth_token=V9WBcicJiUydWSkb4o9s";
    NSURL *url=[NSURL URLWithString:str];
    NSURLRequest *theRequest=[NSURLRequest requestWithURL:url
                                              cachePolicy:NSURLRequestUseProtocolCachePolicy
                                          timeoutInterval:5.0];
    
    NSData *data = [NSURLConnection sendSynchronousRequest:theRequest
                                         returningResponse:nil
                                                     error:nil];
    
    if(data)
    {
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data
                                                                   options:kNilOptions
                                                                     error:nil];
        
        NSArray* data=[dictionary valueForKey:@"data"];
        NSArray* latest_data=data[1];
        
        return [self formattedOutput:latest_data[1]];
    }
    else
    {
        return @"Oops";
    }
}
@end
