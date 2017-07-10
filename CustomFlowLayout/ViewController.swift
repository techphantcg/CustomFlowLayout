//
//  ViewController.swift
//  CustomFlowLayout
//
//  Created by TPCG II on 10/07/17.
//  Copyright © 2017 TPCG II. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    fileprivate var galleryImage: [String] = ["image-1","image-2","image-3","image-4","image-5","image-6","image-7","image-8","image-9","image-10","image-11","image-12"]
    
    fileprivate var listFlowLayout = GalleryListFlowLayout()
    fileprivate var gridFlowLayout = GalleryGridFlowLayout()
    
    @IBOutlet weak var segmentPager: UISegmentedControl!
    fileprivate var isGridFlowLayoutActive = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource  = self
        setupInitalLayout()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func willRotate(to toInterfaceOrientation: UIInterfaceOrientation, duration: TimeInterval) {
        collectionView.collectionViewLayout.invalidateLayout()
    }
    
    func setupInitalLayout(){
        self.isGridFlowLayoutActive = true
        self.collectionView.collectionViewLayout = self.gridFlowLayout
        //self.collectionView.setCollectionViewLayout(self, animated: true)
    }
    
    

    @IBAction func segmentButtonAction(_ sender: Any) {
        
        if segmentPager.selectedSegmentIndex == 0 {
            
            UIView.animate(withDuration: 0.5, animations: {
                
                self.collectionView.collectionViewLayout.invalidateLayout()
                self.collectionView.setCollectionViewLayout(self.gridFlowLayout, animated: true)
            })
        
        }else if segmentPager.selectedSegmentIndex == 1 {
        
            UIView.animate(withDuration: 0.5, animations: {
                
                self.collectionView.collectionViewLayout.invalidateLayout()
                self.collectionView.setCollectionViewLayout(self.listFlowLayout, animated: true)
            })
        }
        
    }
    

}

extension ViewController : UICollectionViewDataSource {

    
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.galleryImage.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! GalleryCell
        
        cell.imageView.image = UIImage(named: self.galleryImage[indexPath.row])
        
        return cell
    }
}

