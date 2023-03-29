import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject
    var globalStore: GlobalStore
    
    /**
     SelectCharcterView를 토글하기 위한 값
     */
    @State
    private var isSelectCharcterViewActive = false
    
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .topLeading) {
                VStack(spacing: 0){
                    SceneView()
    //                CharacterView()
                    ScriptBoxView(width: geo.size.width)
    //                QuizModalView()
                }
                .border(.red, width: 1)
                if isSelectCharcterViewActive {
                    SelectCharcterView(width: geo.size.width)
                        .zIndex(1)
                        .offset(y: geo.size.height - SCRIPT_BOX_HEIGHT)
                }
            }
        }
        .onAppear{
            let safeAreaSize = getSafeAreaSize()
            globalStore.updateSafeAreaSize(currentSafeAreaSize: safeAreaSize)
            setTimeoutClosure(timeCount: 3) {
            }
        }
    }
}

struct contentView_preview: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
