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

    self.advertiser = [[MCNearbyServiceAdvertiser alloc] initWithPeer:self.localPeerID discoveryInfo:nil serviceType:XXServiceType];
    self.advertiser.delegate = self;


}

- (void)viewDidAppear:(BOOL)animated {

    /*[self setupBrowser];*/
    [self.advertiser startAdvertisingPeer];
}

- (IBAction)touchSearch:(UIButton *)sender {

    [self setupBrowser];
}

- (void)setupBrowser {

    MCNearbyServiceBrowser *browser;
    browser = [[MCNearbyServiceBrowser alloc] initWithPeer:self.localPeerID serviceType:XXServiceType];
    browser.delegate = self;

    self.browserController = [[MCBrowserViewController alloc] initWithBrowser:browser session:self.session];
    self.browserController.maximumNumberOfPeers = 1;
    self.browserController.minimumNumberOfPeers = 1;

    self.browserController.delegate = self;
    [self presentViewController:self.browserController animated:YES completion:^{

        [browser startBrowsingForPeers];
    }];

}

#pragma mark - MCBrowserViewControllerDelegate

- (BOOL)browserViewController:(MCBrowserViewController *)browserViewController shouldPresentNearbyPeer:(MCPeerID *)peerID withDiscoveryInfo:(NSDictionary *)info {

    NSLog(@"%@", peerID.displayName);
    return YES;
}

- (void)browserViewControllerWasCancelled:(MCBrowserViewController *)browserViewController {

    NSLog(@"Cancel!!!");
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

#pragma mark - MCNearbyServiceBrowserDelegate

- (void)browser:(MCNearbyServiceBrowser *)browser foundPeer:(MCPeerID *)peerID withDiscoveryInfo:(NSDictionary *)info {

    NSLog(@"Found peer!!! %@", peerID.displayName);
}

- (void)browser:(MCNearbyServiceBrowser *)browser lostPeer:(MCPeerID *)peerID {

    NSLog(@"Lost peer!!! %@", peerID.displayName);
}



#pragma mark - MCNearbyServiceAdvertiserDelegate

- (void)advertiser:(MCNearbyServiceAdvertiser *)advertiser didReceiveInvitationFromPeer:(MCPeerID *)peerID withContext:(NSData *)context invitationHandler:(void (^)(BOOL accept, MCSession *session))invitationHandler {

    [[[UIAlertView alloc] initWithTitle:@"Receive Request" message:@"You will connect with browser" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];

    BOOL acceptedInvitation = YES;
    invitationHandler(acceptedInvitation, acceptedInvitation ? self.session : nil);
}

@end
