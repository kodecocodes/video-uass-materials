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

struct ColorModel {
  var r: Double
  var g: Double
  var b: Double

  var rInt: String { String(Int(0.5 + r * 255.0)) }
  var gInt: String { String(Int(0.5 + g * 255.0)) }
  var bInt: String { String(Int(0.5 + b * 255.0)) }

  var colorView: Color {
    Color(red: r, green: g, blue: b)
  }

  var accDescription: String {
    "Red \(rInt), Green \(gInt), Blue \(bInt)."
  }

  var description: String {
    "R\(rInt) G\(gInt) B\(bInt)"
  }
}

struct ContrastModel {
  var bkgd: ColorModel
  var text: ColorModel

  func ratio() -> String {
    let rgbText = RGB(r: text.r, g: text.g, b: text.b)
    let rgbBkgd = RGB(r: bkgd.r, g: bkgd.g, b: bkgd.b)
    return String(format: "%.2f", contrastRatio(rgb1: rgbText, rgb2: rgbBkgd))
  }

  private func contrastRatio(rgb1: RGB, rgb2: RGB) -> Double {
    let ratio = (rgb1.luminance + 0.05) / (rgb2.luminance + 0.05)
    return ratio < 1.0 ? 1.0/ratio : ratio
  }
}
