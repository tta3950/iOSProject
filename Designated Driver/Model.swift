//
//  Model.swift
//  Designated Driver
//
//  Created by Alexander,Terry T on 3/14/18.
//  Copyright © 2018 Team M6. All rights reserved.
//

import Foundation
import CoreLocation
/**
 Current use of the UserModel Class should be for User Authentication,
 User Interactions with the app, and provide an interface for connecting
 to a database.
 */
class UserModel {
    static let instance = UserModel()
    //private var user:User
    
    private init() {}
    
    
}

/**
 This class is the basic user class. It holds the generic info about a user.
 This includes their name, when they joined, and what timeZone they are in currently.
 */
class User {
    private var _firstName:String
    private var _lastName:String
    private var _dateJoined:String
    private var _timeZone:TimeZone
    
    public var firstName:String { get { return _firstName}}
    public var lastName:String { get { return _lastName}}
    public var dateJoined:String { get { return _dateJoined}}
    public var timeZone:TimeZone { get { return _timeZone}}
    
    init(){
        _firstName = ""
        _lastName = ""
        _dateJoined = ""
        _timeZone = TimeZone.current
    }
    init(firstName first:String, lastName last:String){
        _firstName = first
        _lastName = last
        let dateFormatter = DateFormatter()
        _dateJoined = dateFormatter.string(from:Date())
        _timeZone = TimeZone.current
    }
    
    init(firstName first:String, lastName last:String, dateJoined date:String) {
        _firstName = first
        _lastName = last
        _dateJoined = date
        _timeZone = TimeZone.current
    }
}

//may merge this with just user
//class Driver:User {
//    private var _canDrive:Bool
//    private var _seatsAvailable:Int
//    private var _currentStatus:currentStatus
//    private var _currentLocation:CLLocation
//}

/**
 Enumeration meanings
 waiting: waiting for a fare
 routing: en transit to destination
 gatheringInformation: getting information from fare for delivery
 abstaining: driver isn't currently accepting fares
 */
enum currentStatus {
    case waiting, routing, gatheringInformation, abstaining
}
