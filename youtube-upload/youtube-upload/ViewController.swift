//
//  ViewController.swift
//  youtube-upload
//
//  Created by Aviral Aggarwal on 10/09/18.
//  Copyright © 2018 Aviral Aggarwal. All rights reserved.
//

import UIKit
import GoogleSignIn

class ViewController: UIViewController {

   @IBOutlet var googleSignInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
        // Do any additional setup after loading the view, typically from a nib.
        
        GIDSignIn.sharedInstance().serverClientID = "346717667443-rcmrsqd77bl3b1opdf0tgp11m7cem9no.apps.googleusercontent.com"
        GIDSignIn.sharedInstance().signIn()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController : GIDSignInUIDelegate {
    
    func sign(inWillDispatch signIn: GIDSignIn!, error: Error!) {
        //    myActivityIndicator.stopAnimating()
    }
    
    // Present a view that prompts the user to sign in with Google
    func sign(_ signIn: GIDSignIn!,
              present viewController: UIViewController!) {
        self.present(viewController, animated: true, completion: nil)
    }
    
    // Dismiss the "Sign in with Google" view
    func sign(_ signIn: GIDSignIn!,
              dismiss viewController: UIViewController!) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension ViewController : GIDSignInDelegate {
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if (error == nil) {
            // Perform any operations on signed in user here.
                  let userId = user.userID                  // For client-side use only!
                  let idToken = user.serverAuthCode // Safe to send to the server
                  let fullName = user.profile.name
                  let givenName = user.profile.givenName
                  let familyName = user.profile.familyName
                  let email = user.profile.email
                  print(userId)
                  print(fullName)
                  print(idToken)
            print(user.serverAuthCode)
            
            // ...
        } else {
            print("\(error.localizedDescription)")
        }
}
    
    func sign(signIn: GIDSignIn!, didDisconnectWithUser user:GIDGoogleUser!,
              withError error: NSError!) {
        // Perform any operations when the user disconnects from app here.
        // ...
    }
}
