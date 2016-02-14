//
//  main.swift
//  IceAndFireLoader
//
//  Created by Yücel Uzun on 14/02/16.
//  Copyright © 2016 Yücel Uzun. All rights reserved.
//

import Foundation

// Some simple examples;

IceAndFire.load(583) { (character: IceAndFireCharacter?, error) in
    if error != nil {
        print (error!)
    }
    if character != nil {
        print (character!.name!)
    }
}

IceAndFire.load(1) { (book: IceAndFireBook?, error) in
    if error != nil {
        print (error!)
    }
    if book != nil {
        print (book!.name)
    }
}

IceAndFire.load(10) { (house: IceAndFireHouse?, error) in
    if error != nil {
        print (error!)
    }
    if house != nil {
        print (house!.name!)
    }
}

// Main normaly ends without waiting closures to run.
sleep(50)