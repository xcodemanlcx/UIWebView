//
//  ViewController1.m
//  UIWebView
//
//  Created by hx_leichunxiang on 14-11-3.
//  Copyright (c) 2014年 lcx. All rights reserved.
//  功能：1.1 webview与js的交互。

#import "ViewController1.h"

@interface ViewController1 ()<UIWebViewDelegate>

@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 436)];
    _webView.delegate = self;
    _webView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:_webView];
    
    //加载网页
    NSURL *url = [NSURL URLWithString:@"http://www.baidu.com"];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:urlRequest];

}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    //1.获取文章标题
    NSString *title = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    NSLog(@"title = %@",title);
    
    //2.获取webview内容的高度，即webview.scrolllview.contentSize.height
    NSString *webContentHeight = [webView stringByEvaluatingJavaScriptFromString:@"document.body.scrollHeight"];
    NSLog(@"webContentHeight = %@",webContentHeight);


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
