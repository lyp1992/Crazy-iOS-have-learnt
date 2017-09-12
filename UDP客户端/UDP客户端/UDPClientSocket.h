//
//  UDPClientSocket.h
//  UDP客户端
//
//  Created by iMac1 on 16/2/24.
//  Copyright © 2016年 iMac1. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GCDAsyncUdpSocket.h"


@protocol UDPClientSocketDelegate <NSObject>

- (void)clientSocketDidReceiveMessage:(NSString *)message;

@end

@interface UDPClientSocket : NSObject <GCDAsyncUdpSocketDelegate>

@property (nonatomic,assign)NSInteger times;

@property (nonatomic, weak)id <UDPClientSocketDelegate>delegate;

@property (nonatomic, strong)GCDAsyncUdpSocket * udpSocket;

- (void)sendMessageToHost:(NSString *)host;

- (void)sendMessage:(NSString *)message;

- (void)disconnect;

@end
