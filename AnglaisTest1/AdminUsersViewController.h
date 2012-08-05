/*
 * ----------------------------------------------------------------------------
 * "THE BEER-WARE LICENSE" (Revision 42):
 * <bordel@epitech.eu> wrote this file. As long as you retain this notice you
 * can do whatever you want with this stuff. If we meet some day, and you think
 * this stuff is worth it, you can buy me a beer in return Julien Bordellier
 * ----------------------------------------------------------------------------
 */

#import <UIKit/UIKit.h>

@interface AdminUsersViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray *userFirstNames;
@property (nonatomic, strong) NSMutableArray *userLastNames;
@property (nonatomic, strong) NSMutableArray *userMails;

@property (nonatomic, strong) NSString *path;
@property (nonatomic, strong) NSDictionary *dic;
@end
