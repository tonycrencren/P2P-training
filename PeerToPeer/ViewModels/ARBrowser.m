//
//  ARBrowser.m
//  PeerToPeer
//
//  Created by admin on 4/2/14.
//  Copyright (c) 2014 Huy Le. All rights reserved.
//

#import "ARBrowser.h"


@implementation ARBrowser

- (instancetype)initBrowserWithPeerID:(MCPeerID *)peerID {
    
    self = [super self];
    if (self) {
        self.browser = [[MCNearbyServiceBrowser alloc] initWithPeer:peerID serviceType:@"Ares-Message"];
    }
    
    return self;
}

@end
