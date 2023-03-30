import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject
    var globalStore: GlobalStore
    
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .topLeading) {
                VStack(spacing: 0){
                    SceneView()
                    // 캐릭터자체를 띄우는 뷰 -> 사람에 따라서 olive.name이런식으로 넣으면 됨 (UserData를 참고하면 됨!)
                    CharacterView(objectName: henry.name, makeDirection: EnumDirection.Back_1, start: (10.0, 0.0), end: (10.0, -280.0))
                    
                    // 모달 뷰를 중간까지만 띄우는 방법은 iOS16부터만 지원 가능..
                    if #available(iOS 16.0, *) {
                        QuizModalView()
                    } else {
                        // Fallback on earlier versions
                        // iOS16보다 이전 버전이면 보내는 메시지 (모달뷰 기능이 안됨)
                    }
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
