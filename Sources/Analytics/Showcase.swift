@main
public struct Showcase {
    public static func main() {
        Analytics.api = ConsoleMockApi()
        Analytics
                .provider(.onboarding)
                .next(.image)
                .next(.button)
                .token(.click)
                .payload(.time, "22:00")
                .payload(.user, "admin")
                .send()

        track(.onboarding, .button, .click) {
            [.time => "22.22", .user => "Nikita"]
        }
    }
}

/**
 *
 * Kotlin implementation
 * track {
 *    token { provider[ONBOARDING][IMAGE][BUTTON](CLICK) }
 *    payload {
 *        TIME payload "22:00"
 *    }
 * }
 *
 * Kotlin implementation with Context Receivers (experimental)
 * track {
 *    token[ONBOARDING][IMAGE][BUTTON](CLICK)
 *    TIME payload "22:00"
 * }
 *
 **/