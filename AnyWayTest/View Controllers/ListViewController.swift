//
//  ListViewController.swift
//  AnyWayTest
//
//  Created by Mert Serin on 24.04.2019.
//  Copyright © 2019 Mert Serin. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {

    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    
    private var cellIdentifier = "ListCell"
    private var selectedList:[Decodable] = []{
        didSet{
            collectionView.reloadData()
        }
    }
    private var mapController = MapController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        onSegmentContolChanged(segmentControl)
    }
    
    @IBAction func onSegmentContolChanged(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0{
            selectedList = mapController.getParkingSpots() ?? []
        }else{
            selectedList = mapController.getElectricRefuelingSpots() ?? []
        }
    }

}

extension ListViewController:UICollectionViewDelegate, UICollectionViewDataSource{
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! ListCell
        cell.listModel = selectedList[indexPath.row]
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return selectedList.count
    }
    
}
