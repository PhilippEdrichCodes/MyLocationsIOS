//
//  WebRessourcesViewController.swift
//  MyLocationsIOS
//
//  Created by Philipp Edrich on 05.12.22.
//

import UIKit
import WebKit

class WebRessourcesViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var forwardButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.navigationDelegate = self
        searchBar.delegate = self
        
        webView.allowsBackForwardNavigationGestures = true
        
        loadSite(site: "https://en.wikipedia.org/wiki/RTFM")

    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        webView.goBack()
    }
    
    @IBAction func forwardButtonPressed(_ sender: UIButton) {
        webView.goForward()
    }
    
    func loadSite(site urlToLoad: String) {
        let url = URL(string: urlToLoad)!
        let request = URLRequest(url: url)
        webView.load(request)
        searchBar.text = url.absoluteString
    }
    

}

// MARK: - WKNavigationDelegate

extension WebRessourcesViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        searchBar.text = webView.url!.absoluteString
    }
}

// MARK: - UISearchBarDelegate

extension WebRessourcesViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let searchText = searchBar.text ?? "https://en.wikipedia.org/wiki/RTFM"
        searchBar.resignFirstResponder()
        loadSite(site: searchText)
    }
}
