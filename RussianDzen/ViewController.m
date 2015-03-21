//
//  ViewController.m
//  RussianDzen
//
//  Created by Taras Murzenkov on 21.12.14.
//
//

#import "ViewController.h"
#import "Player.h"
#import "UsefulQuotes.h"
#import <UIKit/UIKit.h>

#define CURRENT_DEVICE    UI_USER_INTERFACE_IDIOM()
#define IPAD              UIUserInterfaceIdiomPad
#define IPHONE            UIUserInterfaceIdiomPhone
#define IS_IPHONE_4       (fabs((double)[[UIScreen mainScreen]bounds].size.height - (double)480) < DBL_EPSILON)
#define IS_IPHONE_5       (fabs((double)[[UIScreen mainScreen]bounds].size.height - (double)568) < DBL_EPSILON)
#define IS_IPHONE_6       (fabs((double)[[UIScreen mainScreen]bounds].size.height - (double)667) < DBL_EPSILON)
#define IS_IPHONE_6_PLUS  (fabs((double)[[UIScreen mainScreen]bounds].size.height - (double)736) < DBL_EPSILON)

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *usd_rur;
@property (weak, nonatomic) IBOutlet UILabel *eur_rur;
@property (weak, nonatomic) IBOutlet UILabel *usd_barrel;
@property (weak, nonatomic) IBOutlet UILabel *description_usd_rur;
@property (weak, nonatomic) IBOutlet UILabel *description_eur_rur;
@property (weak, nonatomic) IBOutlet UILabel *description_usd_barrel;
@property (strong, nonatomic) UsefulQuotes* uq;
-(IBAction)pinchGesture:(id)sender;
-(void)initLableSize;
-(void)setRandomImage;
-(void)initLabelsValue;
@end

@class UsefulQuotes;
@class Player;

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    _uq=[[UsefulQuotes alloc] init];
    [self initLableSize];
    [self initLabelsValue];
    [self setRandomImage];
    
    if([[NSUserDefaults standardUserDefaults] boolForKey:@"waslaunched"])
    {
        _usd_barrel.text=[[NSUserDefaults standardUserDefaults] objectForKey:@"oil"];
        _eur_rur.text=[[NSUserDefaults standardUserDefaults] objectForKey:@"eur"];
        _usd_rur.text=[[NSUserDefaults standardUserDefaults] objectForKey:@"usd"];
    }
    [NSTimer scheduledTimerWithTimeInterval:6.0f
                                      target:self
                                    selector:@selector(updateLabels)
                                    userInfo:nil
                                     repeats:YES];
    
    [[Player returnSharedInstance] playFile];
}
-(IBAction)pinchGesture:(id)sender
{
    NSLog(@"Blah");
}
-(void)initLabelsValue
{
    [_usd_rur setText:@""];
    [_eur_rur setText:@""];
    [_usd_barrel setText:@""];
    
    [_description_usd_rur setText:@""];
    [_description_eur_rur setText:@""];
    [_description_usd_barrel setText:@""];
}
- (void)updateLabels
{
    NSLog(@"Log: %@ %@ %@", [_uq getUSDRURQuote],[_uq getEURRURQuote],[_uq getBrentQuote]);
    self.usd_rur.text=[_uq getUSDRURQuote];
    self.eur_rur.text=[_uq getEURRURQuote];
    self.usd_barrel.text=[_uq getBrentQuote];
    
    [_description_usd_rur setText:@"USD/RUR"];
    [_description_eur_rur setText:@"EUR/RUR"];
    [_description_usd_barrel setText:@"USD/Burrel"];
}
-(void)setRandomImage
{
    NSMutableString* imageName;
    int random_number = 1 + arc4random() % 3;
    imageName=[NSMutableString stringWithFormat:@"%i",random_number];
    [imageName appendString:@".jpg"];
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:imageName] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)initLableSize
{
    if (CURRENT_DEVICE==IPAD||IS_IPHONE_6||IS_IPHONE_6_PLUS)
    {
        [_usd_rur setFont:[UIFont systemFontOfSize:60]];
        [_eur_rur setFont:[UIFont systemFontOfSize:60]];
        [_usd_barrel setFont:[UIFont systemFontOfSize:60]];
        
        [_description_usd_rur setFont:[UIFont systemFontOfSize:30]];
        [_description_eur_rur setFont:[UIFont systemFontOfSize:30]];
        [_description_usd_barrel setFont:[UIFont systemFontOfSize:30]];
    }
    else
    {
        [_usd_rur setFont:[UIFont systemFontOfSize:28]];
        [_eur_rur setFont:[UIFont systemFontOfSize:28]];
        [_usd_barrel setFont:[UIFont systemFontOfSize:28]];
        
        [_description_usd_rur setFont:[UIFont systemFontOfSize:15]];
        [_description_eur_rur setFont:[UIFont systemFontOfSize:15]];
        [_description_usd_barrel setFont:[UIFont systemFontOfSize:15]];
    }
}
@end
