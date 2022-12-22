//
//  MobRiskSDKSwiftAPI.swift
//  TrustDeviceApp
//
//  Created by zeinber on 2022/12/8.
//

import Foundation

/** Note: The core API of the SDK will be called using the Swift method */
@objcMembers class MobRiskSDKSwiftAPI : NSObject {
    /// Called initWithOptions by Swift.
    class func initWithOptions() {
        var options = [String : NSObject]()
        let responseCallback: ([String : Any])-> Void = { response in
            NotificationCenter.default.post(name: Notification.Name("MobRiskSDK_InitWithOptions_Response"), object: response)
        }
        options["callback"] = unsafeBitCast(responseCallback as @convention(block) ([String : Any]) -> Void, to: AnyObject.self) as? NSObject
        let manager = TongdunMobRiskManager.sharedManager()
        manager?.pointee.initWithOptions(options)
    }
}
