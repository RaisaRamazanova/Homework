//
//  ViewController.swift
//  Demotivator
//
//  Created by Рамазанова Раисат on 04.08.2021.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    
    // MARK:- properties

    let imageView  = UIImageView()
    let cameraImageView  = UIImageView()
    var addPhotoButton = UIButton()
    let screenSize = UIScreen.main.bounds
    
    // MARK:- override methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let image = UIImage(named: "g70aw")
        imageView.frame = CGRect(x: 0, y: 100, width: screenSize.width, height: screenSize.width + 100)
        imageView.image = image

        cameraImageView.frame = CGRect(x: 40, y: 120, width: screenSize.width - 73, height: screenSize.width - 23)
        
        addPhotoButton.frame = CGRect(x: 40, y: 650, width: 300, height: 80)
        addPhotoButton.backgroundColor = .systemBlue
        addPhotoButton.setTitle("Работаем", for: .normal)
        addPhotoButton.setTitleColor(.white, for: .normal)
        addPhotoButton.addTarget(self, action: #selector(openTapped), for: .touchUpInside)
        
        view.addSubview(addPhotoButton)
        view.addSubview(imageView)
        view.addSubview(cameraImageView)
        
    }
    // MARK:- methods
    
    func mergeImages(bottomImage: UIImageView, topImage: UIImageView) -> UIImage {
        let size = CGSize(width: screenSize.width, height: screenSize.width + 170)
        UIGraphicsBeginImageContext(size)

        let areaSize = CGRect(x: 0, y: 100, width: screenSize.width, height: screenSize.width + 100)
        bottomImage.image!.draw(in: areaSize)
        
        if let image = topImage.image {
            image.draw(in: CGRect(x: 40, y: 120, width: screenSize.width - 73, height: screenSize.width - 23), blendMode: .normal, alpha: 1)
        }

        let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return newImage
    }
    
    func useCamera(action: UIAlertAction) {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }

    func useGalery(action: UIAlertAction) {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }
    
    func savePhoto(action: UIAlertAction) {
        let newImage = mergeImages(bottomImage: imageView, topImage: cameraImageView)
        let imageData = newImage.pngData()
        if let data = imageData {
            let compresedImage = UIImage(data: data)
            UIImageWriteToSavedPhotosAlbum(compresedImage!, nil, nil, nil)
        }
        let alert = UIAlertController(title: "Сохранили", message: "Вашу картинку сохранили", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func chooseFilter(action: UIAlertAction) {
        if let image = cameraImageView.image {
            let photoWithFilter = image.addFilter(filter: FilterType(rawValue: FilterType.randomFilter()) ?? .Chrome)
            cameraImageView.image = photoWithFilter
        }
    }
    
    @objc func openTapped() {
        let ac = UIAlertController(title: "Open page…", message: nil, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Camera", style: .default, handler: useCamera))
        ac.addAction(UIAlertAction(title: "Galery", style: .default, handler: useGalery))
        ac.addAction(UIAlertAction(title: "Filter", style: .default, handler: chooseFilter))
        ac.addAction(UIAlertAction(title: "Save", style: .default, handler: savePhoto))
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        ac.popoverPresentationController?.barButtonItem = self.navigationItem.rightBarButtonItem
        present(ac, animated: true)
    }
}

// MARK:- extension

extension ViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate  {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {
            return
        }
        cameraImageView.image = image
    }
}

extension UIImage {
    func addFilter(filter : FilterType) -> UIImage {
        let filter = CIFilter(name: filter.rawValue)
        let ciInput = CIImage(image: self)
        filter?.setValue(ciInput, forKey: "inputImage")
        let ciOutput = (filter?.outputImage)!
        let ciContext = CIContext()
        let cgImage = ciContext.createCGImage(ciOutput, from: ciOutput.extent)
        return UIImage(cgImage: cgImage!)
    }
}
