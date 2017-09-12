//
//  ViewController.m
//  UDP客户端
//
//  Created by iMac1 on 16/2/24.
//  Copyright © 2016年 iMac1. All rights reserved.
//

#import "ViewController.h"
#import "UDPClientSocket.h"



@interface ViewController () <UITextFieldDelegate,UDPClientSocketDelegate>

@property (nonatomic, strong)UDPClientSocket * clientSocekt;
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
@property (weak, nonatomic) IBOutlet UITextField *jkTetxfeild;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.clientSocekt = [[UDPClientSocket alloc]init];
    self.clientSocekt.delegate = self;

    // 这里服务器的ip写自己所要连接的服务端ip
    [self.clientSocekt sendMessageToHost:@"192.168.1.135"];
}
- (IBAction)sendMessage:(UIButton *)sender {
    if (self.jkTetxfeild.text.length) {
        [self.clientSocekt sendMessage:self.jkTetxfeild.text];
    }
    
//    for (NSInteger num = 0; num < 1000; num++) {
//        NSString * message = @"f (self.jkTetxfeild.text.length)[self.clientSocekt sendMessage:self.jkTetxfeild.text];}";
//        [self.clientSocekt sendMessage:message];
//        sleep(1);
//    }
    
}

- (IBAction)closeConnect:(UIButton *)sender {
    [self.clientSocekt disconnect];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    [self.clientSocekt sendMessage:textField.text];
    return YES;
}

- (void)clientSocketDidReceiveMessage:(NSString *)message{
    dispatch_async(dispatch_get_main_queue(), ^{
        self.messageLabel.text = message;
    });
}

@end
