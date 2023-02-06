//
// Created by Avein on 06.02.2023.
//

import Foundation

protocol TokenProvider {
    func next(key: TokenKey) -> TokenProvider
    func token(key: TokenKey) -> String
}

class ConcatTokenProvider : TokenProvider { // Most simple implementation. This thing can parse JSON for instance
    init(currentToken: String?) {
        self.currentToken = currentToken ?? ""
    }
    let currentToken: String

    func next(key: TokenKey) -> TokenProvider {
        ConcatTokenProvider(currentToken: "\(currentToken)_\(key)")
    }

    func token(key: TokenKey) -> String {
        currentToken + " \(key)"
    }
}

precedencegroup AnalyticsPrecedence {
    lowerThan: AdditionPrecedence
    associativity: left
}

infix operator |: AnalyticsPrecedence
infix operator |>: AnalyticsPrecedence

func |(lhs: TokenProvider, rhs: TokenKey) -> TokenProvider {
    lhs.next(key: rhs)
}

func |>(lhs: TokenProvider, rhs: TokenKey) -> String {
    lhs.token(key: rhs)
}
