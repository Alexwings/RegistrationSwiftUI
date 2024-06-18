//
//  RegistrationTextCell.swift
//  RegistrationSwiftUI
//
//  Created by Xinyuan_Wang on 2024/2/23.
//

import SwiftUI

struct RegistrationTextCell: View {
    @FocusState private var inputActivated: Bool
    let titleText: String
    @Binding var text: String
    init(title: String, value: Binding<String>) {
        titleText = title
        _text = value
    }
    
    var body: some View {
        HStack {
            Text(titleText)
                .fontWeight(.bold)
            Spacer(minLength: 100)
            TextField("Input Text",
                      text: $text)
                .focused($inputActivated)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled(true)
                .textFieldStyle(.roundedBorder)
                .multilineTextAlignment(.center)
                .frame(width: 150, height: 65)
        }
        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
    }
}

struct RegistrationTextCell_previews: PreviewProvider {
    
    @State static var text: String = ""
    static var previews: some View {
        RegistrationTextCell(title: "名称", value:$text)
    }
}
