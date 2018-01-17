//
//  VidMeDB+CoreDataClass.swift
//  VidMe
//
//  Created by LIV on 18.08.17.
//  Copyright © 2017 LIV. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData

//@objc(VidMeDB)
public class VidMe: NSManagedObject {

    @NSManaged public var name: String?
    @NSManaged public var videoUrl: String?
    @NSManaged public var thumbnailUrl: String?
}
