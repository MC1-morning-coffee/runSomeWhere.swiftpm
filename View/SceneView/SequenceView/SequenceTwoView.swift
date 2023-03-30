//
//  SwiftUIView.swift
//  
//
//  Created by Yun Dongbeom on 2023/03/27.
//

import SwiftUI
import AVFoundation
import Combine

struct SequenceTwoView: View {
    
    @EnvironmentObject
    var globalStore: GlobalStore
    
    @State
    var isAutoDoorButtonActive = false
    
    @State
    var isMainDoorOpen = false
    
    @State
    var isWrongDoorOpen = false
    
    @State
    var isWrongAutoDoorComing = false
    
    @State
    var isWrongDoorComeActive = false
    
    @State
    var isMainAutoDoorComing = false
    
    @State
    var isMainDoorComeActive = false
    
    @State
    var isCharacterMove = false
    
    @State
    var isDoorButtonClicked = false
    
    
    
    
    let backgroundMusicFiles = ["Walk"]
     let soundEffectFiles = ["SFX_SeqTwo_sound_nagger2", "SFX_SeqTwo_sounds_button6", "SFX_SeqTwo_interaction20", "SFX_SeqTwo_menu_move4", "SFX_SeqOne_sound_neutral11"] // add the names of your sound effect files here
     let musicFileExtension = "wav" // add the extension of your music files here
     let musicFileExtension1 = "wav"
     //let soundEffectCountIntervals = [2, 4] // play sound effects when the count is equal to these values
     
     let volume: Float = 0.1 // adjust this value to set the volume
     let volume1: Float = 0.3
     
