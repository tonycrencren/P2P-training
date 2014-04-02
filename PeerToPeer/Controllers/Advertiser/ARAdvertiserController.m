//
// Created by admin on 4/1/14.
// Copyright (c) 2014 Huy Le. All rights reserved.
//

#import <MultipeerConnectivity/MultipeerConnectivity.h>
#import "ARAdvertiserController.h"

static NSString * const XXServiceType = @"Ares-service";

@implementation ARAdvertiserController {

}

- (void)viewDidLoad {

    self.localPeerID = [[MCPeerID alloc] initWithDisplayName:[[UIDevice currentDevice] name]];

    self.session = [[MCSession alloc] initWithPeer:self.localPeerID securityIdentity:nil encryptionPreference:MCEncryptionNone];
    self.session.delegate = self;

    [self setupAdvertiser];
}

- (void)viewDidAppear:(BOOL)animated {

    [self.advertiser startAdvertisingPeer];
}

- (IBAction)touchSearch:(UIButton *)sender {

    [self setupBrowser];
}

- (void)setupAdvertiser {
    
    self.advertiser = [[MCNearbyServiceAdvertiser alloc] initWithPeer:self.localPeerID discoveryInfo:nil serviceType:XXServiceType];
    self.advertiser.delegate = self;
}

- (void)setupBrowser {

    MCNearbyServiceBrowser *browser;
    browser = [[MCNearbyServiceBrowser alloc] initWithPeer:self.localPeerID serviceType:XXServiceType];
    

    self.browserController = [[MCBrowserViewController alloc] initWithBrowser:browser session:self.session];

    self.browserController.delegate = self;
    [self presentViewController:self.browserController animated:YES completion:nil];

}

#pragma mark - MCBrowserViewControllerDelegate


- (void)browserViewControllerWasCancelled:(MCBrowserViewController *)browserViewController {

    [browserViewController dismissViewControllerAnimated:YES completion:^{

        [self.browser stopBrowsingForPeers];
    }];
}

- (void)browserViewControllerDidFinish:(MCBrowserViewController *)browserViewController {

    NSLog(@"OK!!!");
}

#pragma mark - Session Delegate
- (void)session:(MCSession *)session peer:(MCPeerID *)peerID didChangeState:(MCSessionState)state {

    NSLog(@"%d", state);
}

#pragma mark - MCNearbyServiceAdvertiserDelegate

- (void)advertiser:(MCNearbyServiceAdvertiser *)advertiser didReceiveInvitationFromPeer:(MCPeerID *)peerID withContext:(NSData *)context invitationHandler:(void (^)(BOOL accept, MCSession *session))invitationHandler {

    [[[UIAlertView alloc] initWithTitle:@"Receive Request" message:@"You will connect with browser" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];

    BOOL acceptedInvitation = YES;
    invitationHandler(acceptedInvitation, acceptedInvitation ? self.session : nil);
}

@end
