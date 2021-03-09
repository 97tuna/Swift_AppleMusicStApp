//
//  TrackCollectionViewCell.swift
//  AppleMusicStApp
//
//  Created by LDH on 2020/01/12.
//  Copyright © 2020 com.LDH. All rights reserved.
//

import UIKit

class TrackCollecionViewCell: UICollectionViewCell {
    @IBOutlet weak var trackThumbnail: UIImageView!
    @IBOutlet weak var trackTitle: UILabel!
    @IBOutlet weak var trackArtist: UILabel!
    
    override func awakeFromNib() { // 스토리 보드에서 넣어놓은 셀들을 실제로 앱에서 호출할때 스토리 보드의 앱에 올라올때 호출할때 사용
        super.awakeFromNib()
        trackThumbnail.layer.cornerRadius = 4
        trackArtist.textColor = UIColor.systemGray2
    }
    
    func updateUI(item: Track?) {
        // TODO: 곡정보 표시하기
        guard let track = item else { return }
        trackThumbnail.image = track.artwork
        trackTitle.text = track.title
        trackArtist.text = track.artist
    }
}
