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
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import SwiftUI

struct ColorPicker: View {
  @Binding var contrast: ContrastModel

  var body: some View {
    VStack {
      ZStack {
        contrast.bkgd.colorView
        Text(verbatim: contrast.ratio())
          .accessibility(label: Text("Contrast ratio: " + contrast.ratio() + "."))
          .font(.largeTitle)
          .foregroundColor(contrast.text.colorView)
      }
      .accessibility(addTraits: .isHeader)
      HStack {
        VStack {
          Text("Text")
            .accessibility(addTraits: .isHeader)
            .padding(.bottom)
          SliderBlock(colorString: "Red", colorInt: contrast.text.rInt,
            colorValue: $contrast.text.r, bkgdOrText: "Text", contrast: $contrast)
          SliderBlock(colorString: "Green", colorInt: contrast.text.gInt,
            colorValue: $contrast.text.g, bkgdOrText: "Text", contrast: $contrast)
          SliderBlock(colorString: "Blue", colorInt: contrast.text.bInt,
            colorValue: $contrast.text.b, bkgdOrText: "Text", contrast: $contrast)
        }
        .padding()
        VStack {
          Text("Background")
            .accessibility(addTraits: .isHeader)
            .padding(.bottom)
          SliderBlock(colorString: "Red", colorInt: contrast.bkgd.rInt,
            colorValue: $contrast.bkgd.r, bkgdOrText: "Background", contrast: $contrast)
          SliderBlock(colorString: "Green", colorInt: contrast.bkgd.gInt,
            colorValue: $contrast.bkgd.g, bkgdOrText: "Background", contrast: $contrast)
          SliderBlock(colorString: "Blue", colorInt: contrast.bkgd.bInt,
            colorValue: $contrast.bkgd.b, bkgdOrText: "Background", contrast: $contrast)
        }
        .padding()
      }
      .padding()
    }
  }
}

struct ColorPicker_Previews: PreviewProvider {
  static var previews: some View {
    ColorPicker(contrast: .constant(ContrastViewModel(
      count: 1).contrasts[0]))
  }
}

struct SliderBlock: View {
  let colorString: String
  var colorInt: String
  @Binding var colorValue: Double
  let bkgdOrText: String
  @Binding var contrast: ContrastModel

  var body: some View {
    VStack {
      Text(colorString + ": " + colorInt)
        .accessibility(hidden: true)
        .font(.caption)
      Slider(value: $colorValue,
        label: { Text(bkgdOrText + " " + colorString) })
        .accessibility(label: Text(bkgdOrText + " " + colorString))
        .accessibility(value: Text(colorInt + ". Ratio " + contrast.ratio()))
    }
  }
}
