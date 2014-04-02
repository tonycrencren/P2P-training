//
//  ARSession.h
//  PeerToPeer
//
//  Created by admin on 4/2/14.
//  Copyright (c) 2014 Huy Le. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MultipeerConnectivity/MultipeerConnectivity.h>

@interface ARSession : NSObject

@property(strong,nonatomic) MCSession *session;

- (instancetype)initWithPeerId:(MCPeerID *)peerID;

@end
