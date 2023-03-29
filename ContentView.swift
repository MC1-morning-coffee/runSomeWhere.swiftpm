import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject
    var globalStore: GlobalStore
    
    /**
     스크립트 배열을 변경하기 위한 값
     */
    @State
    var currentSceneCount: Int = 0
    
    let AllScripts: [[Script]] = [
        SEQUENCE_OPENING_SCRIPTS, SEQUENCE_ONE_SCRIPTS, SEQUENCE_TWO_SCRIPTS, SEQUENCE_THREE_SCRIPTS, SEQUENCE_ENDING_SCRIPTS]
    @State
    private var currentScripts: [Script] = []
    
    func updateCurrentSequence() {
        if globalStore.scriptCount > currentScripts.count {
            let _currentSceneCount = currentSceneCount + 1
            currentSceneCount += 1
            globalStore.updateCurrentScene(scene: EnumScene.allCases[_currentSceneCount])
        }
    }
    
    
    var body: some View {
        GeometryReader { geo in
            VStack(spacing: 0){
                SceneView()
                CharacterView()
                // 모달 뷰를 중간까지만 띄우는 방법은 iOS16부터만 지원 가능..
                if #available(iOS 16.0, *) {
                    QuizModalView()
                } else {
                    // Fallback on earlier versions
                }
                ScriptBoxView(width: geo.size.width)
                
            }
            .border(.red, width: 1)
        }
        .onAppear{
            let safeAreaSize = getSafeAreaSize()
            currentScripts = AllScripts[0]
            globalStore.updateSafeAreaSize(currentSafeAreaSize: safeAreaSize)
        }
    }
}

struct contentView_preview: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
