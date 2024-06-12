//
//  AddThingView.swift
//  TIL
//
//  Created by romashka on 10.06.2024.
//

import SwiftUI

struct AddThingView: View {
    
    @FocusState private var thingIsFocused: Bool
    @State private var thing = ""
    @ObservedObject var someThings: ThingStore
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack {
            TextField("Thing I Learned", text: $thing)
                .textFieldStyle(.roundedBorder)
                .padding()
                //.autocapitalization(.allCharacters)
                .disableAutocorrection(true)
                .focused($thingIsFocused)
                .onAppear { thingIsFocused = true }
            Button("Done") {
                dismiss()
                if !thing.isEmpty {
                    someThings.things.append(thing)
                }
            }
            Spacer()
        }
        .environment(\.textCase, nil)
    }
}


#Preview {
    AddThingView(someThings: ThingStore())
}
