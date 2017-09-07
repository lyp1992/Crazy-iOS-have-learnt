//
//  ViewController.m
//  老虎机
//
//  Created by navchina on 2017/9/7.
//  Copyright © 2017年 laiyongpeng. All rights reserved.
//

#import "ViewController.h"
#define KImagetag 1
@interface ViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (weak, nonatomic) IBOutlet UIButton *startButton;

@property (nonatomic, strong) NSArray *images;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *dog = [UIImage imageNamed:@"ic_emoticons1"];
    UIImage *mao = [UIImage imageNamed:@"ic_emoticons2"];
    UIImage *tuz = [UIImage imageNamed:@"ic_emoticons3"];
    UIImage *zhu = [UIImage imageNamed:@"ic_emoticons4"];
    UIImage *lang = [UIImage imageNamed:@"ic_emoticons5"];
    
    self.images = [NSArray arrayWithObjects:dog,mao,tuz,zhu,lang, nil];
    NSLog(@"count==%d",_images.count);
}
- (IBAction)resetClick:(id)sender {
    self.startButton.enabled = YES;
}

- (IBAction)startMoveClick:(id)sender {
    self.startButton.enabled = NO;
//    定义一个dictionary记录随机数出现的次数
    NSMutableDictionary *result = [[NSMutableDictionary alloc]initWithCapacity:6];
    for (int i = 0; i<5; i++) {
        //生成0-images.count之间的随机数
        NSUInteger selectVal = arc4random_uniform(self.images.count);
        [self.pickerView selectRow:selectVal inComponent:i animated:YES];
//        在result中已经为该随机数出现的次数
        if ([result objectForKey:[NSNumber numberWithInteger:selectVal]]) {
            //如果存在这个随机数，则加一
            NSUInteger newCount = [[result objectForKey:[NSNumber numberWithInteger:selectVal]] integerValue];
            [result setObject:[NSNumber numberWithInteger:(newCount + 1)] forKey:[NSNumber numberWithInteger:selectVal]];
            
        }else{
            
            [result setObject:[NSNumber numberWithInteger:1] forKey:[NSNumber numberWithInteger:selectVal]];
        }
    }
    NSUInteger maxOccurs = 1;
    for (NSNumber *number in [result allKeys]) {
        if ([[result objectForKey:number] integerValue] > maxOccurs) {
            maxOccurs = [[result objectForKey:number] integerValue];
        }
    }
    if (maxOccurs >= 3) {
        
        [self showWin];
    }else{
        
        [self shwoFail];
    }
}

-(void)showWin{
    NSLog(@"恭喜你，你赢了");
}
-(void)shwoFail{
    
    NSLog(@"很遗憾，你失败了");
}
#pragma mark -UIPickerViewDelegate
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 5;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return self.images.count;
}

-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    if (view.tag != KImagetag) {
        view = [[UIImageView alloc]initWithImage:[self.images objectAtIndex:row]];
        
        view.tag = KImagetag;
        view.contentMode = UIViewContentModeScaleToFill;
//        不允许用户交换与
        view.userInteractionEnabled = NO;
    }
   
    return view;
}

-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 40;
}
-(CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{
    return 40;
}


@end
