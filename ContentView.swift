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
                Text("Just Test !!")
                    .font(Font.custom("morris9", size: 24))
                    .border(.red, width: 1)
                Text("자유롭게 바꿔여...")
                    .font(Font.custom("morris9", size: 32))
                    .fontWeight(.bold)
                    .padding()
                    .border(.red, width: 1)
                Text("잘 부탁드립니다")
                    .font(Font.custom("morris9", size: 32))
                    .fontWeight(.bold)
                    .padding()
                    .border(.red, width: 1)
                Text("World is Hello?")
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
