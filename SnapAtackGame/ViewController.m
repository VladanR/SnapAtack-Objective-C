//
//  ViewController.m
//  SnapAtackGame
//
//  Created by Vladan Randjelovic on 27/05/2020.
//  Copyright © 2020 Vladan Randjelovic. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    timeValue = 60;
    scoreValue = 0;
    gameMode = 0;
    
    self.timeLabel.text = [NSString stringWithFormat:@"Time: %i", timeValue];
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %i", scoreValue];
    
    
}


-(void)updateTimer {
    
    timeValue -= 1;
    
    self.timeLabel.text = [NSString stringWithFormat:@"Time: %i", timeValue];
    
    gameMode = 1;
    self.startButton.enabled = YES;
    
       if (timeValue == 0) {
           [gameTimer invalidate];
           [cardRandomizerTimer invalidate];
           
           self.startButton.enabled = YES;
           self.startButton.alpha = 1.0;
           [self.startButton setTitle:@"Restart Game" forState:UIControlStateNormal];
       }
}

- (IBAction)startGame:(id)sender {

    if (timeValue == 60) {
           
           gameTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
           cardRandomizerTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateCards) userInfo:nil repeats:YES];

           gameMode = 1;
           
           [self.startButton setTitle:@"Snap" forState:UIControlStateNormal];
       }
       
       if (timeValue == 0) {
           
           timeValue = 60;
           scoreValue = 0;
           
           self.timeLabel.text = [NSString stringWithFormat:@"Time: %i", timeValue];
           self.scoreLabel.text =
               [NSString stringWithFormat:@"Score: %i", scoreValue];
           
           [self.startButton setTitle:@"Start Game" forState:UIControlStateNormal];
       }

    if (gameMode == 1 && [self.startButton.titleLabel.text isEqualToString:@"Snap"] ) {
         if ([self.cardOne.image isEqual:self.cardTwo.image]) {

           scoreValue += 1;
           self.scoreLabel.text =
               [NSString stringWithFormat:@"Score: %i", scoreValue];

         } else {

           scoreValue -= 1;
           self.scoreLabel.text =
               [NSString stringWithFormat:@"Score: %i", scoreValue];
         }
       }
}

-(void)restartGame {
    self.startButton.enabled = YES;
    self.startButton.alpha = 1.0;
    gameMode = 0;
    [self.startButton setTitle:@"Start Game" forState:UIControlStateNormal];
    self.cardOne.image = [UIImage imageNamed:@"red_cover"];
    self.cardTwo.image = [UIImage imageNamed:@"red_cover"];
}
-(void)updateCards {
    
    NSArray *cards = @[@"ace_of_clubs",
                       @"2_of_clubs",
                       @"3_of_clubs",
                       @"4_of_clubs",
                       @"5_of_clubs",
                       @"6_of_clubs",
                       @"7_of_clubs",
                       @"8_of_clubs",
                       @"9_of_clubs",
                       @"10_of_clubs",
                       @"jack_of_clubs",
                       @"queen_of_clubs",
                       @"king_of_clubs",
                       @"black_joker"];
   
    int randomCard1 = arc4random() % cards.count;
    self.cardOne.image = [UIImage imageNamed:cards[randomCard1]];
    
    int randomCard2 = arc4random() % cards.count;
    self.cardTwo.image = [UIImage imageNamed:cards[randomCard2]];
    
}

@end
