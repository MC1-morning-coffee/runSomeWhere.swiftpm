//
//  SceneView.swift
//  runSomeWhere
//
//  Created by Yun Dongbeom on 2023/03/26.
//

import SwiftUI

/**
 Sequence가 쌓이느 ContainerView
 */
struct SceneView: View {
    
    @EnvironmentObject
    var globalStore: GlobalStore
    
    private let FACE_VIEW_INFO_SIZE = FACE_VIEW_INFO().size
    
    @State var move: Int = 0

    /**
     rightFaceView의 애니메이션 효과를 위한 값
     */
    @State
    private var rightFaceViewPositionX = 0.0
    
    /**
     leftFaceView의 애니메이션 효과를 위한 값
     */
    @State
    private var leftFaceViewPositionX = 0.0

    private func updateRightFaceViewPositionX(value: CGFloat) {
        rightFaceViewPositionX = value
    }
    
    
    private func showCharcterFaceView() {
        if globalStore.currentScene == .sequence1 {
            if globalStore.scriptCount == 4 {
                globalStore.toggleIsFaceViewActive()
            }else if globalStore.scriptCount == 6 {
                globalStore.toggleIsFaceViewActive()
            }
        }
    }
    
    private func updateLeftFaceViewPositionX(value: CGFloat) {
        leftFaceViewPositionX = value
    }
    
    private func setSequenceView(currentScene: EnumScene) -> any View {
        switch currentScene {
        case .opeaning:
            return SequenceOpeningView()
        case .sequence1:
            return SequenceOneView()
        case .sequence2:
            return SequenceTwoView()
        case .sequence3:
            return SequenceThreeView()
        case .ending:
            return SequenceEndingView()
        }
    }
    
    var body: some View {
        GeometryReader {
            geo in
            let deviceWidth = geo.size.width
            let deviceHeight = geo.size.height
            ZStack(alignment: .topLeading) {
                // SequenceViewContainer
                HStack {
                    AnyView(setSequenceView(currentScene: globalStore.currentScene))
//                    Image("Background_Black")
//                        //.position(x: 195, y: 422)
//                        .offset(x: 195, y: {
//                            if move%2 == 0 { // move변수가 짝수이면
//                                return -50
//                            } else {
//                                return -400
//                            }
//                        }()) //move가 true이면 위쪽으로 이동하기
//                        .animation(.easeOut(duration: 2), value: move) //애니메이션 효과
//                    Button {
//                        move += 1
//                    } label: {
//                        Text("move the character!")
//                            .foregroundColor(.white)
//                    }
                }
                .frame(width: deviceWidth, height: deviceHeight)
                .background(Color.green)
                // FaceViewArea
                if globalStore.isFaceViewActive {
                    let facePositionY = deviceHeight
                    - FACE_VIEW_INFO_SIZE.height
                    // 시작은 무조건 오른쪽부터 시작
                    FaceView(direction: "right", target: globalStore.currentFaces[0])
                        .animation(.linear(duration: 0.4), value: rightFaceViewPositionX)
                        .offset(x: rightFaceViewPositionX, y: facePositionY)
                        .onAppear{
                            updateRightFaceViewPositionX(value: deviceWidth - FACE_VIEW_INFO_SIZE.width) // 동작 테스트 용 코드
                        }
                    // currentFaces의 index 1번째가 있을 경우 무조건 왼쪽에서 보여짐.
                    if globalStore.currentFaces.count > 1 {
                        FaceView(direction: "left", target: globalStore.currentFaces[1])
                            .animation(.linear(duration: 0.4), value: leftFaceViewPositionX)
                            .offset(x: leftFaceViewPositionX, y: facePositionY)
                            .onAppear{
                                updateLeftFaceViewPositionX(value: 0) // 동작 테스트용 코드
                            }
                    }
                }
                if globalStore.isPopupActive {
                    DetailPopupView()
                        .border(.red)
                        .position(x: deviceWidth / 2, y: deviceHeight / 2)
                        .transition(.asymmetric(insertion: .opacity.animation(.linear(duration: 2)), removal: .opacity.animation(.linear(duration: 2))))
                }
            }
            .frame(width: deviceWidth, height: deviceHeight)
            .background(Color.brown)
            .onAppear{
//                동작 테스트용 코드
//                globalStore.toggleIsPopupActive()
                updateRightFaceViewPositionX(value: deviceWidth)
                updateLeftFaceViewPositionX(value: -FACE_VIEW_INFO_SIZE.width)
            }
        }
    }
}
