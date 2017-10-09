//
//  BSDropDown.m
//  DropDownExample
//
//  Created by Bisma on 22/03/2017.
//  Copyright © 2017 Bisma. All rights reserved.
//

#import "BSDropDown.h"

@interface BSDropDown()

@property (nonatomic,strong) UIFont *dropDownFont;
@property (nonatomic,strong) UIColor *dropDownBGColor;
@property (nonatomic,strong) UIColor *dropDownTextColor;

@property (nonatomic,strong) UITableView *tblView;

@end

@implementation BSDropDown{
    NSArray *optionsArry;
    NSString *imgName;
    float rowHeight;
    UIButton *menuBtn;
}
- (id) initWithWidth:(float)width withHeightForEachRow:(float)height originPoint:(CGPoint)originPoint withOptions:(NSArray*)options{
    
    
    CGRect frame=CGRectMake(originPoint.x, originPoint.y, width, (height*options.count)+12);
    
    if (frame.origin.y+frame.size.height>[UIScreen mainScreen].bounds.size.height) {
        
        frame.size.height=[UIScreen mainScreen].bounds.size.height-frame.origin.y-12;
        
    }
    
    if (frame.origin.x+frame.size.width>[UIScreen mainScreen].bounds.size.width){
        
         frame.size.width=[UIScreen mainScreen].bounds.size.width-frame.origin.x-12;
    }
    
    if ((self = [super initWithFrame:frame])) {
        
        rowHeight=height;
        imgName=@"dot-menu.png";
        optionsArry=options;
        _dropDownFont=[UIFont fontWithName:@"MyriadPro-Regular" size:14];
        _dropDownBGColor=[UIColor blackColor];
        _dropDownTextColor=[UIColor whiteColor];
        
        [self initialzeViewsForFrame:frame];
    }
    return self;
}

-(void)initialzeViewsForFrame:(CGRect)frame{
    
    self.clipsToBounds=YES;
    self.layer.cornerRadius=5.0;
    
    menuBtn=[[UIButton alloc] initWithFrame:CGRectMake(frame.size.width-30,4,30,30)];
    
    
    
    [menuBtn setImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
    
    [menuBtn addTarget:self action:@selector(manuPressed) forControlEvents:UIControlEventTouchUpInside];
    
    _tblView=[[UITableView alloc] initWithFrame:CGRectMake(0, 12, frame.size.width, frame.size.height-8) style:UITableViewStylePlain];
    _tblView.separatorStyle=UITableViewCellSeparatorStyleNone;
    _tblView.backgroundColor=[UIColor clearColor];
    _tblView.bounces=NO;
    _tblView.showsHorizontalScrollIndicator=NO;
    _tblView.delegate=self;
    _tblView.dataSource=self;
    
    [self addSubview:_tblView];
    [self addSubview:menuBtn];
}

-(void)manuPressed{
    
    [UIView transitionWithView:self.superview duration:0.5
                       options:UIViewAnimationOptionTransitionCrossDissolve //change to whatever animation you like
                    animations:^ { [self removeFromSuperview]; }
                    completion:nil];
}

#pragma mark - TableView
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return optionsArry.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    self.backgroundColor=_dropDownBGColor;
    NSString *cellIdentifier = @"CustomCell";
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
        cell.textLabel.textColor=_dropDownTextColor;
        
        cell.textLabel.numberOfLines=2;
        cell.backgroundColor=[UIColor clearColor];
        cell.textLabel.font=_dropDownFont;
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
    }
    
    cell.textLabel.text=[optionsArry objectAtIndex:indexPath.row];
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [_tblView deselectRowAtIndexPath:indexPath animated:YES];
    [self.delegate dropDownView:self AtIndex:indexPath.row];
    [self manuPressed];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return rowHeight;
}
-(void)addAsSubviewTo:(UIView*)parentView{
    
    NSArray *subviews=[parentView subviews];
    BOOL ddAlreadyExisted=NO;
    for (UIView *sbvew in subviews) {
        
        if ([sbvew isKindOfClass:[BSDropDown class]]) {
            
            ddAlreadyExisted=YES;
            break;
        }
    }
    
    if (!ddAlreadyExisted) {
        
        [UIView transitionWithView:parentView duration:0.5
                           options:UIViewAnimationOptionTransitionCrossDissolve
         
                        animations:^ { [parentView addSubview:self]; }
                        completion:nil];
    }
}

-(void)setDropDownTextColor:(UIColor *)textColor{
    
    _dropDownTextColor=textColor;
    
    [menuBtn setImage:[[menuBtn imageForState:UIControlStateNormal] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
    [menuBtn setTintColor:_dropDownTextColor];
    
}
-(void)setDropDownFont:(UIFont *)font{
    
    _dropDownFont=font;
}
-(void)setDropDownBGColor:(UIColor *)color{
    
    _dropDownBGColor=color;
}

@end
