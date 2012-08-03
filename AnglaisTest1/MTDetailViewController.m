//
//  MTDetailViewController.m
//  AnglaisTest1
//
//  Created by Julien Bordellier on 01/08/12.
//  Copyright (c) 2012 Epitech. All rights reserved.
//

#import "MTDetailViewController.h"

@interface MTDetailViewController ()

@end

@implementation MTDetailViewController
@synthesize answerCheck;
@synthesize questionNumber;
@synthesize audioPath;
@synthesize imagePath;
@synthesize questionText;
@synthesize AText;
@synthesize BText;
@synthesize CText;
@synthesize DText;

@synthesize path;
@synthesize dic;
@synthesize num;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
indexPath:(NSIndexPath*)indexPath filePath:(NSString*)path fileDic:(NSMutableDictionary*)dic
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSUInteger questionReach = [self.num indexAtPosition:1];

    [self.questionNumber setText:[NSString stringWithFormat:@"%@%u", @"Question n°", (questionReach + 1)]];
	// Do any additional setup after loading the view.

    NSArray *sectionsArray = [[NSArray alloc] initWithArray:[self.dic objectForKey:@"QuestionsAndAnswers"]];
    
    NSUInteger questionCount = 0;
    NSUInteger countSections = [sectionsArray count];
    for (NSUInteger indexSections = 0; indexSections < countSections; indexSections++) {
        
        NSArray *question = [sectionsArray objectAtIndex:indexSections];
        NSUInteger count = [question count];
        for (NSUInteger index = 0; index < count; index++)
        {
            if (questionCount == questionReach) {
                [self.AText setText:[[question objectAtIndex: index] objectForKey: @"A"]];
                [self.BText setText:[[question objectAtIndex: index] objectForKey: @"B"]];
                [self.CText setText:[[question objectAtIndex: index] objectForKey: @"C"]];
                [self.DText setText:[[question objectAtIndex: index] objectForKey: @"D"]];

                [self.questionText setText:[[question objectAtIndex: index] objectForKey: @"question"]];
                [self.audioPath setText:[[question objectAtIndex: index] objectForKey: @"sound"]];
                [self.imagePath setText:[[question objectAtIndex: index] objectForKey: @"img"]];
                
                NSString *answer = [[question objectAtIndex: index] objectForKey: @"answer"];
                //DESACTIVE LE BUTTON D ! A FAIRE QUAND NECESSAIRE
                //[self.answerCheck setEnabled:NO forSegmentAtIndex:3];
                if ([answer isEqualToString:@"B"]) {
                    [self.answerCheck setSelectedSegmentIndex:1];
                } else if ([answer isEqualToString:@"C"]) {
                    [self.answerCheck setSelectedSegmentIndex:2];
                } else if ([answer isEqualToString:@"D"]) {
                    [self.answerCheck setSelectedSegmentIndex:3];
                }
                return;
            }
            questionCount++;
        }
        
    }
}

- (void)viewDidUnload
{
    [self setQuestionNumber:nil];
    [self setAudioPath:nil];
    [self setImagePath:nil];
    [self setQuestionText:nil];
    [self setAText:nil];
    [self setBText:nil];
    [self setCText:nil];
    [self setDText:nil];
    [self setAnswerCheck:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

- (IBAction)ListenAudio:(id)sender {
}

- (IBAction)ShowImage:(id)sender {
}

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    return NO;
}
@end