//
//  Moduls.swift
//  ProTalks
//
//  Created by Anak Agung Gede Agung Davin on 23/07/22.
//

import Foundation

struct Moduls {
    var id: Int?
    var image: String?
    var title: String?
    var desc: String?
    var contents: TextContent?
}

var listModuls: [Moduls] = [Moduls(id: 1,
                                   image: "Image1",
                                   title: "Introduction",
                                   desc: "Learn to open up a presentation with a professional manner",
                                   contents: TextContent(TextPro: ["Good morning, ladies and gentlemen. Good to have you all, in this presentation. Please, let me introduce our team.", "In this presentation, we will announce our greatest product! Enjoy, the presentation"])),
                            Moduls(id: 2,
                                   image: "Image2",
                                   title: "Interview",
                                   desc: "Interview your users and get robust informations",
                                   contents: TextContent(TextPro: ["Hi! My I have your time just for 15 minutes. I do some research and need some informations.", "Masih kosong 2"])
                                           )]

