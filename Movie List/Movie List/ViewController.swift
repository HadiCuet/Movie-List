//
//  ViewController.swift
//  Movie List
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        ClientService().searchMovie(query: nil) { _ in
            Log.info("Message")
        }
    }


}

