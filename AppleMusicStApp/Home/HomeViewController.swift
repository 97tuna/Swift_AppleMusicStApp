//
//  HomeViewController.swift
//  AppleMusicStApp
//
//  Created by LDH on 2020/01/11.
//  Copyright © 2020 com.LDH. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    // TODO: 트랙관리 객체 추가
    let trackManager: TrackManager = TrackManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension HomeViewController: UICollectionViewDataSource {
    // 몇개 표시 할까?
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // TODO: 트랙매니저에서 트랙갯수 가져오기
        return trackManager.tracks.count
    }
    
    // 셀 어떻게 표시 할까?
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // TODO: 셀 구성하기
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TrackCollecionViewCell", for: indexPath) as? TrackCollecionViewCell else {
            return UICollectionViewCell()
        }
        
        let track = trackManager.track(at: indexPath.item)
        cell.updateUI(item: track)
        return cell
    }
    
    // 헤더뷰 어떻게 표시할까?
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            // TODO: 헤더 구성하기
            guard let item = trackManager.todaysTrack else {
                return UICollectionReusableView()
            }
            
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "TrackCollectionHeaderView", for: indexPath) as? TrackCollectionHeaderView else {
                return UICollectionReusableView()
            }
            
            header.update(with: item)
            header.tapHandler = { item -> Void in
                // 탭이 되었을때 플레이어를 띄워주기
                let playerStoryboard = UIStoryboard.init(name: "Player", bundle: nil) // 스토리 보드 읽어오기
                guard let playerVC = playerStoryboard.instantiateViewController(identifier: "PlayerViewController") as? PlayerViewController else { return } // 특정 인스턴스 제작
                
                playerVC.simplePlayer.replaceCurrentItem(with: item)
                
                self.present(playerVC, animated: true, completion: nil)
            }
            
            return header
        default:
            return UICollectionReusableView()
        }
    }
}

extension HomeViewController: UICollectionViewDelegate {
    // 클릭했을때 어떻게 할까?
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // TODO: 곡 클릭시 플레이어뷰 띄우기
        let playerStoryboard = UIStoryboard.init(name: "Player", bundle: nil) // 스토리 보드 읽어오기
        guard let playerVC = playerStoryboard.instantiateViewController(identifier: "PlayerViewController") as? PlayerViewController else { return } // 특정 인스턴스 제작
        
        let item = trackManager.tracks[indexPath.item] // 곡 정보 넘겨주기
        playerVC.simplePlayer.replaceCurrentItem(with: item)
        
        present(playerVC, animated: true, completion: nil)
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    // 셀 사이즈 어떻게 할까?
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // 20 - card(width) - 20 - card(width) - 20
        // TODO: 셀사이즈 구하기
        let itemSpacing: CGFloat = 20 // 아이템간의 거리
        let margin: CGFloat = 20 // 왼쪽, 오른쪽 마진
        let width = (collectionView.bounds.width - itemSpacing - margin * 2) / 2
        let height = width + 60
        return CGSize(width: width, height: height)
    }
}
