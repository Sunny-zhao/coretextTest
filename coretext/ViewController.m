//
//  ViewController.m
//  coretext
//
//  Created by 赵军 on 15/6/3.
//  Copyright (c) 2015年 beiliao. All rights reserved.
//

#import "ViewController.h"
#import <DTAttributedLabel.h>
#import <DTImageTextAttachment.h>
#import <NSAttributedString+HTML.h>
#import <UIImageView+AFNetworking.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    NSString *images=@"<p>There is a known issue with images as blocks, outside of p tags.<img style=\"vertical-align:text-top;display:inline-block;\" width=\"100\" height=\"100\"src=\"http://b75.photo.store.qq.com/psu?/V13ck9hj2fjPjt/QSHdwiUSp*0rfOqboo6uCtDtYfcvhTpAKJcKdL7ykAI!/b/YYfgxCxoTAAAYtnRvixbSwAA&bo=yADIAAAAAAABAyQ!&rf=viewer_4，http://\" alt=\"image\"><p style=\"display:inline-block;padding:0;margin:0;white-space:break-all\" width=\"90\">There is a known issue </p></p>";
    NSString *images = @"<p style=\"width:200px\">There is a known issue with images as blocks, outside of p tags.<img style=\"vertical-align:top;display:inline-block;width:100px;height:100px;\"src=\"http://avatar.csdn.net/2/C/D/1_totogo2010.jpg\" alt=\"image\"> <span style=\"vertical-align:top;display:inline-block;width:92px;height:100px;\">There is a known issue</span></p>";
     NSData *data = [images dataUsingEncoding:NSUTF8StringEncoding];
    
    NSAttributedString *attributeString = [[NSAttributedString alloc] initWithHTMLData:data options:nil documentAttributes:NULL];;
    DTAttributedLabel *_contentLabel = [[DTAttributedLabel alloc]initWithFrame:CGRectMake(100, 80, 200, 200)];
    _contentLabel.backgroundColor = [UIColor clearColor];
    _contentLabel.numberOfLines = 0;
    _contentLabel.layoutFrameHeightIsConstrainedByBounds = YES;
    _contentLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    _contentLabel.delegate = self;
    _contentLabel.attributedString = attributeString;
    _contentLabel.shouldDrawLinks = YES;
    [self.view addSubview:_contentLabel];
}

- (UIView *)attributedTextContentView:(DTAttributedTextContentView *)attributedTextContentView viewForAttachment:(DTTextAttachment *)attachment frame:(CGRect)frame
{
    if ([attachment isKindOfClass:[DTImageTextAttachment class]])
    {
        frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, frame.size.height);
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
        NSString *emojiFile = @"http://avatar.csdn.net/2/C/D/1_totogo2010.jpg";//[attachment.contentURL absoluteString];
        imageView.image = [UIImage imageNamed:@"1_totogo2010.jpg"];
//        [imageView setImageWithURL:[NSURL URLWithString:emojiFile]];
//        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//            NSURL * url = [NSURL URLWithString:@"http://avatar.csdn.net/2/C/D/1_totogo2010.jpg"];
//            NSData * data = [[NSData alloc]initWithContentsOfURL:url];
//            UIImage *image = [[UIImage alloc]initWithData:data];
//            if (data != nil) {
//                dispatch_async(dispatch_get_main_queue(), ^{
//                    imageView.image = image;
//                });   
//            }           });
        return imageView;
    }
    
    return nil;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
