//
//  ViewController.swift
//  ImageFilter
//
//  Created by Nick Sagan on 26.10.2021.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func chooseButtonPressed(_ sender: UIBarButtonItem) {
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.sourceType = .photoLibrary
            navigationController?.present(picker, animated: true, completion: nil)
        }
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        navigationController?.dismiss(animated: true, completion: nil)
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.image = image
            selectedImage = image
        }
    }
    
    var selectedImage: UIImage?
    
    @IBAction func filterButtonPressed(_ sender: UIButton) {
        if let image = selectedImage {
            let filter = CIFilter(name: "CISepiaTone")
            let context = CIContext()
            filter?.setValue(0.7, forKey: kCIInputIntensityKey)
            filter?.setValue(CIImage(image: image), forKey: kCIInputImageKey)
            if let output = filter?.outputImage {
                imageView.image = UIImage(cgImage: context.createCGImage(output, from: output.extent)!)
            } else {
                print("No output")
            }
        } else {
            print("No selectedImage")
        }
    }
    
    @IBAction func noir(_ sender: UIButton) {
        if let image = selectedImage {
            let filter = CIFilter(name: "CIPhotoEffectNoir")
            let context = CIContext()
            filter?.setValue(CIImage(image: image), forKey: kCIInputImageKey)
            if let output = filter?.outputImage {
                imageView.image = UIImage(cgImage: context.createCGImage(output, from: output.extent)!)
            } else {
                print("No output")
            }
        } else {
            print("No selectedImage")
        }
    }
    @IBAction func vintage(_ sender: UIButton) {
        if let image = selectedImage {
            let filter = CIFilter(name: "CIPhotoEffectProcess")
            let context = CIContext()
            filter?.setValue(CIImage(image: image), forKey: kCIInputImageKey)
            if let output = filter?.outputImage {
                imageView.image = UIImage(cgImage: context.createCGImage(output, from: output.extent)!)
            } else {
                print("No output")
            }
        } else {
            print("No selectedImage")
        }
    }
    
}

