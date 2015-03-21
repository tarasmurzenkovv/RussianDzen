//
//  AppDelegate.m
//  RussianDzen
//
//  Created by Taras Murzenkov on 21.12.14.
//
//
#import "UsefulQuotes.h"
#import "Player.h"
#import "UsefulQuotes.h"
#import <UIKit/UIKit.h>
#import "Player.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (strong, nonatomic) UIWindow *window;
@end

@implementation AppDelegate
{
    UsefulQuotes* uq;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    return YES;
}
- (void)applicationWillResignActive:(UIApplication *)application
{
    [[Player sharedInstance] stopPlaying];
}
- (void)applicationDidEnterBackground:(UIApplication *)application
{
    [[Player sharedInstance] stopPlaying];
}
- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}
- (void)applicationDidBecomeActive:(UIApplication *)application
{
    [[Player sharedInstance] playFile];
}
- (void)applicationWillTerminate:(UIApplication *)application
{
    [[NSUserDefaults standardUserDefaults] setBool:true forKey:@"waslaunched"];
    [[NSUserDefaults standardUserDefaults] setObject:[uq getBrentQuote] forKey:@"oil"];
    [[NSUserDefaults standardUserDefaults] setObject:[uq getUSDRURQuote] forKey:@"usd"];
    [[NSUserDefaults standardUserDefaults] setObject:[uq getEURRURQuote] forKey:@"eur"];
}
@end
