import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("반갑읍니다...")
                .font(Font.custom("morris9", size: 32))
                .fontWeight(.bold)
                .padding(.bottom, 8)
            Text("World is Hello?")
                .font(Font.custom("morris9", size: 24))
        }
    }
}


struct contentView_preview: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
