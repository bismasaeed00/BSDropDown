# BSDropDown
It's show dropdown menu list.

![alt tag](https://cloud.githubusercontent.com/assets/16186934/24190122/6cd1c28a-0f09-11e7-869b-9626182ea172.png)
## How To Get Started
Download the project and drop BSDropDownClass into your project.
Don't forget to import the header file.

```
#import "BSDropDown.h"
```
You can create a dropdown with options to show ans add in your view. Here is the example
```
BSDropDown *ddView=[[BSDropDown alloc] initWithWidth:120 withHeightForEachRow:50 originPoint:btn.center withOptions:@[@"option 1",@"option 2",@"option 3",@"option 4",@"option 5"]];
ddView.delegate=self;
//    ddView.dropDownBGColor=[UIColor yellowColor];
//    ddView.dropDownTextColor=[UIColor greenColor];
//    ddView.dropDownFont=[UIFont systemFontOfSize:13];
[self.view addSubview:ddView];

```
You can customize it's backgroud color, font and text color using the commented code above.
### Delegate
Implement the delegate method to know when user cliceked an option

```
#pragma mark - DropDown Delegate
-(void)dropDownView:(UIView *)ddView AtIndex:(NSInteger)selectedIndex{
    
    NSLog(@"selectedIndex: %li",(long)selectedIndex);
    _displayLabel.text=[NSString stringWithFormat:@"options %li",(long)selectedIndex+1];
    
}
```
