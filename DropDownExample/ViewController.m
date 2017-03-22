//
//  ViewController.m
//  DropDownExample
//
//  Created by Bisma on 22/03/2017.
//  Copyright © 2017 Bisma. All rights reserved.
//

#import "ViewController.h"
#import "BSDropDown.h"

@interface ViewController ()<BSDropDownDelegate>
- (IBAction)showDropDown:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *displayLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


- (IBAction)showDropDown:(id)sender {

    UIButton *btn=(UIButton*)sender;
    
    BSDropDown *ddView=[[BSDropDown alloc] initWithWidth:120 withHeightForEachRow:50 originPoint:btn.center withOptions:@[@"option 1",@"option 2",@"option 3",@"option 4",@"option 5"]];
    ddView.delegate=self;
//    ddView.dropDownBGColor=[UIColor yellowColor];
//    ddView.dropDownTextColor=[UIColor greenColor];
//    ddView.dropDownFont=[UIFont systemFontOfSize:13];
    [self.view addSubview:ddView];
    
}

#pragma mark - DropDown Delegate
-(void)dropDownView:(UIView *)ddView AtIndex:(NSInteger)selectedIndex{
    
    NSLog(@"selectedIndex: %li",(long)selectedIndex);
    _displayLabel.text=[NSString stringWithFormat:@"options %li",(long)selectedIndex+1];
    
}
@end
