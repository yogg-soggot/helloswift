//
// Created by Avein on 07.02.2023.
//

import Foundation

prefix operator <|

prefix func <|(key: TokenKey) -> TokenProvider {
    Analytics.provider(key)
}

precedencegroup AnalyticsPrecedence {
    lowerThan: AdditionPrecedence
    associativity: left
}

infix operator |: AnalyticsPrecedence
infix operator |>: AnalyticsPrecedence

func |(lhs: TokenProvider, rhs: TokenKey) -> TokenProvider {
    lhs.next(rhs)
}

func |>(lhs: TokenProvider, rhs: TokenKey) -> String {
    lhs.token(rhs)
}

func track(_ token: String, _ payload: () -> [EventPayload] = {[]}) {
    trackWithLog(token: token, payload: payload())
}
