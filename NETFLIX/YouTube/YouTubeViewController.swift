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
    lazy var url = URL(string: youTubeURL)
    lazy var request = URLRequest(url: url!)

    override func viewDidLoad() {
        super.viewDidLoad()
        webview.load(request)
        view.backgroundColor = .white
        view.addSubview(webview)
        webview.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

