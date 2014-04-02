//
//  ARAdvertiser.m
//  PeerToPeer
//
//  Created by admin on 4/2/14.
//  Copyright (c) 2014 Huy Le. All rights reserved.
//

#import "ARAdvertiser.h"

@implementation ARAdvertiser

- (instancetype)initWithPeerID:(MCPeerID *)peerID {
    
    self = [super init];
    if (self) {
        self.peerID = peerID;
        [self setupModel];
    }
    return self;
}

- (void)setupModel {
    
    if (!self.peerID) {
        
        self.peerID = [[MCPeerID alloc] initWithDisplayName:[[UIDevice currentDevice] name]];
    }
    
    self.advertiser = [[MCNearbyServiceAdvertiser alloc] initWithPeer:self.peerID discoveryInfo:nil serviceType:@"Ares-Message"];
    self.advertiser.delegate = self;
    [self.advertiser startAdvertisingPeer];
}

- (void)stopAdvertiser:(BOOL)isStop {
    
    if (isStop) {
        [self.advertiser stopAdvertisingPeer];
    } else {
        [self.advertiser startAdvertisingPeer];
    }
}

#pragma mark - MCNearbyServiceAdvertiserDelegate

- (void)advertiser:(MCNearbyServiceAdvertiser *)advertiser didReceiveInvitationFromPeer:(MCPeerID *)peerID withContext:(NSData *)context invitationHandler:(void (^)(BOOL, MCSession *))invitationHandler {
    
    [[[UIAlertView alloc] initWithTitle:@"Welcome!" message:@"Welcome aboard!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
    invitationHandler(YES, self.session);
}



@end
