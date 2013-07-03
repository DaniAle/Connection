//
//  ViewController.h
//  ConnectionExample
//
//  Created by Daniela Velasquez on 03/07/13.
//  Copyright (c) 2013 Daniela Velasquez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <NSURLConnectionDelegate>

@property (weak, nonatomic) IBOutlet UITextView *textAreaResponse;


- (IBAction)makeRequest:(id)sender;
- (IBAction)makeSynchronousRequest:(id)sender;
@end
