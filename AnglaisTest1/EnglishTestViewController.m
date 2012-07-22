/*
 * ----------------------------------------------------------------------------
 * "THE BEER-WARE LICENSE" (Revision 42):
 * <bordel@epitech.eu> wrote this file. As long as you retain this notice you
 * can do whatever you want with this stuff. If we meet some day, and you think
 * this stuff is worth it, you can buy me a beer in return Julien Bordellier
 * ----------------------------------------------------------------------------
 */

#import "EnglishTestViewController.h"

@interface EnglishTestViewController ()

@end

@implementation EnglishTestViewController
@synthesize textFieldMail;
@synthesize textFieldLastName;
@synthesize textFieldFirstName;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setTextFieldMail:nil];
    [self setTextFieldLastName:nil];
    [self setTextFieldFirstName:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    if (theTextField == self.textFieldMail) {
        [theTextField resignFirstResponder];
    } else if (theTextField == self.textFieldLastName) {
        [self.textFieldFirstName becomeFirstResponder];
    } else if (theTextField == self.textFieldFirstName) {
        [self.textFieldMail becomeFirstResponder];
    }
    return NO;
}

- (BOOL)ValidationSuccessful {
    if ([self.textFieldFirstName.text compare:@""]
        && [self.textFieldLastName.text compare:@""]
        && [self.textFieldMail.text compare:@""]) {
      return TRUE;
    }
    return FALSE;
}

- (IBAction)buttonStart:(id)sender {
    if ([self ValidationSuccessful] == YES) {
        if (![self.textFieldLastName.text compare:@"Fraisse"]) {
            [self performSegueWithIdentifier:@"ValidationSucceededAdmin" sender:self];            
        } else {
            [self performSegueWithIdentifier:@"ValidationSucceeded" sender:self];
        }
    }
}
@end