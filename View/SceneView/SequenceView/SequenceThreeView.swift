//
//  SwiftUIView.swift
//
//
//  Created by Yun Dongbeom on 2023/03/27.
//

import SwiftUI
import AVFoundation
import Combine

struct SequenceThreeView: View {
    
    @EnvironmentObject
    var globalStore: GlobalStore
    
    let backgroundMusicFiles = ["BGM_Adventure_Explore"]
    let soundEffectFiles = ["Walk", "SFX_SeqThree_sounds_powerup10", "SFX_SeqThree_coin_cluster3", "SFX_SeqThree_menu_select4", "SFX_SeqThree_sound_mechanicalnoise4", "SFX_SeqThree_lowhealth_alarmloop6", "SFX_SeqThree_sounds_fanfare3"] // add the names of your sound effect files here
    let musicFileExtension = "wav" // add the extension of your music files here
    let musicFileExtension1 = "wav"
    //let backgroundMusicCountInterval = 1…2 // play background music when the count is within this range
    //let soundEffectCountIntervals = [2, 4] // play sound effects when the count is equal to these values
       
       let volume: Float = 0.1 // adjust this value to set the volume
       let volume1: Float = 0.3
       
       @State private var currentCount = 0
       @State private var backgroundMusicPlayer: AVPlayer?
       @State private var soundEffectPlayer: AVPlayer?
       @State private var currentPlayCount = 0
        
    @State
    var isPaddleBtnActive = false
    
    /**
     sample
     */
    private func handleSequenceView(scriptCount: Int) {
        switch scriptCount {
            case 19:
                isPaddleBtnActive = true
//            case 20:
//                isPaddleBtnActive = false
            default:
                print("scriptCount", scriptCount)
        }
    }
    var body: some View {
        ZStack(alignment: .topLeading){
            Text("globalStore.scriptCount: \(globalStore.scriptCount)")
            
            if isPaddleBtnActive {
                PaddleButtonView()
            }
        }
        .onReceive(globalStore.$scriptCount, perform: { currentCount in
            handleSequenceView(scriptCount: currentCount)
            
            switch currentCount {
            case 0 :
                let musicFileName = backgroundMusicFiles[0] // count starts at 1, but array index starts at 0
                let musicFileUrl = Bundle.main.url(forResource: musicFileName, withExtension: musicFileExtension)!
                backgroundMusicPlayer = AVPlayer(url: musicFileUrl)
                backgroundMusicPlayer?.volume = volume
                backgroundMusicPlayer?.play()
                
                let effectFileName = soundEffectFiles[0] // count starts at 1, but array index starts at 0
                let effectFileUrl = Bundle.main.url(forResource: effectFileName, withExtension: musicFileExtension1)!
                soundEffectPlayer = AVPlayer(url: effectFileUrl)
                soundEffectPlayer?.volume = volume1
                soundEffectPlayer?.play()

            case 4 :
                //backgroundMusicPlayer?.pause()
                
                let effectFileName = soundEffectFiles[1] // count starts at 1, but array index starts at 0
                let effectFileUrl = Bundle.main.url(forResource: effectFileName, withExtension: musicFileExtension1)!
                soundEffectPlayer = AVPlayer(url: effectFileUrl)
                soundEffectPlayer?.volume = volume1
                soundEffectPlayer?.play()
            case 5 :
                let effectFileName = soundEffectFiles[2] // count starts at 1, but array index starts at 0
                let effectFileUrl = Bundle.main.url(forResource: effectFileName, withExtension: musicFileExtension1)!
                soundEffectPlayer = AVPlayer(url: effectFileUrl)
                soundEffectPlayer?.volume = volume1
                soundEffectPlayer?.play()
            case 7 :
                let effectFileName = soundEffectFiles[3] // count starts at 1, but array index starts at 0
                let effectFileUrl = Bundle.main.url(forResource: effectFileName, withExtension: musicFileExtension1)!
                soundEffectPlayer = AVPlayer(url: effectFileUrl)
                soundEffectPlayer?.volume = volume1
                soundEffectPlayer?.play()
            case 12 :
                let effectFileName = soundEffectFiles[4] // count starts at 1, but array index starts at 0
                let effectFileUrl = Bundle.main.url(forResource: effectFileName, withExtension: musicFileExtension1)!
                soundEffectPlayer = AVPlayer(url: effectFileUrl)
                soundEffectPlayer?.volume = volume1
                soundEffectPlayer?.play()
            case 21 :
                let effectFileName = soundEffectFiles[0] // count starts at 1, but array index starts at 0
                let effectFileUrl = Bundle.main.url(forResource: effectFileName, withExtension: musicFileExtension1)!
                soundEffectPlayer = AVPlayer(url: effectFileUrl)
                soundEffectPlayer?.volume = volume1
                soundEffectPlayer?.play()
            case 22 :
                let effectFileName = soundEffectFiles[5] // count starts at 1, but array index starts at 0
                let effectFileUrl = Bundle.main.url(forResource: effectFileName, withExtension: musicFileExtension1)!
                soundEffectPlayer = AVPlayer(url: effectFileUrl)
                soundEffectPlayer?.volume = volume1
                soundEffectPlayer?.play()
            case 24 :
                let effectFileName = soundEffectFiles[6] // count starts at 1, but array index starts at 0
                let effectFileUrl = Bundle.main.url(forResource: effectFileName, withExtension: musicFileExtension1)!
                soundEffectPlayer = AVPlayer(url: effectFileUrl)
                soundEffectPlayer?.volume = volume1
                soundEffectPlayer?.play()
                
            default:
                break
            }
        })
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
