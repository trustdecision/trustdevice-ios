//
//  DetailSubtitleTableViewCell.h
//  TrustDeviceApp
//
//  Created by zeinber on 2022/12/10.
//

#import <UIKit/UIKit.h>

@interface DetailSubtitleTableViewCell : UITableViewCell
/// titleLabel
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
/// detailsLabel
@property (weak, nonatomic) IBOutlet UILabel *detailsLabel;

@end
