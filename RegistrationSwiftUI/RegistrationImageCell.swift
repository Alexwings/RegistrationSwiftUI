//
//  RegistrationImageCell.swift
//  RegistrationSwiftUI
//
//  Created by Xinyuan_Wang on 2023/8/21.
//

import SwiftUI
import PhotosUI



struct RegistrationImageCell: View {
    @StateObject var loginInfo: UserInfo
    
    var title: String
    @State private var photoItem: PhotosPickerItem?
    
    var body: some View {
        HStack {
            Text(self.title).bold()
            Spacer(minLength: 100)
            ColorPicker("",
                        selection: $loginInfo.color)
            .padding(EdgeInsets(top: 1, leading: 5, bottom: 1, trailing: 5))
            PhotosPicker(selection: $photoItem,
                         matching: .images) {
                HStack {
                    Image(systemName: "pencil.tip.crop.circle.fill")
                        .resizable()
                        .frame(width: 28, height: 28)
                }
                .padding(EdgeInsets(top: 1, leading: 5, bottom: 1, trailing: 5))
            }
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(loginInfo.color)
                    .frame(width: 65,height: 65)
                (self.loginInfo.image)
                    .resizable(resizingMode: .stretch)
                    .clipShape(Circle())
                    .frame(width: 60,height: 60)
            }
        }
        .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
        .onChange(of: photoItem) {
            Task {
                if let photo = try? await photoItem?.loadTransferable(type: Image.self) {
                    loginInfo.image = photo
                } else {
                    loginInfo.image = Image("avatar")
                }
            }
        }
    }
}

struct RegistrationImageCell_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationImageCell(loginInfo: UserInfo(), title: "Avatar")
            .frame(height: 75)
    }
}
