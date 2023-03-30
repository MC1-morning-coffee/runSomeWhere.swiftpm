//
//  SwiftUIView.swift
//  
//
//  Created by Yun Dongbeom on 2023/03/27.
//

import SwiftUI
import AVFoundation

struct SequenceThreeView: View {
        let audioPlayer = AVPlayer(url: Bundle.main.url(forResource: "sfx_sounds_interaction1", withExtension: "wav")!)
        let volume: Float = 0.02
        let playCount = 6
        let timeGap: Double = 0.5
    
        @State private var currentPlayCount = 0
    
        var body: some View {
            Image("BigCoffee_Back_1")
                .padding()
                .onAppear {
                    // Start playing the audio when the view appears
                    /*self.audioPlayer.play()
                    self.audioPlayer.volume = self.volume*/
                    let _ = Timer.scheduledTimer(withTimeInterval: self.timeGap + self.audioPlayer.currentItem!.asset.duration.seconds, repeats: true) { timer in
                                       if self.currentPlayCount < self.playCount {
                                           self.audioPlayer.seek(to: CMTime.zero)
                                           self.audioPlayer.volume = self.volume
                                           self.audioPlayer.play()
                                           self.currentPlayCount += 1
                                       } else {
                                           timer.invalidate()
                                       }
                                   }
                }
                .onDisappear {
                    // Stop playing the audio when the view disappears
                    self.audioPlayer.pause()
                }
        }
}


// 따로 확인하기 위한 뷰입니다.
struct SequenceThreeView_Previews: PreviewProvider{
    static var previews: some View{
        SequenceThreeView()
    }
}

/*시퀀스 쓰리
 6명이 나와서 걷는다(12걸음 뒤 자동 멈춤)
 도면이미지 나타난다.
 나무와 천 이미지 나타난다.
 도면/나무/천이 위치 이동하여 합쳐진다.
 보트 이미지 나타난다.
 6명이 보트에 탄다.
 마방진이 나타난다.
 패들버튼이 나타난다.
 보트/패들버튼 사라진다.
 6명이 이동한다.
 곰이작 나타난다.
 곰이작 상태변경(밝아진다.)
 보물상자 나타난다.
 */
