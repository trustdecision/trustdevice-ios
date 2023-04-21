//
//  TDMobRiskIdentifierInfo.h
//  TDMobRisk
//
//  Created by zeinber on 2022/12/6.
//

#import "TDMobRiskBaseInfo.h"

@interface TDMobRiskIdentifierInfo : TDMobRiskBaseInfo
/** Identifier */
/// idfv
@property (nonatomic, copy) NSString *idfv;

/// cloudid
@property (nonatomic, copy) NSString *cloudid;
@end
