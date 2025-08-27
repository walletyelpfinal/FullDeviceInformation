// The Swift Programming Language
// https://docs.swift.org/swift-book

import UIKit
import FullDeviceInfoObjc




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
}
