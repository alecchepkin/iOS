//: Playground - noun: a place where people can play

import UIKit

protocol JSONParsable {
    static func parse(json: [String: AnyObject]) throws -> Self
}

protocol StringValidationError {
    
}

protocol StringValidationRule {
    func validate(string: String) throws -> Bool
    var errorType: StringValidationError { get }
}

protocol StringValidator {
    var validationRules: [StringValidationRule] { get }
    func validate(string: String) -> (valid: Bool,
        errors: [StringValidationError])
}

extension StringValidator { // 1
    func validate(string: String) -> (valid: Bool,
        errors: [StringValidationError]) { // 2
            var errors = [StringValidationError]() // 3
            for rule in validationRules { // 4
                do { // 5
                    try rule.validate(string) // 6
                } catch let error as StringValidationError { // 7
                    errors.append(error) // 8
                } catch let error { // 9
                    fatalError("Unexpected error type: \(error)")
                }
            }
            return (valid: errors.isEmpty, errors: errors) // 10
    }
}

struct StartsWithCharacterStringValidationRule
: StringValidationRule {
    let characterSet: NSCharacterSet // 1
    let description: String // 2
    var errorType: StringValidationError { // 3
        return .MustStartWith(set: characterSet,
            description: description)
    }
    func validate(string: String) throws -> Bool {
        if string.startsWithCharacterFromSet(characterSet) {
            return true
        } else {
            throw errorType // 4
        }
    }
}