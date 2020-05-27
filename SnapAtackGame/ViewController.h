//
//  ViewController.h
//  SnapAtackGame
//
//  Created by Vladan Randjelovic on 27/05/2020.
//  Copyright © 2020 Vladan Randjelovic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    
    NSTimer *gameTimer;
    NSTimer *cardRandomizerTimer;
    int scoreValue;
    int timeValue;
    int gameMode;
}

@property (weak, nonatomic) IBOutlet UIImageView *cardOne;
@property (weak, nonatomic) IBOutlet UIImageView *cardTwo;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UIButton *startButton;

- (IBAction)startGame:(id)sender;

@end

