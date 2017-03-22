//
//  BSDropDown.h
//  DropDownExample
//
//  Created by Bisma on 22/03/2017.
//  Copyright © 2017 Bisma. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BSDropDownDelegate <NSObject>
@required
-(void)dropDownView:(UIView*)ddView AtIndex:(NSInteger)selectedIndex ;
@end

@interface BSDropDown : UIView<UITableViewDelegate,UITableViewDataSource>

- (id) initWithWidth:(float)width withHeightForEachRow:(float)height originPoint:(CGPoint)originPoint withOptions:(NSArray*)options;

@property (nonatomic) NSInteger selectedIndex;
@property (nonatomic,strong) UIFont *dropDownFont;
@property (nonatomic,strong) UIColor *dropDownBGColor;
@property (nonatomic,strong) UIColor *dropDownTextColor;


@property (weak,nonatomic) id<BSDropDownDelegate> delegate;
@property (nonatomic,strong) UITableView *tblView;


@end
