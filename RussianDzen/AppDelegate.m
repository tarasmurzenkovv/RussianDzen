//
//  AppDelegate.m
//  RussianDzen
//
//  Created by Taras Murzenkov on 21.12.14.
//
//

#import "AppDelegate.h"
#import "UsefulQuotes.h"
#import "Player.h"

@interface AppDelegate ()
@end
@class Player;

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [[Player ret]]
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    [[Player returnSharedInstance] stopPlaying];
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    [[Player returnSharedInstance] stopPlaying];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    [[Player returnSharedInstance] playFile];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    [[NSUserDefaults standardUserDefaults] setBool:true forKey:@"waslaunched"];
    [[NSUserDefaults standardUserDefaults] setObject:[_uq getBrentQuote] forKey:@"oil"];
    [[NSUserDefaults standardUserDefaults] setObject:[_uq getUSDRURQuote] forKey:@"usd"];
    [[NSUserDefaults standardUserDefaults] setObject:[_uq getEURRURQuote] forKey:@"eur"];
}

@end
