//
//  StringUtils.swift
//  ACNavigationBar
//
//  Created by Andrey Chernoprudov on 01/12/16.
//  Copyright © 2016 Little Stars. All rights reserved.
//

extension String {
    
    static func isEmpty(string: String?) -> Bool {
        return string?.isEmpty ?? true
    }
    
    static func isEmptyTrim(string: String?) -> Bool {
        return isEmpty(string: string?.trimmingCharacters(in: .whitespacesAndNewlines))
    }
    
    static func isNotEmpty(string: String?) -> Bool {
        return !isEmpty(string: string)
    }

}
