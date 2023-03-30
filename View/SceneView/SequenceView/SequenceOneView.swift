//
//  SwiftUIView.swift
//
//
//  Created by Yun Dongbeom on 2023/03/27.
//

import SwiftUI
import AVFoundation
import Combine

/*시퀀스 원
 - BigCoffee_Back_1/2 걸음(12걸음 뒤 자동으로 멈춤)
 
 - Object_WaterPurifier 맵과 같이 내려온다.(3000ms, 도착지로부터 y = -650에서 출발)
 
 - Image_Water 팝업
 
 - Image_Water 사라짐
 
 - Quiz 1 나타남 > 이건 여기서 구현?
 
 - Quiz 1 사라짐 > 이건 여기서 구현?
 
 - BigMuho_Side_1/2 걸음(12걸음 뒤 자동으로 멈춤)
 
 */

struct SequenceOneView: View {
    @EnvironmentObject var globalStore: GlobalStore
    @State var isPaddleBtnActive = false
    @State private var isCharacterMove = true
    @State private var isJolJol = false
    @State private var isJolJolMove = false
    @State private var isMuho = false
    
    
    
    let backgroundMusicFiles = ["BGM_Adventure_Rest", "Walk"]
    let soundEffectFiles = ["SFX_SeqOne_sound_neutral6", "SFX_SeqOne_lowhealth_alarmloop7", "SFX_SeqOne_sound_neutral11", "SFX_SeqOne_alarm_loop6", "SFX_SeqOne_coin_double7"] // add the names of your sound effect files here
    let musicFileExtension = "wav" // add the extension of your music files here
    let musicFileExtension1 = "m4a"
    //let soundEffectCountIntervals = [2, 4] // play sound effects when the count is equal to these values
    
    let volume: Float = 0.1 // adjust this value to set the volume
    let volume1: Float = 0.3
    
    @State private var currentCount = 0
    @State private var backgroundMusicPlayer: AVPlayer?
    @State private var soundEffectPlayer: AVPlayer?
    @State private var currentPlayCount = 0
    
    
    private func handleSequenceView(scriptCount: Int) {
        switch scriptCount {
        case 1, 4, 5, 6, 10, 11:
            isCharacterMove = false
            print("scriptCount", scriptCount)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.001) {
                isCharacterMove = true
            }
        case 2: // JolJol 나옴
            isCharacterMove = false
            print("scriptCount", scriptCount)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.001) {
                isCharacterMove = true
            }
            isJolJolMove = true
        case 3: // JolJol 움직임
            isCharacterMove = false
            isJolJolMove = false
            print("scriptCount", scriptCount)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.001) {
                isCharacterMove = true
            }
            isJolJol = true
        case 7: // JolJol 없어짐
            isCharacterMove = false
            isJolJol = false
            isJolJolMove = false
            print("scriptCount", scriptCount)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.001) {
                isCharacterMove = true
            }
        case 8:
            isMuho = true
        case 9:
            isMuho = false
            
        default:
            print("scriptCount", scriptCount)
        }
    }
    
    var body: some View {
        ZStack(alignment: .topLeading){
            Text("globalStore.scriptCount: \(globalStore.scriptCount)")
            
            if isCharacterMove {
                CharacterView(objectName: "BigCoffee_", makeDirection: .Back_1, start: (195, 540), end: (0, 0))
            }
            
            if isJolJol {
                JolJolView(start: (195, 150), end: (0, 0), imageOffset: true)
            }
            if isJolJolMove {
                JolJolView(start: (195, 150), end: (0, -150), imageOffset: true)
            }
            if isMuho {
                CharacterView(objectName: "BigMuho_", makeDirection: .Side_1, start: (0, 440), end: (100, 0))
            }
            
        }
        .onReceive(globalStore.$scriptCount, perform: { currentCount in
            handleSequenceView(scriptCount: currentCount)
            switch currentCount {
            case 0:
                let musicFileName = backgroundMusicFiles[1] // count starts at 1, but array index starts at 0
                let musicFileUrl = Bundle.main.url(forResource: musicFileName, withExtension: musicFileExtension)!
                backgroundMusicPlayer = AVPlayer(url: musicFileUrl)
                backgroundMusicPlayer?.volume = volume
                backgroundMusicPlayer?.play()
            case 1:
                let musicFileName = soundEffectFiles[0] // count starts at 1, but array index starts at 0
                let musicFileUrl = Bundle.main.url(forResource: musicFileName, withExtension: musicFileExtension)!
                backgroundMusicPlayer = AVPlayer(url: musicFileUrl)
                backgroundMusicPlayer?.volume = volume
                backgroundMusicPlayer?.play()
            case 2:
                let musicFileName = soundEffectFiles[1] // count starts at 1, but array index starts at 0
                let musicFileUrl = Bundle.main.url(forResource: musicFileName, withExtension: musicFileExtension)!
                backgroundMusicPlayer = AVPlayer(url: musicFileUrl)
                backgroundMusicPlayer?.volume = volume
                backgroundMusicPlayer?.play()
            case 5:
                let musicFileName = soundEffectFiles[2] // count starts at 1, but array index starts at 0
                let musicFileUrl = Bundle.main.url(forResource: musicFileName, withExtension: musicFileExtension)!
                backgroundMusicPlayer = AVPlayer(url: musicFileUrl)
                backgroundMusicPlayer?.volume = volume
                backgroundMusicPlayer?.play()
            case 7:
                let musicFileName = soundEffectFiles[3] // count starts at 1, but array index starts at 0
                let musicFileUrl = Bundle.main.url(forResource: musicFileName, withExtension: musicFileExtension)!
                backgroundMusicPlayer = AVPlayer(url: musicFileUrl)
                backgroundMusicPlayer?.volume = volume
                backgroundMusicPlayer?.play()
                
            default:
                break
            }
        })
        
    }
}

struct SequenceOneView_Previews: PreviewProvider {
    static var previews: some View {
        SequenceOneView()
    }
}
