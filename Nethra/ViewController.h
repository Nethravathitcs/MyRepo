//
//  ViewController.h
//  Nethra
//
//  Created by Nethra on 04/04/18.
//  Copyright © 2018 Nethra. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIAlertViewDelegate>
{
    
}
@property(nonatomic,strong)IBOutlet UIButton *buttonEdit;
@property(nonatomic,strong)IBOutlet UIButton *buttonDelete;
@property(nonatomic,strong)IBOutlet UITableView *tableViewList;
@property (strong,nonatomic) NSMutableArray *displayedArray;



-(IBAction)editButton:(id)sender;
-(IBAction)deleteButton:(id)sender;

@end

