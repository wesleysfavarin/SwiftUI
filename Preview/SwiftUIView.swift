//
//  SwiftUIView.swift
//  Preview
//
//  Created by wesley s favarin on 07/06/19.
//  Copyright © 2019 wesley s favarin. All rights reserved.
//

import SwiftUI

struct SwiftUIView : View {
    var body: some View {
        Text("Hello Word!")
        
    }
}

#if DEBUG
struct SwiftUIView_Previews : PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
#endif
