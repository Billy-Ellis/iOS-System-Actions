#import "RootViewController.h"

@implementation RootViewController
- (void)viewDidLoad{

[super viewDidLoad];

self.view.backgroundColor = [UIColor blackColor];

  UIActionSheet *popup = [[UIActionSheet alloc] initWithTitle:@"Select a command option:" delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:
                        @"killall backboardd",
                        @"killall SpringBoard",
                        @"uicache",                nil];
   popup.tag = 1;
   
  [popup showInView:self.view];
 
    
}

- (void)actionSheet:(UIActionSheet *)popup clickedButtonAtIndex:(NSInteger)buttonIndex {

/*if (buttonIndex == actionSheet.cancelButtonIndex)
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:@"😄️" delegate:self cancelButtonTitle:@"k" otherButtonTitles:nil];
    [alert show];
}*/

  switch (popup.tag) {
    case 1: {
        switch (buttonIndex) {
            case 0:
                system("killall backboardd");
                break;
            case 1:
                system("killall SpringBoard");
                break;
            case 2:
                system("uicache");
                [self quitApp];
                           break;
          default:
                break;
        }
        break;
    }
    default:
        break;
 }
}

-(void)quitApp{

     UIApplication *thisApp = [UIApplication sharedApplication];
                [thisApp performSelector:@selector(suspend)];
                
                [self performSelector:@selector(exit) withObject:nil afterDelay:1.5];


}

-(void)exit{

exit(0);


}

@end
