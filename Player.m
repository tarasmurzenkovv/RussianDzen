//
//  Player.m
//  RussianDzen
//
//  Created by Taras Murzenkov on 18.01.15.
//
//
#import "Player.h"

@implementation Player
{
    AVAudioPlayer* player;
}
+(Player*)sharedInstance
{
    static Player* my_player=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^
    {
        my_player = [[self alloc] init:@"/Anima_-_05_-_The_Waning_Moon.mp3"];
    });
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
