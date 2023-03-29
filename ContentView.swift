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
//                    CharacterView()
                    // 모달 뷰를 중간까지만 띄우는 방법은 iOS16부터만 지원 가능..
//                    if #available(iOS 16.0, *) {
//                        QuizModalView()
//                    } else {
//                        // Fallback on earlier versions
//                    }
                    ScriptBoxView(script: globalStore.currentScripts[globalStore.scriptCount], width: geo.size.width)
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
//            setTimeoutClosure(timeCount: 3) {
//                isSelectCharcterViewActive.toggle()
//            }
        }
    }
}

struct contentView_preview: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
