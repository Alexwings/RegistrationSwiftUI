//
//  ContentView.swift
//  RegistrationSwiftUI
//
//  Created by Xinyuan_Wang on 2023/8/21.
//

import SwiftUI

class UserInfo: ObservableObject {
    @Published var firstName: String
    @Published var lastName: String
    @Published var PhoneNumber: String
    @Published var email: String
    @Published var color: Color = .red
    @Published var image: Image
    
    init(firstName: String = "", lastName: String = "", PhoneNumber: String = "", email: String = "", color: Color = .red, image: Image = Image("avatar")) {
        self.firstName = firstName
        self.lastName = lastName
        self.PhoneNumber = PhoneNumber
        self.email = email
        self.color = color
        self.image = image
    }
    
    var name: String {
        return "\(firstName) \(lastName)"
    }
}

struct StyleBorder: ViewModifier {
    private var borderColor: Color
    private var borderWidth: CGFloat
    private var cornerRadius: CGFloat
    
    init(borderColor: Color, borderWidth: CGFloat, cornerRadius: CGFloat) {
        self.borderColor = borderColor
        self.borderWidth = borderWidth
        self.cornerRadius = cornerRadius
    }
    func body(content: Content) -> some View {
        content
            .border(borderColor, width: borderWidth)
            .cornerRadius(cornerRadius)
    }
}

struct RegistrationView: View {
    @StateObject var userInfo: UserInfo = UserInfo()
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                RegistrationImageCell(loginInfo: userInfo, title: "Avatar")
                    .cellStyle()
                RegistrationTextCell(title: "First Name", value: $userInfo.firstName)
                    .cellStyle()
                RegistrationTextCell(title: "Last Name", value: $userInfo.lastName)
                    .cellStyle()
                RegistrationTextCell(title: "Phone Number", value: $userInfo.PhoneNumber)
                    .cellStyle()
                RegistrationTextCell(title: "Email", value: $userInfo.email)
                    .cellStyle()
                Button(action: {
                    print("\(userInfo.name)")
                }, label: {
                    HStack {
                        Spacer()
                        Text("Submit")
                            .font(.system(size: 25))
                            .foregroundStyle(.white)
                        Spacer()
                    }
                    .padding(EdgeInsets(top: 7.5, leading: 15, bottom: 7.5, trailing: 15))
                    .background(Color.cyan, in: RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
                    .padding(EdgeInsets(top: 7.5, leading: 15, bottom: 7.5, trailing: 15))
                })
                Spacer()
            }
            .navigationBarTitle(
                Text("Registration"),
                displayMode: .inline)
        }
    }
}

extension View {
    func cellStyle(borderColor: Color = .black,
                   boderWidth: CGFloat = 3.0,
                   cornerRadius: CGFloat = 8.0) -> some View {
        modifier(StyleBorder(borderColor: borderColor,
                             borderWidth:boderWidth,
                             cornerRadius: cornerRadius))
        .padding(EdgeInsets(top: 7.5, leading: 15, bottom: 7.5, trailing: 15))
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
