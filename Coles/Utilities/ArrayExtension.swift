
//
//  ArrayExtension.swift
//  Coles
//
//  Created by Teja on 11/08/22.
//

import Foundation

extension Array {
    func element(atIndex index: Int) -> Element? {
        guard index >= 0 else { return .none }
        guard endIndex > index else { return .none }
        return self[index]
    }
}
