import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { geo in
            VStack(spacing: 0){
                SceneView()
                ScriptBoxView(width: geo.size.width)
            }
            .border(.red, width: 1)
        }
    }
}

struct contentView_preview: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
