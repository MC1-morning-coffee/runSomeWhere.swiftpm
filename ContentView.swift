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
                Text("Real Cham True")
                    .font(Font.custom("morris9", size: 24))
                    .border(.red, width: 1)
                Text("솔직히")
                    .font(Font.custom("morris9", size: 32))
                    .fontWeight(.bold)
                    .padding()
                    .border(.red, width: 1)
                Text("아무리 생각해도")
                    .font(Font.custom("morris9", size: 32))
                    .fontWeight(.bold)
                    .padding()
                    .border(.red, width: 1)
                Text("커피는 최고존엄")
                    .font(Font.custom("morris9", size: 32))
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
