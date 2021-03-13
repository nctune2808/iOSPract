//
//  CameraView.swift
//  CardWallet
//
//  Created by Tuan on 09/03/2021.
//

import SwiftUI


struct CameraView : View {
    
    @StateObject var camera = CameraViewModel()

    var body: some View {
        
        ZStack{
            
            
            
            Camera(camera: camera)
                .ignoresSafeArea(.all, edges: .all)
            
            VStack{
                Spacer()
                
                HStack{
                    
                    if camera.isTaken{
                        Button(action: {
                            if !camera.isSaved{
                                camera.savePic()
                            }
                        }, label: {
                            Text(camera.isSaved ? "Saved": "Save")
                                .foregroundColor(.black)
                                .fontWeight(.semibold)
                                .padding(.vertical,10)
                                .padding(.horizontal,20)
                                .background(Color.white)
                                .clipShape(Capsule())
                        })
                        .padding()
                        
                        Spacer()
                        
                        Button(action: {
                            camera.retakePic()
                        }, label: {
                            Text("Cancel")
                                .foregroundColor(.black)
                                .fontWeight(.semibold)
                                .padding(.vertical,10)
                                .padding(.horizontal,20)
                                .background(Color.white)
                                .clipShape(Capsule())
                        })
                        .padding()
                        
                    } else {
                        Button(action: {
                            camera.takePic()
                        }, label: {
                            ZStack{
                                Circle()
                                    .fill(Color.white)
                                    .frame(width: 65, height: 65)
                                
                                Circle()
                                    .stroke(Color.white, lineWidth: 2)
                                    .frame(width: 75, height: 75)
                            }
                        })
                    }
                }
            }
            
        }
        .onAppear(perform: {
            camera.checkCam()
        })
        .alert(isPresented: $camera.alert){
            Alert(title: Text("Please, Enable Camera Access"))
        }
//        .onChange(of: offset, perform: { value in
//
//
//            if value == 0 && !camera.session.isRunning {
//                camera.session.startRunning()
//            } else {
//                if camera.session.isRunning {
//                    camera.session.stopRunning()
//                }
//            }
//        })
        
//        VStack {
//            if cameraData.imageData.count == 0 {
//                Text("Pick an image to process!!!")
//            }
//            Button(action: {cameraData.imagePicker.toggle()}) {
//                Image(systemName: "photo")
//                    .font(.title2)
//            }
//        }
//        .toolbar {
//            ToolbarItem(placement: .navigationBarTrailing) {
//
//            }
//        }
//        .sheet(isPresented: $cameraData.imagePicker) {
//            ImagePicker(picker: $cameraData.imagePicker, imageData: $cameraData.imageData)
//        }
        
        
    }
}
