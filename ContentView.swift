import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject
    var globalStore: GlobalStore
    
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
                if globalStore.isSelectCharcterViewActive {
                    SelectCharcterView(width: geo.size.width)
                        .zIndex(1)
                        .offset(y: geo.size.height - SCRIPT_BOX_HEIGHT)
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

struct contentView_preview: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
