//
//  String.swift
//  CodeChallengeShytsko
//
//  Created by Ilya Shytsko on 15.03.24.
//

import UIKit

extension String {
    var isBlank: Bool {
        trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).isEmpty
    }

    var isNotEmpty: Bool {
        !isEmpty
    }

    func trim() -> String {
        trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }

    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = capitalizingFirstLetter()
    }
    
    var encodedUrl: URL? {
//        guard let encodedString = addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed) else { return nil }
        return URL(string: self)
    }

}

extension Optional where Wrapped == String {
    var isNilOrEmpty: Bool { self?.isEmpty ?? true }
    var isNilOrBlank: Bool { self?.isBlank ?? true }
    
    func trim() -> String { return self?.trim() ?? ""}
}
