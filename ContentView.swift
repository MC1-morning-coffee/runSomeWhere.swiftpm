import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject
    var globalStore: GlobalStore
    
    var body: some View {
        GeometryReader { geo in
            VStack(spacing: 0){
                SceneView()
//                CharacterView()
                ScriptBoxView(width: geo.size.width)
//                QuizModalView()
            }
            .border(.red, width: 1)
        }
        .onAppear{
            let safeAreaSize = getSafeAreaSize()
            globalStore.updateSafeAreaSize(currentSafeAreaSize: safeAreaSize)
        }
    }
}

struct contentView_preview: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
