//
//  YouTubeViewController.swift
//  NETFLIX
//
//  Created by NERO on 7/1/24.
//

import UIKit
import WebKit
import SnapKit

final class YouTubeViewController: UIViewController {
    var youTubeURL: String = ""
    
    private let webview = WKWebView()
    private lazy var url = URL(string: youTubeURL)
    private lazy var request = URLRequest(url: url!)

    override func viewDidLoad() {
        super.viewDidLoad()
        webview.load(request)
        view.backgroundColor = .netflix
        view.addSubview(webview)
        webview.snp.makeConstraints {
            $0.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalTo(view)
        }
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
}
