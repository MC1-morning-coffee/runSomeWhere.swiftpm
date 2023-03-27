import SwiftUI

@main
struct MyApp: App {
    let globalStore = GlobalStore()
    
    init() {
        CustomFont.registerFonts(fontName: "morris9")
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(globalStore)
        }
    }
}
