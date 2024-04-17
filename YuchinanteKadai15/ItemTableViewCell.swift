//
//  ItemTableViewCell.swift
//  YuchinanteKadai15
//  
//  Created by Yuchinante on 2024/04/16
//  
//

import UIKit

class ItemTableViewCell: UITableViewCell {
    // アイテムが選択されているかを表示する画像ビュー
    @IBOutlet private weak var checkImageView: UIImageView!

    // アイテム名を表示するラベル
    @IBOutlet private weak var nameLabel: UILabel!

    // セルの表示を設定するメソッド
    func configure(name: String, isChecked: Bool) {
        if isChecked {
            checkImageView.image = UIImage(named: "check")  // チェックマークの画像を表示
        } else {
            checkImageView.image = nil  // チェックマークの画像を非表示
        }

        // ラベルにアイテム名を表示
        nameLabel.text = name
    }
}
