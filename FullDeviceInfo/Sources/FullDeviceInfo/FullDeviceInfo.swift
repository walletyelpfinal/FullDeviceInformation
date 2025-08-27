// The Swift Programming Language
// https://docs.swift.org/swift-book

import UIKit
import FullDeviceInfoObjc
import SwiftUI




class FullDeviceInfo: NSObject {
    
    @MainActor func fd_infos() -> [String: String] {
        var yucca: [String: String] = [:]
        
        yucca["uuid"] = InfoManager.verboseUlterior()
        yucca["idfa"] = InfoManager.xystusVacillate()
        yucca["idfv"] = InfoManager.veracityUnctuous()
        yucca["phoneMark"] = InfoManager.unearthTadpole()
        yucca["phoneType"] = InfoManager.xenophobia()
        yucca["systemVersions"] = InfoManager.tabernaclSalient()
        yucca["versionCode"] = InfoManager.ruminate()
        yucca["screenResolution"] = InfoManager.salutationRarefy()
        
        let screenBounds = UIScreen.main.bounds
        yucca["screenWidth"] = String(format: "%.0f", screenBounds.size.width)
        yucca["screenHeight"] = String(format: "%.0f", screenBounds.size.height)
        
        yucca["cpuNum"] = InfoManager.yesterdaXylem()
        yucca["ramCanUse"] = InfoManager.virtueCover()
        yucca["ramTotal"] = InfoManager.understanTackle()
        yucca["batteryLevel"] = InfoManager.vegetablKnown()
        yucca["cashCanUse"] = InfoManager.unhappiness()
        yucca["cashTotal"] = InfoManager.wrapVacuum()
        yucca["totalBootTime"] = String(format: "%lld", InfoManager.welcomeYouthful())
        yucca["totalBootTimeWake"] = InfoManager.weatherYoung()
        yucca["defaultLanguage"] = InfoManager.yourselves()
        yucca["defaultTimeZone"] = InfoManager.recumbentSynergy()
        yucca["isvpn"] = InfoManager.synonymous()
        yucca["debugged"] = InfoManager.stratagemRaiment()
        yucca["simulated"] = InfoManager.susceptible()
        yucca["proxied"] = InfoManager.chemicalSymmetry()
        yucca["charged"] = InfoManager.logisticsRationale()
        yucca["lastBootTime"] = InfoManager.recapitulate()
        yucca["screenBrightness"] = InfoManager.sacerdotaTenet()
        yucca["wifiName"] = InfoManager.zygomatic()
        yucca["wifiBssid"] = InfoManager.walloWatt()
        yucca["network"] = InfoManager.stellarConditions()
        yucca["rooted"] = InfoManager.sanctimonious()
        
        return yucca
    }
    
    func fd_xerophyte() -> String {
        return InfoManager.xerophyte()
    }
    
    func fd_dicToStr(_ walk: [String: Any]) -> String {
        return InfoManager.convertXylophone(walk)
    }
    
    func fd_strAddSpace(_ unce: String) -> String {
        return InfoManager.formatString(withSpaceRenounce: unce)
    }
    
    func fd_books() -> [[String: Any]] {
        return HopeRock().spectralUncannyBook()
    }
    
    func fd_ua(_ lutra: String) -> String {
        return HopeRock.renaissaNcerue(lutra)
    }
}




extension Color {

    init(_ hex: String) {
        var hexString = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        if hexString.hasPrefix("#") {
            hexString.remove(at: hexString.startIndex)
        }

        guard hexString.count == 6 else {
            self.init(white: 1.0)
            return
        }

        var rgbValue: UInt64 = 0
        Scanner(string: hexString).scanHexInt64(&rgbValue)

        let red = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgbValue & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue)
    }
}


extension UIColor {

    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        
        var rgb: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgb)
        
        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}
