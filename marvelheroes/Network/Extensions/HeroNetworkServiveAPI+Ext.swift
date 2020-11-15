//
//  HeroNetworkServiveAPI+Ext.swift
//  marvelheroes
//
//  Created by Joyce Rosario Batista on 14/11/2020.
//  Copyright © 2020 Joyce Rosario Batista. All rights reserved.
//

import Foundation

extension HeroNetworkServiveAPI: HeroNetworkAPIKeysProtocol {
    
    func getMRVApiKey() -> String {
        return getValue(fromKey: MRVKeys.api.key)
    }
    
    func getMRVHash() -> String {
        return getValue(fromKey: MRVKeys.hash.key)
    }
}

extension HeroNetworkServiveAPI {
    private func getValue(fromKey key: String) -> String {
        guard let filePath = Bundle.main.path(forResource: "MRV-info", ofType: "plist") else { fatalError("Couldn't find MFV-info.plist file") }
        let plist = NSDictionary(contentsOfFile: filePath)
        guard let value = plist?.object(forKey: key) as? String else { fatalError("Couldn't find key 'API_KEY' in MRV-info.plist file") }
        return value
    }
}
