/// Copyright (c) 2021 Razeware LLC
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// This project and source code may use libraries or frameworks that are
/// released under various Open-Source licenses. Use of those libraries and
/// frameworks are governed by their own individual licenses.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import SwiftUI

struct ContrastListView: View {
  @Environment(\.accessibilityInvertColors) var invertColors
  @ObservedObject var viewModel = ContrastViewModel(count: 9)

  var body: some View {
    NavigationView {
      List(0 ..< viewModel.contrasts.count) { index in
        ListCellView(contrast: self.$viewModel.contrasts[index])
      }
      .navigationBarTitle("Contrast Ratios")
      .alert(isPresented: .constant(invertColors)) {
        Alert(title: Text("Please turn off Smart Invert."),
              message: Text("Smart Invert does not work. \nDark Mode is okay."))
      }
    }
  }
}

struct ListCellView: View {
  @Binding var contrast: ContrastModel
  @State private var editColors = false

  var body: some View {
    ZStack {
      contrast.bkgd.colorView
      VStack {
        Button(action: { self.editColors = true }) {
          Text("Edit colors")
            .font(.body)
            .foregroundColor(contrast.text.colorView)
            .frame(height: 60)
        }
        .sheet(isPresented: $editColors) {
          ColorPicker(contrast: self.$contrast)
        }
        HStack {
          Text("Text \(contrast.text.description)")
            .accessibility(label: Text("For Text color "
            + contrast.text.accDescription))
          Text("Bkgd \(contrast.bkgd.description)")
            .accessibility(label: Text("on Background color "
            + contrast.bkgd.accDescription))
          Text("Ratio " + contrast.ratio())
        }
        .accessibilityElement(children: .ignore)
        .accessibility(sortPriority: 1)
        .accessibility(label: Text("Ratio " + self.contrast.ratio()))
        .accessibility(hint: Text("for Text color \(contrast.text.accDescription),"
          + " on Background color \(self.contrast.bkgd.accDescription)."))
          .font(.caption)
          .padding(2)
        .background(Color(.systemBackground))
          .cornerRadius(5)
      }
      .accessibilityElement(children: .contain)
    }
  }

}

struct ContrastListView_Previews: PreviewProvider {
  static var previews: some View {
    ContrastListView()
  }
}
