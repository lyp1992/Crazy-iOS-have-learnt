//
//  UDPClientSocket.m
//  UDP客户端
//
//  Created by iMac1 on 16/2/24.
//  Copyright © 2016年 iMac1. All rights reserved.
//

#import "UDPClientSocket.h"

@implementation UDPClientSocket

- (void)sendMessageToHost:(NSString *)host{
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    self.udpSocket = [[GCDAsyncUdpSocket alloc]initWithDelegate:self delegateQueue:queue];
    [self.udpSocket bindToPort:60834 error:nil];
    [self.udpSocket enableBroadcast:YES error:nil];
    NSString * message = @"GETIP\r\n";
    NSData * data = [message dataUsingEncoding:NSUTF8StringEncoding];
    
    NSLog(@"FFFFFF = %@ %@",host,data);
    
    // 根据需求写自己监听的端口
    [self.udpSocket sendData:data toHost:host port:60834 withTimeout:-1 tag:0];
    // 只接收一次  建议这行注释  因为一般是有数据回来就接收
    [self.udpSocket receiveOnce:nil];
}

- (void)sendMessage:(NSString *)message{
    NSData * data = [message dataUsingEncoding:NSUTF8StringEncoding];
     [self.udpSocket sendData:data toHost:@"192.168.125.105" port:5100 withTimeout:-1 tag:0];
   // [self.udpSocket sendData:data toHost:@"121.201.35.178" port:7880 withTimeout:-1 tag:0];
}

- (void)disconnect{
    [self.udpSocket closeAfterSending];
}

- (void)udpSocket:(GCDAsyncUdpSocket *)sock didReceiveData:(NSData *)data fromAddress:(NSData *)address withFilterContext:(id)filterContext{
    NSString * ip = [GCDAsyncUdpSocket hostFromAddress:address];
    uint16_t port = [GCDAsyncUdpSocket portFromAddress:address];
    
    NSString * message = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    
    NSLog(@"接收到服务端的消息：ip:%@  port:%d  message:%@",ip,port,message);
    
    // 协议  收到数据后 将收到的数据返回回去使用
    if ([self.delegate respondsToSelector:@selector(clientSocketDidReceiveMessage:)]) {
        [self.delegate clientSocketDidReceiveMessage:message];
    }
    
    [self.udpSocket receiveOnce:nil];
//    [self.udpSocket beginReceiving:nil];
}


- (void)udpSocket:(GCDAsyncUdpSocket *)sock didNotSendDataWithTag:(long)tag dueToError:(NSError *)error{
    NSLog(@"客户端发送消息失败  %@",[error description]);
}


- (void)udpSocket:(GCDAsyncUdpSocket *)sock didSendDataWithTag:(long)tag{
    NSLog(@"客户端发送消息成功");
    self.times ++;
    NSLog(@"times:%ld",(long)self.times);
}

- (void)udpSocketDidClose:(GCDAsyncUdpSocket *)sock withError:(NSError *)error{
    NSLog(@"断开连接   %@",[error description]);
}

@end
