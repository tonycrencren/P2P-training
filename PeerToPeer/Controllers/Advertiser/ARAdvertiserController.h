//
// Created by admin on 4/1/14.
// Copyright (c) 2014 Huy Le. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MultipeerConnectivity/MultipeerConnectivity.h>

@interface ARAdvertiserController : UIViewController <MCNearbyServiceAdvertiserDelegate, MCSessionDelegate, MCBrowserViewControllerDelegate>

@property(nonatomic, strong) MCNearbyServiceAdvertiser *advertiser;
@property(nonatomic, strong) MCSession *session;
@property(nonatomic, strong) MCPeerID *localPeerID;

@property(nonatomic, strong) MCNearbyServiceBrowser *browser;
@property(nonatomic, strong) MCBrowserViewController *browserController;
@end