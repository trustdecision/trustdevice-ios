//
//  DetailsViewController.m
//  TrustDeviceApp
//
//  Created by zeinber on 2022/12/8.
//

#import "DetailsViewController.h"
#import "DetailsDefaultTableViewCell.h"
#import "DetailSubtitleTableViewCell.h"

#pragma mark - Defination List
#define DeviceIdKey @"device_id"
#define DeviceRiskLabelKey @"device_risk_label"
#define DeviceDetailKey @"device_detail"

@interface DetailsViewController () <UITableViewDataSource, UITableViewDelegate>
/** IBOutlet */
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

/** TableViewCell Identifier */
static NSString *DetailsSubtitleCellIdentifier = @"DetailsSubtitleCellIdentifier";
static NSString *DetailsDefaultCellIdentifier = @"DetailsDefaultCellIdentifier";

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Navigation Setting
    self.navigationItem.title = @"Details";
    // Register Cell
    [self.tableView registerNib:[UINib nibWithNibName:@"DetailSubtitleTableViewCell" bundle:nil] forCellReuseIdentifier:DetailsSubtitleCellIdentifier];
    [self.tableView registerNib:[UINib nibWithNibName:@"DetailsDefaultTableViewCell" bundle:nil] forCellReuseIdentifier:DetailsDefaultCellIdentifier];


}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {//device_id
        return 1;
    }else if (section == 1) {//device_risk_label
        return [[self.dataSource[DeviceRiskLabelKey] allKeys] count];
    }else {
        return [[self.dataSource[DeviceDetailKey] allKeys] count];
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {//device_id
        return DeviceIdKey;
    }else if (section == 1) {//device_risk_label
        return DeviceRiskLabelKey;
    }else {//device_detail
        return DeviceDetailKey;
    }
}

#pragma mark - UITableViewDelegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {//device_id
        id detailInfo = self.dataSource[DeviceIdKey];
        DetailsDefaultTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:DetailsDefaultCellIdentifier];
        cell.detailsLabel.text = [NSString stringWithFormat:@"%@",detailInfo];
        return cell;
    }else if (indexPath.section == 1) {//device_risk_label
        NSDictionary *riskInfo = self.dataSource[DeviceRiskLabelKey];
        DetailSubtitleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:DetailsSubtitleCellIdentifier];
        cell.titleLabel.text = [NSString stringWithFormat:@"%@",riskInfo.allKeys[indexPath.row]];
        cell.detailsLabel.text = [NSString stringWithFormat:@"%@",riskInfo.allValues[indexPath.row]];
        return cell;
    }else {//device_detail
        NSDictionary *detailInfo = self.dataSource[DeviceDetailKey];
        DetailSubtitleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:DetailsSubtitleCellIdentifier];
        cell.titleLabel.text = [NSString stringWithFormat:@"%@",detailInfo.allKeys[indexPath.row]];
        cell.detailsLabel.text = [NSString stringWithFormat:@"%@",detailInfo.allValues[indexPath.row]];
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

@end
