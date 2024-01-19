//
//  RequestReviewView.swift
//  Instafilter
//
//  Created by Jeevan Mahtani on 12/1/24.
//

import StoreKit
import SwiftUI

struct RequestReviewView: View {
    @Environment(\.requestReview) var requestReview
    
    var body: some View {
        Button("Leave Review") {
            requestReview()
        }
    }
}

#Preview {
    RequestReviewView()
}
