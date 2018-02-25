//
//  TodoDetailViewController.m
//  CleanObjC
//
//  Created by skyofdwarf on 2018. 2. 24..
//  Copyright © 2018년 yjkim. All rights reserved.
//

#import "TodoDetailViewController.h"
#import "Interactor.h"
#import "Presenter.h"
#import "Router.h"


@interface TodoDetailViewController ()
<Presentable>

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation TodoDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.titleLabel.text = self.input;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
