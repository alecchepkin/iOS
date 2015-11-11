//
//  ViewController.m
//  Quiz
//
//  Created by legr on 10/22/15.
//  Copyright © 2015 legr. All rights reserved.
//

#import "QuizViewController.h"

@interface QuizViewController ()

@property (nonatomic) int currentQuestionIndex;

@property (nonatomic, copy) NSArray *questions;
@property (nonatomic, copy) NSArray *answers;

@property (nonatomic, weak) IBOutlet UILabel *questionLabel;
@property (nonatomic, weak) IBOutlet UILabel *answerLabel;

@end

@implementation QuizViewController

- (void) viewDidLoad
{

    [super viewDidLoad];
    
    self.questions = @[@"From what is cognac made?",
                        @"What is 7+7?",
                        @"What is the capital of Vermont?"];
        
    self.answers = @[@"Grapes",
                    @"14",
                    @"Montpelier"];

    NSLog(@"viewDidLoad");
}


- (IBAction) showQuestion:(id)sender
{
    self.currentQuestionIndex++;
    if (self.currentQuestionIndex == [self.questions count]) {
        self.currentQuestionIndex = 0;
    }
    NSString *question = self.questions[self.currentQuestionIndex];
    
    self.questionLabel.text = question;
    
    self.answerLabel.text = @"???";
    
}

- (IBAction)showAnswer:(id)sender
{
    NSString *answer = self.answers[self.currentQuestionIndex];
    self.answerLabel.text = answer;
    
}

@end