     @State private var currentCount = 0
     @State private var backgroundMusicPlayer: AVPlayer?
     @State private var soundEffectPlayer: AVPlayer?
     @State private var currentPlayCount = 0

    
    
    
    private func handleSequenceView(scriptCount: Int) {
        switch scriptCount {
            case 0 :
                isCharacterMove = true
                isWrongAutoDoorComing = true
                isWrongDoorComeActive = true
                isMainAutoDoorComing = true
                isMainDoorComeActive = true
            case 3:
                isAutoDoorButtonActive = true
            case 5:
                isAutoDoorButtonActive = false
                isDoorButtonClicked = true
            case 6:
                isAutoDoorButtonActive = true
                isDoorButtonClicked = false
                isWrongAutoDoorComing = false
                isWrongDoorOpen = true
            case 9:
                isMainAutoDoorComing = false
                isMainDoorOpen = true
            case 11:
                isCharacterMove = false
                isMainDoorOpen = false
                isWrongDoorOpen = false
                isAutoDoorButtonActive = false
            default:
                print("scriptCount", scriptCount)
        }
    }
    var body: some View {
        ZStack {
            if isCharacterMove {
                CharacterView(objectName: "BigMuho_", makeDirection: EnumDirection.Back_1, start: (170, 522), end: (0, 0))
                CharacterView(objectName: "BigCoffee_", makeDirection: EnumDirection.Back_1, start: (220, 522), end: (0, 0))
            }
            if isWrongAutoDoorComing{
                        Image("Object_Door_Closed")
                        .position(x: 320, y: 165)
                        .offset(x: 0 , y: (isWrongDoorComeActive ? -650 : 0))
                        .onAppear {
                            withAnimation(.linear(duration: 3))
                            {
                                isWrongDoorComeActive.toggle()
                                
                            }
                        }
            }
            if isMainAutoDoorComing{
                        Image("Object_Door_Closed")
                        .position(x: 195, y: 165)
                        .offset(x: 0, y: (isMainDoorComeActive ? -650 : 0))
                        .onAppear {
                            withAnimation(.linear(duration: 3))
                            {
                                isMainDoorComeActive.toggle()
                                
                            }
                        }
            }
            if isAutoDoorButtonActive {
                Image("Object_DoorButton")
                    .position(x: 140, y: 380)
            }
            if isDoorButtonClicked{
                Image("Object_DoorButton_Dark")
                    .position(x: 140, y: 380)
            }
            if isMainDoorOpen {
                //center Door
                AutoDoorView()
                    .position(x: 195, y: 165)
            }
            if isWrongDoorOpen {
                //Right Door
                AutoDoorView()
                    .position(x: 320, y: 165)
            }
        }
        .onReceive(globalStore.$scriptCount, perform: { currentCount in
            handleSequenceView(scriptCount: currentCount)
            
            switch currentCount {
            case 0:
                let musicFileName = backgroundMusicFiles[0]
                
                    let musicFileUrl =  Bundle.main.url(forResource: musicFileName,
                                                        withExtension: musicFileExtension)!
                    backgroundMusicPlayer = AVPlayer(url: musicFileUrl)
                    backgroundMusicPlayer?.volume = volume
                    backgroundMusicPlayer?.play()
            case 1:
                let musicFileName = soundEffectFiles[1]
                
                    let musicFileUrl =  Bundle.main.url(forResource: musicFileName,
                                                        withExtension: musicFileExtension)!
                    backgroundMusicPlayer = AVPlayer(url: musicFileUrl)
                    backgroundMusicPlayer?.volume = volume
                    backgroundMusicPlayer?.play()
            case 5:
                let musicFileName = soundEffectFiles[3]
                
                    let musicFileUrl =  Bundle.main.url(forResource: musicFileName,
                                                        withExtension: musicFileExtension)!
                    backgroundMusicPlayer = AVPlayer(url: musicFileUrl)
                    backgroundMusicPlayer?.volume = volume
                    backgroundMusicPlayer?.play()
            case 6:
                let musicFileName = soundEffectFiles[2]
                
                    let musicFileUrl =  Bundle.main.url(forResource: musicFileName,
                                                        withExtension: musicFileExtension)!
                    backgroundMusicPlayer = AVPlayer(url: musicFileUrl)
                    backgroundMusicPlayer?.volume = volume
                    backgroundMusicPlayer?.play()
            case 7:
                let musicFileName = soundEffectFiles[0]
                
                    let musicFileUrl =  Bundle.main.url(forResource: musicFileName,
                                                        withExtension: musicFileExtension)!
                    backgroundMusicPlayer = AVPlayer(url: musicFileUrl)
                    backgroundMusicPlayer?.volume = volume
                    backgroundMusicPlayer?.play()
            case 8:
                let musicFileName = soundEffectFiles[4]
                
                    let musicFileUrl =  Bundle.main.url(forResource: musicFileName,
                                                        withExtension: musicFileExtension)!
                    backgroundMusicPlayer = AVPlayer(url: musicFileUrl)
                    backgroundMusicPlayer?.volume = volume
                    backgroundMusicPlayer?.play()
            case 9:
                let musicFileName = soundEffectFiles[2]
                
                    let musicFileUrl =  Bundle.main.url(forResource: musicFileName,
                                                        withExtension: musicFileExtension)!
                    backgroundMusicPlayer = AVPlayer(url: musicFileUrl)
                    backgroundMusicPlayer?.volume = volume
                    backgroundMusicPlayer?.play()
                
            default:
                break
            }
        })
    }
}

//struct SequenceTwoView_Previews: PreviewProvider{
//    static var previews: some View{
//        SequenceTwoView()
//    }
//}


/*시퀀스 투
 - Big_Coffee_Back_1/2 걷는다. (12걸음 뒤 자동 멈춤)
 Big_Muho_Back_1/2 걷는다. (12걸음 뒤 자동 멈춤)
 
 - Object_Door 맵에 나타난다.(3000ms, 도착지로부터 y = -650에서 출발)
 
 - Image_Door 팝업된다.
 
 - Imgae_Door 사라진다.
   Object_DoorButton 나타난다.
 
 - 오른쪽 자동문 열린다.
 
 - Quiz 2 팝업/사라진다.
 
 - 왼쪽 자동문 열린다.
 
 - Coffee/Muho 걷는다.
 */
