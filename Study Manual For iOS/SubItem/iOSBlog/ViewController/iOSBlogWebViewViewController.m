//
//  iOSBlogWebViewViewController.m
//  Study Manual For iOS
//
//  Created by Apple on 9/18/15.
//  Copyright (c) 2015 广东华讯网络投资有限公司. All rights reserved.
//

#import "iOSBlogWebViewViewController.h"
#import "MBProgressHUD.h"

@interface iOSBlogWebViewViewController ()

@end

@implementation iOSBlogWebViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = [GlobalResource sharedInstance].iOSOpenSourceURLName;
    UIBarButtonItem *buttonImage = [[ UIBarButtonItem alloc ] initWithImage:
                                    [ UIImage imageNamed:@"nav_backbtn"]
                                                                      style: UIBarButtonItemStylePlain
                                                                     target: self
                                                                     action: @selector(navback:)
                                    ];
    
    self.navigationItem.leftBarButtonItem = buttonImage;
    
    self.webView = [[WKWebView alloc]init];
    self.webView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) ;
    [self.view addSubview:self.webView];
    
    [self ReachabilityTest];
    
    NSString * urlString= [GlobalResource sharedInstance].iOSOpenSourceURL;
    NSURL *url =[NSURL URLWithString:urlString];
    NSURLRequest  *request =[NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    self.webView.navigationDelegate = self;
    
}

-(void)navback:(UIButton *)button {
     [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)ReachabilityTest {
    if (![Reachability networkAvailable]) {
        [self.view makeToast:@"当前网络不可用,请检查网络设置" duration:5.0 position:@"center"];
    }
    
}

- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
}

- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation {
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
        // Do something...
        dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUDForView:self.view animated:YES];
        });
    });
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
