@main
public struct Showcase {
    public static func main() {
        ConsoleMockApi().event(token: "token1", payload: [EventPayload(param: "param", value: "value")]);
    }
}
