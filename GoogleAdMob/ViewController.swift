//
//  ViewController.swift
//  GoogleAdMob
//
//  Created by Terry Jason on 2023/9/4.
//

import UIKit
import GoogleMobileAds
import AppTrackingTransparency
import AdSupport

class ViewController: UIViewController {
    
    private var interstitial: GADInterstitialAd?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gadRequest()
        
        //real -> ca-app-pub-1270166578952688/4822647573
        //test -> "ca-app-pub-3940256099942544/4411468910"
    }
    
    @IBAction func nextClicked(_ sender: Any) {
        if interstitial != nil {
            interstitial!.present(fromRootViewController: self)
        } else {
            print("Ad wasn't ready")
        }
    }
    
}


// MARK: Ad

extension ViewController: GADFullScreenContentDelegate {
    
    func gadRequest() {
        let request = GADRequest()
        GADInterstitialAd.load(withAdUnitID: "ca-app-pub-3940256099942544/4411468910",
                               request: request,
                               completionHandler: { [self] ad, error in
            if let error = error {
                print("Failed to load interstitial ad with error: \(error.localizedDescription)")
                return
            }
            interstitial = ad
            interstitial?.fullScreenContentDelegate = self
        }
        )
    }
    
    /// Tells the delegate that the ad failed to present full screen content.
    func ad(_ ad: GADFullScreenPresentingAd, didFailToPresentFullScreenContentWithError error: Error) {
        print("Ad did fail to present full screen content.")
    }
    
    /// Tells the delegate that the ad will present full screen content.
    func adWillPresentFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        print("Ad will present full screen content.")
    }
    
    /// Tells the delegate that the ad dismissed full screen content.
    func adDidDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        print("Ad did dismiss full screen content.")
    }
    
}


// MARK: User Track

extension ViewController {
    
   
    func requestIDFA() {
        
    }
    
}

