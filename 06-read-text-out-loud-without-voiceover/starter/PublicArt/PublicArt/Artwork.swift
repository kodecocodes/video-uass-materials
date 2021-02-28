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

import MapKit
import SwiftUI

struct Artwork {
  let id = UUID()
  let artist: String
  let description: String
  let title: String
  let imageName: String
}

extension Artwork: Identifiable { }

// Subset of Honolulu Public Art data set at
// https://data.honolulu.gov/dataset/Public-Art/yef5-h88r
// Note: The current imagefile server is different from what's listed.
// Current URLs are in image-urls.txt in the starter folder.

let artData = [
  Artwork(artist: "Sean Browne", description: "Bronze figure of Prince Jonah Kuhio Kalanianaole", title: "Prince Jonah Kuhio Kalanianaole", imageName: "002_200105"),
  Artwork(artist: "Robert Lee Eskridge", description: "One of a pair of murals at Ala Moana Regional Park. A Works Progress Administration art project, done in the Art Deco style. It depicts various aspects of makahiki (harvest festival), imagined as taking place in the vicinity of what is now known as Ala Moana Park, makahiki pa'ani ho'oikaika (annual sports tournaments) are emphasized. This mural depicts ali'i with their retainers traveling between villages by wa'a kaulua (double hulled canoe), a carving of Lono and kahili (feather standards) accompany them. Puowaina (Punchbowl) is shown in the background. Also depicted is he'e nalu (surfing) on olo (long surfboard) and 'o'o ihe (sport of spear throwing) whereby a group of men, at a given signal, hurl their spears at one man who would either catch the spears, dodge them, or otherwise fend them off.", title: "Makahiki Festival Mauka Mural", imageName: "19300102"),
  Artwork(artist: "Kate Kelly", description: "A cast bronze commemorative plaque set into a monolith. The plaque memorializes Amelia Earhart's first flight to Hawaii in 1935.", title: "Amelia Earhart Memorial Plaque", imageName: "193701"),
  Artwork(artist: "Marguerite Louis Blasingame", description: "The stone bas relief entry way to the 1939 Board of Water Supply building. The bas relief is executed on a series of green steatite stone blocks which depict mythical and human Hawaiian figures, flora, and animals in the upper portions flanking either side of a central doorway as well as stylized letter forming a narrative text beneath the figurative panels. The two panels, one on the Diamond Head side of the entry way and the other on the other side of the entry door both depict stories involving the god Kane and Kaneloa in a mythical story about the discovery and use of water.", title: "Ka Wai Ake Akua", imageName: "193901-5"),
  Artwork(artist: "Juliette May Fraser", description: "A mural depicting various agricultural activities occurring in Hawaii over several time periods, from pre-contact to the 20th century.", title: "Pure Water: Man's Greatest Need", imageName: "195801"),
  Artwork(artist: "Charles Watson", description: "A stylized sculpture of a giraffe with the body made of welded rebar rings. The body is articulated by using weld material to give the spotty look of the animal. The head is approximately 12\" long and it peers down, its mouth open, and with long eyelashes. There are ears and horns on its head and there are iron rods of about 4-6\" in length that are used to articulate the hairs on the back of the giraffe's neck.", title: "Giraffe", imageName: "198912"),
  Artwork(artist: "Yoshinari Kochi", description: "A roughly carved \"C\" form which represents \"century,\" supported by a pillar with four Chinese characters on the sides which signify that \"blessings from heaven are invoked by peace and harmony.\" The sculpture commemorates the 75th anniversary of the first Japanese immigrants to arrive in Hawaii.", title: "Hiroshima Monument", imageName: "196001"),
  Artwork(artist: "Unknown", description: "Bronze plaque mounted on a stone with an inscription marking the site of an artesian well.", title: "Pioneer Artesian Well Site", imageName: "193301-2"),
  Artwork(artist: "Unknown", description: "Bronze \"Roll of Honor\" plaque listing 101 Hawaii citizens killed in World War I.", title: "Roll of Honor", imageName: "193101"),
  Artwork(artist: "Unknown", description: "Bronze plaque honoring Don Francisco de Paula Marin.", title: "Francisco De Paula Marin Residence", imageName: "199909"),
  Artwork(artist: "Sean Browne", description: "Larger than life-size bronze figure of King David Kalakaua mounted on a granite pedestal.", title: "King David Kalakaua", imageName: "199103-3"),
  Artwork(artist: "I-Fan Chen", description: "Standing bronze figure of Dr. Sun Yat Sen installed on a pedestal.", title: "Sun Yat Sen", imageName: "197613-5"),
  Artwork(artist: "Emiko Mizutani", description: "Mural of white glazed and semi-glazed ceramic tiles mounted on wood panels.", title: "Trees", imageName: "199802"),
  Artwork(artist: "Don Dugal", description: "A painted wall relief consisting of over 200 small painted panels affixed to a wall depicting a view of the ocean and horizon beyond tree trunks and branches done in subtle gray and blue tones.", title: "November Light", imageName: "198803"),
  Artwork(artist: "Elizabeth Mapelli", description: "A mosaic depicting tropical foliage against a starry sky.", title: "Aloha Grotto", imageName: "199303-2"),
  Artwork(artist: "Marguerite Louis Blasingame", description: "One of a pair of low-relief marble tablets of a Hawaiian couple set into a wall.", title: "Hawaiian Couple", imageName: "19350202a"),
  Artwork(artist: "Paul Saviskas", description: "A stainless steel sculpture of three kihi kihi (Moorish idol fish) swimming around coral mounted on a concrete base.", title: "Kihi Kihi", imageName: "200304")
]
