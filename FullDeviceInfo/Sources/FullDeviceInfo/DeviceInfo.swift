//
//  DeviceInfo.swift
//  FullDeviceInfo
//
//  Created by pastry on 27/08/25.
//

import UIKit

class DeviceInfo: NSObject {

    @MainActor static let share = DeviceInfo()
    
    func uuidStr(_ s: String) -> String {
        return s.isEmpty ? "uuid": s
    }
}
