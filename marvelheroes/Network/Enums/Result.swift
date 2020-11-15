//
//  Result.swift
//  marvelheroes
//
//  Created by Joyce Rosario Batista on 13/11/2020.
//  Copyright © 2020 Joyce Rosario Batista. All rights reserved.
//

import Foundation

public enum Result<T> {
    case success(T)
    case error(Error)
    
    public init(value: T) {
        self = .success(value)
    }
    
    public init(error: Error) {
        self = .error(error)
    }
}
