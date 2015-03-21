//
//  Player.h
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
