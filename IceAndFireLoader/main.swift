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
    guard error == nil else {
        print (error!)
        return
    }
    if character != nil {
        print (character!.name!)
    }
}

IceAndFire.load(1) { (book: IceAndFireBook?, error) in
    guard error == nil else {
        print (error!)
        return
    }
    if book != nil {
        print (book!.name)
    }
}

IceAndFire.load(10) { (house: IceAndFireHouse?, error) in
    guard error == nil else {
        print (error!)
        return
    }
    if house != nil {
        print (house!.name!)
    }
}

// Bulk loading:
IceAndFire.load(5, pageSize: 10) { (characters:[IceAndFireCharacter]?, error) in
    guard error == nil else {
        print (error!)
        return
    }
    if characters != nil {
        for character in characters! where character.name != nil {
            print (character.name)
        }
    }
}


// Main normaly ends without waiting closures to run.
sleep(50)