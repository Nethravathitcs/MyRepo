//
//  ViewController.m
//  Nethra
//
//  Created by Nethra on 04/04/18.
//  Copyright © 2018 Nethra. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
bool editFlag = NO;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.displayedArray = [[NSMutableArray alloc]initWithObjects:@"Mcdonal",@"order",@"test",@"test", nil];
    
    
}

-(IBAction)editButton:(id)sender;
{
    self.buttonDelete.hidden = NO;
    if ([self.buttonEdit.currentTitle isEqualToString:@"Edit"]) {
         editFlag = YES;
    }
    else
    {
        editFlag = NO;
    }
   
    if (editFlag) {
        [self.buttonEdit setTitle:@"Cancel" forState:UIControlStateNormal];
        
    }
    else{
        [self.buttonEdit setTitle:@"Edit" forState:UIControlStateNormal];
    
    }
    
    [self.tableViewList reloadData];
}
-(IBAction)deleteButton:(id)sender;
{
    CGPoint buttonPosition = [sender convertPoint:CGPointZero toView:self.tableViewList];
    NSIndexPath *indexPath = [self.tableViewList indexPathForRowAtPoint:buttonPosition];
    
    //UITableViewCell* cell = [self.tableViewList cellForRowAtIndexPath:indexPath];
    
    [self.displayedArray removeObjectAtIndex:indexPath.row];
    [self.tableViewList reloadData];
}
- (NSInteger) numberOfSectionsInTableView: (UITableView *) tableView {
    return 1;
}

- (NSInteger) tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section {
   
    return self.displayedArray.count;
}

- (UITableViewCell *) tableView:(UITableView *)table cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell;
    
    NSString *cellIdentifier = nil;
    NSString *cellNib = nil;
    
        cellIdentifier = @"OrderListCell";
        cellNib        = @"OrderListCell";
        
        cell = (UITableViewCell *)[table dequeueReusableCellWithIdentifier:cellIdentifier];
        if (cell == nil)
        {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:cellNib owner:self options:nil];
            cell = (UITableViewCell *)[nib objectAtIndex:0];
        }
        
        UIView *contentView = cell.contentView;
        
        UIButton *btnCheckBox = (UIButton *) [contentView viewWithTag:1];
        UILabel *lbl1 = (UILabel *) [contentView viewWithTag:2];
        UILabel *lbl2 = (UILabel *) [contentView viewWithTag:3];
    
    if (editFlag) {
        btnCheckBox.hidden = NO;
        [btnCheckBox setImage:[UIImage imageNamed:@"ic_checkbox-U_2x"] forState:UIControlStateNormal];
        [btnCheckBox addTarget:self
                        action:@selector(checkButtonClicked:) forControlEvents:UIControlEventTouchDown];
    }
    else{
        btnCheckBox.hidden = YES;
    }
    
    lbl1.text = [self.displayedArray objectAtIndex:indexPath.row];
    
    
    return cell;
}
-(void)checkButtonClicked:(UIButton*)sender
{
    NSLog(@"Button Clicked !!");
    CGPoint buttonPosition = [sender convertPoint:CGPointZero toView:self.tableViewList];
    NSIndexPath *indexPath = [self.tableViewList indexPathForRowAtPoint:buttonPosition];
    
    //UITableViewCell* cell = [self.tableViewList cellForRowAtIndexPath:indexPath];
    
//   [self.displayedArray removeObjectAtIndex:indexPath.row];
//    [self.tableViewList reloadData];
//    if ([self.arrApproveSelected containsObject:strOrderID]) {
//        [self.arrApproveSelected removeObject:strOrderID];
//        [sender setImage:[UIImage imageNamed:@"ic_checkbox-U_2x"] forState:UIControlStateNormal];
//    }else{
//        [self.arrApproveSelected addObject:strOrderID];
        [sender setImage:[UIImage imageNamed:@"ic_checkbox-S_2x"] forState:UIControlStateNormal];
    //}
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
