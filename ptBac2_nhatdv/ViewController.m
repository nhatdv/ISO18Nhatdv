//
//  ViewController.m
//  ptBac2_nhatdv
//
//  Created by iOS18 on 10/2/13.
//  Copyright (c) 2013 iOS18. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *txta;
@property (weak, nonatomic) IBOutlet UITextField *txtb;

@property (weak, nonatomic) IBOutlet UITextField *txtc;

@property (weak, nonatomic) IBOutlet UILabel *lblMessage;
@property (weak, nonatomic) IBOutlet UILabel *no1;
@property (weak, nonatomic) IBOutlet UILabel *no2;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)GiaiCach2:(id)sender {
    int a = [_txta.text intValue];
    int b = [_txtb.text intValue];
    int c = [_txtc.text intValue];
    int delta = b*b - 4*a*c;
    if(delta<0)
    {
         _lblMessage.text= [NSString stringWithFormat:@"%@", @"Phuong tring vo nghiem"];
    }
    else
    {
_lblMessage.text= [NSString stringWithFormat:@"%@", @"Phuong tring co nghiem la"];
        float x1 = (- b + sqrtf(delta))/(2*a);
        _no1.text =[NSString stringWithFormat:@"x1=%f", x1];        float x2 = (- b - sqrtf(delta))/(2*a);
         _no2.text=[NSString stringWithFormat:@"x1=%f", x2];
    }


}
- (IBAction)gpt:(id)sender {
    // Unbox gia tri
    int a = [_txta.text intValue];
    int b = [_txtb.text intValue];
    int c = [_txtc.text intValue];
    // Call function
    @try
    {
        [self gpt:a andb:b andc:c];
    }
    @catch(NSException *e){
        NSLog(@"system error:%@ || reason:%@",e.name, e.reason);
    }
    @finally {
        NSLog(@"finish");
    }
}
-(void) gpt:(int) a andb: (int) b andc: (int) c;
{
    int delta = b*b - 4*a*c;
    if(delta<0)
    {
        NSException *exception = [NSException exceptionWithName:@"PT vo nghiem" reason:@"del<0" userInfo:nil];
        @throw  exception;
    }
    else
    {
        float x1 = (- b + sqrtf(delta))/(2*a);
        NSLog(@"x1=: %f",x1);
        float x2 = (- b - sqrtf(delta))/(2*a);
        NSLog(@"x2: %f",x2);
    }
}
@end
