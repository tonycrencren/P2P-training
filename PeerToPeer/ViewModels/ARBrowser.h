//
//  ARBrowser.h
//  PeerToPeer
//
//  Created by admin on 4/2/14.
//  Copyright (c) 2014 Huy Le. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MultipeerConnectivity/MultipeerConnectivity.h>

@interface ARBrowser : NSObject

@property(strong,nonatomic) MCNearbyServiceBrowser *browser;

- (instancetype)initBrowserWithPeerID:(MCPeerID *)peerID;

@end
