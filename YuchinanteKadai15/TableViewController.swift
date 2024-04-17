//
//  ViewController.swift
//  
//  
//  Created by Yuchinante on 2024/04/16
//  
//

import UIKit

class TableViewController: UITableViewController {

    // UserDefaultsに保存するキー名
    private let KeyName = "Name"
    private let KeyCheck = "Check"

    // テーブルビューに表示するアイテムの配列
    private var items: [[String: Any]] = []

    // 画面がロードされた時の処理
    override func viewDidLoad() {
        super.viewDidLoad()

        // アイテムの初期化
        items = [
            [KeyName: "りんご", KeyCheck: false],
            [KeyName: "みかん", KeyCheck: true],
            [KeyName: "バナナ", KeyCheck: false],
            [KeyName: "パイナップル", KeyCheck: true],
        ]
    }

    // セルの数を返すメソッド
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }

    // セルを構築するメソッド
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルを取得し、カスタムセルにダウンキャスト
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell1", for: indexPath) as! ItemTableViewCell

        // アイテムを取得
        let item = items[indexPath.row]

        //セルの表示を設定するメソッドを呼び出してセルを更新
        cell.configure(name: (item[KeyName] as? String) ?? "", isChecked: (item[KeyCheck] as? Bool) ?? false)

        // 更新されたセルを返す
        return cell
    }

    // ユーザーがテーブルビューのセルを選択した時の処理
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // チェック状態を反転させる
        if let check = items[indexPath.row][KeyCheck] as? Bool {
            items[indexPath.row][KeyCheck] = !check
            // テーブルビューのセルを再読み込みして更新する
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
    }

    // Cancelボタンがタップされた時に呼ばれるメソッド
    @IBAction func didTapCancelButton(segue: UIStoryboardSegue) {
    }

    // AddItemViewControllerからの遷移によるデータの追加処理を行うメソッド
    @IBAction func didTapAddByButton(segue: UIStoryboardSegue) {
        if let add = segue.source as? AddItemViewController {

            // アイテム名とチェック状態を辞書型に格納し、itemsに追加する
            let item: [String: Any] = [KeyName: add.name, KeyCheck: false]
            items.append(item)

            // テーブルビューをリロードして表示を更新する
            tableView.reloadData()
        }
    }
}

