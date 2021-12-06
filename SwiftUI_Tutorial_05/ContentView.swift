//
//  ContentView.swift
//  SwiftUI_Tutorial_05
//
//  Created by SeongMinK on 2021/12/06.
//

import SwiftUI

let myPets = ["멍멍이 🐶", "야옹이 🐱", "햄토리 🐹"]

struct ContentView: View {
    @State private var showAlert = false
    @State private var alertText = ""
    @State private var selected = 0
    
    var body: some View {
        NavigationView {
            VStack(spacing: 10) {
                Text("\(myPets[selected])")
                    .font(.system(size: 60))
                    .bold()
                Text("우측 상단의 땡땡땡을 눌러주세요!")
                    .font(.subheadline)
            }
            .navigationTitle("타이틀")
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing,
                    content: {
                    Menu {
                        Section {
                            Button {
                                print("새 파일 만들기 클릭됨")
                                self.showAlert = true
                                self.alertText = "새 파일 만들기"
                            } label: {
                                Label("새 파일 만들기", systemImage: "doc")
                            }
                            
                            Button {
                                print("새 폴더 만들기 클릭됨")
                                self.showAlert = true
                                self.alertText = "새 폴더 만들기"
                            } label: {
                                Label("새 폴더 만들기", systemImage: "folder")
                            }
                        }
                        
                        Section {
                            Button {
                                print("파일 모두 삭제 클릭됨")
                                self.showAlert = true
                                self.alertText = "파일 모두 삭제"
                            } label: {
                                Label("파일 모두 삭제", systemImage: "trash")
                            }
                        }
                        
                        Picker(selection: $selected, label: Text("애완동물 선택")) {
                            ForEach(myPets.indices, id: \.self, content: { index in
                                Text("\(myPets[index])").tag(index)
                            })
                        }
                    } label: {
                        Circle()
                            .foregroundColor(Color.yellow)
                            .frame(width: 50, height: 50)
                            .overlay {
                                Label("더보기", systemImage: "ellipsis")
                                    .font(.system(size: 30))
                                    .foregroundColor(Color.white)
                            }
                    }
                })
            })
            .alert(isPresented: $showAlert, content: {
                Alert(title: Text("알림"), message: Text("\(alertText)"), dismissButton: .default(Text("확인")))
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
