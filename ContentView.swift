import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject
    var globalStore: GlobalStore
    
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
            globalStore.updateSafeAreaSize(currentSafeAreaSize: safeAreaSize)
        }
    }
}

struct contentView_preview: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
