//
//  ARMessageViewController.h
//  PeerToPeer
//
//  Created by admin on 4/2/14.
//  Copyright (c) 2014 Huy Le. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ARAdvertiser.h"
#import "ARSession.h"

static NSString * const serviceName = @"Ares-Message";

@interface ARMessageViewController : UITableViewController <MCBrowserViewControllerDelegate, UITableViewDataSource>

@property(strong,nonatomic) ARAdvertiser *advertiser;
@property(strong,nonatomic) ARSession *sessionModel;
@property(strong,nonatomic) MCPeerID *peerID;

@end
