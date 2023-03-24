import SwiftUI

struct ContentView: View {
    
    var body: some View {
        GeometryReader { geo in
            VStack(){
                Spacer()
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                    .padding(.bottom, 1)
                    .border(.red, width: 1)
                Image("test")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: geo.size.width)
                    .border(.red, width: 1)
                Text("테스트 zㅋ")
                    .font(Font.custom("morris9", size: 24))
                    .border(.red, width: 1)
                Text("커피 한잔")
                    .font(Font.custom("morris9", size: 32))
                    .fontWeight(.bold)
                    .padding()
                    .border(.red, width: 1)
                Text("아령하세요~~")
                    .font(Font.custom("morris9", size: 32))
                    .fontWeight(.bold)
                    .padding()
                    .border(.red, width: 1)
                Text("무야호~~")
                    .font(Font.custom("morris9", size: 24))
                    .border(.red, width: 1)
                Spacer()
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
