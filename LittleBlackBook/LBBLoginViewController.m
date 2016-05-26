//
//  LBBLoginViewController.m
//  LittleBlackBook
//
//  Created by MyCityForKids on 25/05/16.
//  Copyright © 2016 Tasin Zarkoob. All rights reserved.
//

#import "LBBLoginViewController.h"
#import "LBBAPIManager.h"

@interface LBBLoginViewController ()<UIWebViewDelegate>

@property (nonatomic, strong) IBOutlet UIWebView *webViewLogin;
@property (nonatomic, strong) IBOutlet UIActivityIndicatorView *indicatorView;
@property (nonatomic, assign) BOOL segued;

@end

@implementation LBBLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if ([[NSUserDefaults standardUserDefaults] objectForKey:kUserAccessTokenKey]) {
        NSLog(@"Already verified");
        self.title = @"Developer";
    } else {
        self.title = @"Login";
    }
    
    NSString *urlString = [NSString stringWithFormat:kAuthenticationEndpoint, kClientId, kRedirectUrl];
    NSURLRequest* request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    [self.webViewLogin loadRequest:request];
}

- (void)viewWillAppear:(BOOL)animated {
    self.segued = NO;
    
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    if ([request.URL.absoluteString rangeOfString:@"#"].location != NSNotFound) {
        NSString* params = [[request.URL.absoluteString componentsSeparatedByString:@"#"] objectAtIndex:1];
        NSString *accessToken = [params stringByReplacingOccurrencesOfString:@"access_token=" withString:@""];
        if (accessToken) {
            self.title = @"Developer";
            
            NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
            [defaults setObject:accessToken forKey:kUserAccessTokenKey];
            [defaults synchronize];
            
            self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Home" style:UIBarButtonItemStylePlain target:self action:@selector(segueToHomeTabController)];
            
            [self segueToHomeTabController];
        }
        
    }
    
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    [self.indicatorView startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [self.indicatorView stopAnimating];
}

- (void)segueToHomeTabController {
    if (!self.segued) {
        self.segued = YES;
        [self performSegueWithIdentifier:@"HomeTabController" sender:self];
    }
//    [[LBBAPIManager sharedManager] hello:^(id responseObject) {
//        
//    } failure:^(NSURLSessionDataTask *task, NSError *error) {
//        
//    }];
}


- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
   
}

@end
