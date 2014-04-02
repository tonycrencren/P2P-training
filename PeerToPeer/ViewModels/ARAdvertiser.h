//
//  ARAdvertiser.h
//  PeerToPeer
//
//  Created by admin on 4/2/14.
//  Copyright (c) 2014 Huy Le. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MultipeerConnectivity/MultipeerConnectivity.h>

@interface ARAdvertiser : NSObject <MCNearbyServiceAdvertiserDelegate>

@property(strong,nonatomic) MCNearbyServiceAdvertiser *advertiser;
@property(strong,nonatomic) MCPeerID *peerID;
@property(copy,nonatomic) NSString *displayName;

- (instancetype)initWithPeerID:(MCPeerID *)peerID;
- (void)stopAdvertiser:(BOOL)isStop;

@end
