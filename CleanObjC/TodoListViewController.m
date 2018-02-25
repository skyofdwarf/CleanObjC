//
//  ViewController.m
//  CleanObjC
//
//  Created by yjkim on 23/02/2018.
//  Copyright © 2018 yjkim. All rights reserved.
//

#import "TodoListViewController.h"
#import "TodoListViewModel.h"
#import <ReactiveObjC.h>

#import "TodoListInteractor.h"
#import "TodoListPresenter.h"
#import "TodoListRouter.h"



#define LOG_HERE NSLog(@"%s", __PRETTY_FUNCTION__);

@interface TodoListViewController ()
<UITableViewDelegate, UITableViewDataSource, TodoListPresentable>

@property (weak, nonatomic) IBOutlet UIButton *addButton;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;
@property (weak, nonatomic) IBOutlet UIButton *loadButton;
@property (weak, nonatomic) IBOutlet UIButton *clearButton;
@property (weak, nonatomic) IBOutlet UITextField *inputTextField;
@property (weak, nonatomic) IBOutlet UILabel *inputLabel;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicator;


@property (strong, nonatomic) TodoListInteractor *interactor;
@property (strong, nonatomic) TodoListPresenter *presenter;
@property (strong, nonatomic) TodoListRouter *router;

@property (strong, nonatomic) TodoListViewModel *vm;
@end

@implementation TodoListViewController

- (void)dealloc {
    LOG_HERE
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.interactor = [[TodoListInteractor alloc] initWithPresenter:self.presenter];
    self.presenter = [[TodoListPresenter alloc] initWithPresentable:self];
    self.router = [[TodoListRouter alloc] initWithViewController:self];
    
    
    self.indicator.hidesWhenStopped = YES;
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    self.vm = [TodoListViewModel new];
    
    RACSignal *loadSignal = [self.loadButton rac_signalForControlEvents:UIControlEventTouchUpInside];
    RACSignal *saveSignal = [self.saveButton rac_signalForControlEvents:UIControlEventTouchUpInside];
    RACSignal *clearSignal = [self.clearButton rac_signalForControlEvents:UIControlEventTouchUpInside];
    
    @weakify(self)
    [loadSignal subscribeNext:^(UIButton *senderx) {
        @strongify(self)
        [self.presenter load:[self.interactor load]];
        //[self updateWithItems:@[@"a", @"b"]];
    }];
    
    [saveSignal subscribeNext:^(UIButton *senderx) {
        @strongify(self)
        [self.presenter save:[self.interactor save:self.vm.list]];
    }];
    
    
    RACSubject *inputResetSubject = [RACSubject subject];
    [clearSignal subscribeNext:^(id  _Nullable x) {
        @strongify(self)
        
        [inputResetSubject sendNext:@""];
        [self updateWithItems:@[]];
    }];
        

    RACSignal *addButtonSignal = [self.addButton rac_signalForControlEvents:UIControlEventTouchUpInside];
    RACSignal *addSignal = [[addButtonSignal map:^(id _Nullable value) {
        @strongify(self)
        return self.inputTextField.text;
    }] filter:^BOOL(NSString *input) {
        return input.length > 0;
    }];

    RACSignal *inputResetSignalAfterAddition = [[addSignal doNext:^(NSString *input) {
        @strongify(self)
        [self.vm.list addObject:input];
        [self.tableView reloadData];
    }] map:^(NSString *input) {
        return @"";
    }];
    
    RACSignal *inputChangeSignal = self.inputTextField.rac_textSignal;
    RACSignal *inputSignal = [[RACSignal merge:@[ inputChangeSignal, inputResetSignalAfterAddition, inputResetSubject ]] replayLast];
    
    RAC(self.inputLabel, text) = inputSignal;
    RAC(self.inputTextField, text) = inputSignal;
    RAC(self.vm, input) = inputSignal;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    [self.router prepareForSegue:segue sender:sender];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.vm.list.count;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LOG_HERE
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"default-cell"];
    NSString *input = self.vm.list[indexPath.row];
    
    cell.textLabel.text = input;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    LOG_HERE
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *input = self.vm.list[indexPath.row];
    
    [self.router showDetailsWithInput:input];
}

#pragma mark - TodoListPresentable

- (void)showLoadingIndicator:(BOOL)show {
    if (show) {
        [self.indicator startAnimating];
    }
    else {
        [self.indicator stopAnimating];
    }
}

- (void)showToastWithMessage:(NSString *)msg {
    NSLog(@"TOAST: %@", msg);
    
    // maybe use global toaster
}

- (void)updateWithItems:(NSArray<NSString *> *)items {
    self.vm.list = [NSMutableArray arrayWithArray:items];
    [self.tableView reloadData];
}


- (void)updateWithErrorMessage:(NSString *)msg {
    NSLog(@"TOAST: %@", msg);
    
    // maybe use global toaster
}

@end
