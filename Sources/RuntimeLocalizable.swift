//
//  RuntimeLocalizable.swift
//  RuntimeLocalizable
//
//  Created by Sebastian Owodzin on 30/08/2017.
//  Copyright © 2017 mobiletoolkit.org. All rights reserved.
//

import Foundation

var languageBundleKey: UInt8 = 0

public class RuntimeLocalizableBundle : Bundle {
    public override func localizedString(forKey key: String, value: String?, table tableName: String?) -> String {
        guard let languageBundle = languageBundle else {
            return super.localizedString(forKey: key, value: value, table: tableName)
        }

        return languageBundle.localizedString(forKey: key, value: value, table: tableName)
    }
}

extension Bundle {
    var languageBundle: Bundle? {
        get {
            return objc_getAssociatedObject(self, &languageBundleKey) as? Bundle
        }
    }

    public class func setLanguage(_ language: String) {
        if let path = Bundle.main.path(forResource: language, ofType: "lproj") {
            object_setClass(Bundle.main, RuntimeLocalizableBundle.self)

            objc_setAssociatedObject(Bundle.main, &languageBundleKey, Bundle.init(path: path), .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }

    public class func resetLanguage() {
        objc_removeAssociatedObjects(Bundle.main)

        object_setClass(Bundle.main, Bundle.self)
    }
}
