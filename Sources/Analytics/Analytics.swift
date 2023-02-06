@main
public struct Analytics {
    public static func main() {
        ConsoleMockApi().event(token: "token1", payload: [EventPayload(param: "param", value: "value")]);
    }
}
