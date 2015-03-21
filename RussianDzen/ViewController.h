
#import "ViewController.h"
#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *usd_rur;
@property (weak, nonatomic) IBOutlet UILabel *eur_rur;
@property (weak, nonatomic) IBOutlet UILabel *usd_barrel;
@property (weak, nonatomic) IBOutlet UILabel *description_usd_rur;
@property (weak, nonatomic) IBOutlet UILabel *description_eur_rur;
@property (weak, nonatomic) IBOutlet UILabel *description_usd_barrel;
-(IBAction)pinchGesture:(id)sender;
-(void)initLableSize;
-(void)setRandomImage;
-(void)initLabelsValue;
@end