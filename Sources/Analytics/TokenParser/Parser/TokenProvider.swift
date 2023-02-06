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
        ConcatTokenProvider(currentToken: "\(currentToken) \(key)")
    }

    func token(key: TokenKey) -> String {
        currentToken + " \(key)"
    }
}
