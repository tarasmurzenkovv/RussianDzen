//
//  Player.m
//  RussianDzen
//
//  Created by Taras Murzenkov on 18.01.15.
//
//

#import "Player.h"
#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
@interface Player : NSObject
+(Player*)returnSharedInstance;
-(id)init:(NSString*)nameOfFileToPlay;
-(void)playFile;
-(void)stopPlaying;
@end

@class Player;

@implementation Player
{
    AVAudioPlayer* player;
}
static Player* my_player;
+(Player*)returnSharedInstance
{
    if (my_player==nil)
    {
        my_player=[[self alloc] init:@"/Anima_-_05_-_The_Waning_Moon.mp3"];
    }
    return my_player;
}
-(id)init:(NSString *)nameOfFileToPlay
{
    NSString* resourcePath = [[NSBundle mainBundle] resourcePath];
    resourcePath = [resourcePath stringByAppendingString:nameOfFileToPlay];
    
    NSLog(@"Path to play: %@", resourcePath);
    NSError* err;
    
    player = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:resourcePath]
                                                     error:&err];
    if( err )
    {
        NSLog(@"Failed with reason: %@", [err localizedDescription]);
    }
    return self;
    
}
-(void)playFile
{
    [player play];
    player.numberOfLoops = -1;
    player.currentTime = 0;
    player.volume = 1.0;
}
-(void)stopPlaying
{
    [player stop];
}

@end
