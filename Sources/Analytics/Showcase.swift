@main
public struct Showcase {
    public static func main() {
        Analytics.api = ConsoleMockApi()
        Analytics
                .token(key: .onboarding)
                .next(key: .button)
                .token(key: .click)
                .track()
    }
}
