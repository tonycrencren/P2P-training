//
//  ARMessageViewController.m
//  PeerToPeer
//
//  Created by admin on 4/2/14.
//  Copyright (c) 2014 Huy Le. All rights reserved.
//

#import "ARMessageViewController.h"

@interface ARMessageViewController ()

@end

@implementation ARMessageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.peerID = [[MCPeerID alloc] initWithDisplayName:[[UIDevice currentDevice] name]];
    
    self.sessionModel = [[ARSession alloc] initWithPeerId:self.peerID];
    
    self.advertiser = [[ARAdvertiser alloc] initWithPeerID:self.peerID];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Action

- (IBAction)discoverPeer:(UIBarButtonItem *)sender {
    
    MCBrowserViewController *browserViewController = [[MCBrowserViewController alloc] initWithServiceType:serviceName session:self.sessionModel.session];
    browserViewController.delegate = self;
    [self presentViewController:browserViewController animated:YES completion:nil];
}

#pragma mark - MCBrowserViewControllerDelegate

- (void)browserViewControllerWasCancelled:(MCBrowserViewController *)browserViewController {
    
    [browserViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)browserViewControllerDidFinish:(MCBrowserViewController *)browserViewController {
    
    [browserViewController dismissViewControllerAnimated:YES completion:nil];
}

@end
