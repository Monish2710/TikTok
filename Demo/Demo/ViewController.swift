//
//  ViewController.swift
//  Demo
//
//  Created by Pyramidions on 09/04/21.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource {
    
    @IBOutlet var mainCollectionView: UICollectionView!
    
    let imageArray = [#imageLiteral(resourceName: "ImageOne"),#imageLiteral(resourceName: "ImageTwo"),#imageLiteral(resourceName: "ImageOne"),#imageLiteral(resourceName: "ImageFour"),#imageLiteral(resourceName: "ImageFive"),#imageLiteral(resourceName: "ImageTwo")]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        if #available(iOS 11, *) { self.mainCollectionView.contentInsetAdjustmentBehavior = .never; }
        else{ self.automaticallyAdjustsScrollViewInsets = false }
        setUpCollectionView()
    }
    
    private func setUpCollectionView()
    {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        mainCollectionView?.setCollectionViewLayout(layout, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat
    {
            return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat
    {
            return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
       return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
            let cell = mainCollectionView.dequeueReusableCell(withReuseIdentifier: MainCollectionViewCell.identifier, for: indexPath) as! MainCollectionViewCell
        if imageArray.endIndex <= indexPath.item{
            return cell
        }
            cell.mainImageView.image = imageArray[indexPath.item]
            return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: (collectionView.frame.size.width), height: (collectionView.frame.size.height))
    }
}

class MainCollectionViewCell: UICollectionViewCell {
    @IBOutlet var mainImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    class var identifier: String {
        return String(describing: self)
    }
    
    class var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}
