//
//  ViewController.m
//  RussianDzen
//
//  Created by Taras Murzenkov on 21.12.14.
//
//
#import "ViewController.h"
#import "UsefulQuotes.h"
#import "Player.h"

#define CURRENT_DEVICE    UI_USER_INTERFACE_IDIOM()
#define IPAD              UIUserInterfaceIdiomPad
#define IPHONE            UIUserInterfaceIdiomPhone
#define IS_IPHONE_4       (fabs((double)[[UIScreen mainScreen]bounds].size.height - (double)480) < DBL_EPSILON)
#define IS_IPHONE_5       (fabs((double)[[UIScreen mainScreen]bounds].size.height - (double)568) < DBL_EPSILON)
#define IS_IPHONE_6       (fabs((double)[[UIScreen mainScreen]bounds].size.height - (double)667) < DBL_EPSILON)
#define IS_IPHONE_6_PLUS  (fabs((double)[[UIScreen mainScreen]bounds].size.height - (double)736) < DBL_EPSILON)
#define FONT_BIG_SIZE_NUMBER   ((int)60)
#define FONT_BIG_SIZE_TITLE    ((int)30)
#define FONT_SMALL_SIZE_NUMBER ((int)28)
#define FONT_SMALL_SIZE_TITLE  ((int)15)

@implementation ViewController
{
    UsefulQuotes* uq;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    uq=[[UsefulQuotes alloc] init];
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
    NSLog(@"Log: %@ %@ %@", [uq getUSDRURQuote],[uq getEURRURQuote],[uq getBrentQuote]);
    self.usd_rur.text=[uq getUSDRURQuote];
    self.eur_rur.text=[uq getEURRURQuote];
    self.usd_barrel.text=[uq getBrentQuote];
    
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
        [_usd_rur setFont:[UIFont systemFontOfSize:FONT_BIG_SIZE_NUMBER]];
        [_eur_rur setFont:[UIFont systemFontOfSize:FONT_BIG_SIZE_NUMBER]];
        [_usd_barrel setFont:[UIFont systemFontOfSize:FONT_BIG_SIZE_NUMBER]];
        
        [_description_usd_rur setFont:[UIFont systemFontOfSize:FONT_BIG_SIZE_TITLE]];
        [_description_eur_rur setFont:[UIFont systemFontOfSize:FONT_BIG_SIZE_TITLE]];
        [_description_usd_barrel setFont:[UIFont systemFontOfSize:FONT_BIG_SIZE_TITLE]];
    }
    else
    {
        [_usd_rur setFont:[UIFont systemFontOfSize:FONT_SMALL_SIZE_NUMBER]];
        [_eur_rur setFont:[UIFont systemFontOfSize:FONT_SMALL_SIZE_NUMBER]];
        [_usd_barrel setFont:[UIFont systemFontOfSize:FONT_SMALL_SIZE_NUMBER]];
        
        [_description_usd_rur setFont:[UIFont systemFontOfSize:FONT_SMALL_SIZE_TITLE]];
        [_description_eur_rur setFont:[UIFont systemFontOfSize:FONT_SMALL_SIZE_TITLE]];
        [_description_usd_barrel setFont:[UIFont systemFontOfSize:FONT_SMALL_SIZE_TITLE]];
    }
}
@end
