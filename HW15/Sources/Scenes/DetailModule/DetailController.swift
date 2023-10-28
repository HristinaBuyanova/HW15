//
//  DetailController.swift
//  HW15
//
//  Created by Христина Буянова on 28.10.2023.
//

import UIKit

final class DetailController: UIViewController {

    private var detailView: DetailView?

    override func loadView() {
        detailView = DetailView()
        view = detailView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

     func configureView(model: MVCModel) {
        detailView?.label.text = model.title
        detailView?.imageView.image = UIImage(systemName: model.image) ?? UIImage(named: model.image)
    }
}
