//
//  FeedController.swift
//  Twitter-clone
//
//  Created by MANSUB SHIN on 2024/11/26.
//

import UIKit

class FeedController: UIViewController {
    // MARK: - Properties

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }

    // MARK: - Helpers

    func configureUI() {
        view.backgroundColor = .white

        guard let logo = UIImage(named: "twitter_logo_blue") else { fatalError("Not found image.") }
        let imageView = UIImageView(image: logo)
        imageView.contentMode = .scaleAspectFit
        navigationItem.titleView = imageView
    }
}
