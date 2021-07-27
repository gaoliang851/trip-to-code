//
//  main.swift
//  iOS从OC迁移到Swift
//
//  Created by mac on 2020/12/6.
//

import UIKit

let sharedHelper : Helper = {
    Helper()
}()
class Helper {
    var address: String?
}

sharedHelper.address = "adfdasf"
print(sharedHelper.address!) //adfdasf

class MyApplication: UIApplication { }
UIApplicationMain(CommandLine.argc,
                  CommandLine.unsafeArgv,
                  NSStringFromClass(MyApplication.self),
                  NSStringFromClass(AppDelegate.self))
