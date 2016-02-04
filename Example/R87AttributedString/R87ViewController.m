//
//  R87ViewController.m
//  R87AttributedString
//
//  Created by Gergo Nemeth on 02/04/2016.
//  Copyright (c) 2016 Gergo Nemeth. All rights reserved.
//

#import "R87ViewController.h"
#import <R87AttributedString/NSMutableAttributedString+R87Formatter.h>

@interface R87ViewController ()

@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation R87ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	NSString *textString = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"TermsOfUse" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil];
	NSDictionary *defaultTextAttributes = @{
											NSForegroundColorAttributeName: [UIColor blackColor],
											NSFontAttributeName: [UIFont systemFontOfSize:14.0],
											};
	NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:textString attributes:defaultTextAttributes];
	
	[text r87_addAttributes:@{
							  NSFontAttributeName: [UIFont boldSystemFontOfSize:24.0],
							  } betweenCharacters:@"#"];
	
	[text r87_addAttributes:@{
							  NSForegroundColorAttributeName: [UIColor redColor],
							  NSFontAttributeName: [UIFont systemFontOfSize:35.0],
							  } betweenCharacters:@"*"];
	
	self.textView.attributedText = text;
}

@end
