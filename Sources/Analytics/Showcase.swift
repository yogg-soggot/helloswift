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
