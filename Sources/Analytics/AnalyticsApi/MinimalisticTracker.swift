//
// Created by Avein on 07.02.2023.
//

import Foundation

func track(_ token: String, _ payload: () -> [EventPayload] = {[]}) {
    trackWithLog(token: token, payload: payload())
}

func track(_ keys: TokenKey..., payload: () -> [EventPayload] = {[]}) {
    let token: String
    switch keys.count {
    case 3...:
        var provider = Analytics.provider(keys[0])
        for key in 1...(keys.count - 2) {
            provider = provider.next(keys[key])
        }
        token = provider.token(keys[keys.count - 1])
    case 2:
        token = Analytics.provider(keys[0]).token(keys[1])
    case 1:
        token = "\(keys[0])"
    default:
        print("You need at least 1 token key")
        return
    }
    trackWithLog(token: token, payload: payload())
}