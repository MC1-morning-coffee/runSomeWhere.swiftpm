import SwiftUI
import AVFoundation

struct ContentView: View {
    @EnvironmentObject
    var globalStore: GlobalStore
        
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .topLeading) {
                
                VStack(spacing: 0){
                    SceneView()
                if globalStore.isScriptBoxOpen {
                    ScriptBoxView(script: globalStore.currentScripts[globalStore.scriptCount], width: geo.size.width)
                }
                }
                if globalStore.isSelectCharcterViewActive {
                    SelectCharcterView(width: geo.size.width)
                        .zIndex(1)
                        .offset(y: geo.size.height - SCRIPT_BOX_HEIGHT)
                }
                if globalStore.isQuizSequence {
                    QuizModalContainerView()
                        .offset(y: geo.size.height - SCRIPT_BOX_HEIGHT)
                        .frame(width: geo.size.width, height: SCRIPT_BOX_HEIGHT)
                }
                if globalStore.isMovieStart {
                    SequenceIntroView()
                        .onTapGesture {
                            globalStore.isMovieStart = false
                        }
                }
            }
        }
        .onAppear{
            /**
             safeArea size 등록
             */
            let safeAreaSize = getSafeAreaSize()
            globalStore.updateSafeAreaSize(currentSafeAreaSize: safeAreaSize)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let globalStore = GlobalStore()
        ContentView().environmentObject(globalStore)
            .previewDevice(PreviewDevice(rawValue: "iPhone 14"))
            .previewDisplayName("iPhone 14")
        
    }
}
