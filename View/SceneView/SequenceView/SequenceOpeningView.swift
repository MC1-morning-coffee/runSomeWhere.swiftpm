//
//  SwiftUIView.swift
//
//
//  Created by Yun Dongbeom on 2023/03/27.
//

import SwiftUI
import AVFoundation

struct SequenceOpeningView: View {

    @EnvironmentObject
    var globalStore: GlobalStore
    
    let audioPlayer = AVPlayer(url: Bundle.main.url(forResource: "sfx_sounds_interaction1", withExtension: "wav")!)
            let volume: Float = 1
            let playCount = 6
            let timeGap: Double = 0.5
        
            @State private var currentPlayCount = 0

    @State
    var isCharcterActive = false
    @State
    var blackbackground1 = false
    @State
    var crowd = false
    @State
    var crowd2 = false
    
    private func handleSequenceView(scriptCount: Int) {
        switch scriptCount {
            case 0:
                blackbackground1 = true
            case 4:
                blackbackground1 = false
                crowd = true
            case 11:
                crowd = false
                crowd2 = true
            default:
                print("scriptCount", scriptCount)
        }
    }

    //var test1 = 0
    var isHidden: Bool = false

    var body: some View {
        ZStack(alignment: .topLeading){
            Text("globalStore.scriptCount: \(globalStore.scriptCount)").onAppear {
                // Start playing the audio when the view appears
                self.audioPlayer.play()
                self.audioPlayer.volume = self.volume
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
            if crowd {
                ZStack{
                    CharacterView(objectName: walker.name, makeDirection: EnumDirection.Back_2, start: (60.0, 550.0), end: (0.0, 0.0))
                    CharacterView(objectName: luna.name, makeDirection: EnumDirection.Back_2, start: (114.0, 560.0), end: (0.0, 0.0))
                    CharacterView(objectName: muho.name, makeDirection: EnumDirection.Back_2, start: (168.0, 540.0), end: (0.0, 0.0))
                    CharacterView(objectName: coffee.name, makeDirection: EnumDirection.Back_2, start: (222.0, 560.0), end: (0.0, 0.0))
                    CharacterView(objectName: olive.name, makeDirection: EnumDirection.Back_2, start: (276.0, 570.0), end: (0.0, 0.0))
                    CharacterView(objectName: henry.name, makeDirection: EnumDirection.Back_2, start: (330.0, 540.0), end: (0.0, 0.0))
                }
                
                if blackbackground1 {
                    Image("Background_Black")
                        .position(x: -100, y: -150)
                }
                
                
            }
            if crowd2 {
                ZStack{
                    CharacterView(objectName: walker.name, makeDirection: EnumDirection.Back_1, start: (60.0, 570.0), end: (0.0, -420.0))
                    CharacterView(objectName: luna.name, makeDirection: EnumDirection.Back_1, start: (114.0, 600.0), end: (0.0, -450.0))
                    CharacterView(objectName: muho.name, makeDirection: EnumDirection.Back_1, start: (168.0, 580.0), end: (0.0, -430.0))
                    CharacterView(objectName: coffee.name, makeDirection: EnumDirection.Back_1, start: (222.0, 560.0), end: (0.0, -410.0))
                    CharacterView(objectName: olive.name, makeDirection: EnumDirection.Back_1, start: (276.0, 570.0), end: (0.0, -420.0))
                    CharacterView(objectName: henry.name, makeDirection: EnumDirection.Back_1, start: (330.0, 540.0), end: (0.0, -390.0))
                }
            }
        }
        .onReceive(globalStore.$scriptCount, perform: { currentCount in
            handleSequenceView(scriptCount: currentCount)
        })
    }
}

/*인트로 시작한다
 - Character 6명이 걸으며 나타난다.(12걸음 뒤 멈춤).
 
 - Image_CBL 팝업
 
 - Image_CBL 사라짐
 
 - Image_Pouch 팝업
 
 - Image_Pouch 사라짐
 Image_Keys 팝업
 
 - Image_Keys 팝업
 Image_Redkey 팝업
 
 - Character 6명이 이동한다.
 
 */
