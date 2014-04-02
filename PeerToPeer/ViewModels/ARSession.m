//
//  ARSession.m
//  PeerToPeer
//
//  Created by admin on 4/2/14.
//  Copyright (c) 2014 Huy Le. All rights reserved.
//

#import "ARSession.h"

@implementation ARSession

- (id)initWithPeerId:(MCPeerID *)peerID {
    
    self = [super init];
    if (self) {
        
        if (!peerID) {
            
            peerID = [[MCPeerID alloc] initWithDisplayName:[[UIDevice currentDevice] name]];
        }
        
        self.session = [[MCSession alloc] initWithPeer:peerID securityIdentity:nil encryptionPreference:MCEncryptionNone];
    }
    
    return self;
}

#pragma mark - MCSessionDelegate

- (void)session:(MCSession *)session didReceiveStream:(NSInputStream *)stream withName:(NSString *)streamName fromPeer:(MCPeerID *)peerID {
    
    stream.delegate = self;
    [stream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    [stream open];
}

- (void)stream:(NSStream *)aStream handleEvent:(NSStreamEvent)eventCode {
    
    
}

@end
