//
//  DetailViewController.h
//  MoonRunner
//
//  Created by legr on 05/11/15.
//  Copyright © 2015 legr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

