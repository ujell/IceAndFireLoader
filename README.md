# IceAndFireLoader

## About

A simple Swift wrapper for [An API of Ice and Fire](https://anapioficeandfire.com/). 
You can get more information on [Reddit](https://www.reddit.com/r/asoiaf/comments/45lt0o/spoilers_everything_introducing_an_api_of_ice_and/) or directly check source code on [Github](https://github.com/joakimskoog/AnApiOfIceAndFire).

## Installation

You can install `IceAndFireLoader` easily via CocoaPods, just add following line to your `PodFile`;

`pod 'IceAndFireLoader'`

Alternatively you can directly add `IceAndFire.swift` file to your project.

## Usage
3 structs for representing different resource types in the An API of Ice and Fire are defined;
* `IceAndFireCharacter`
* `IceAndFireBook`
* `IceAndFireHouse`

For meaning of fields in these structs please check [An API of Ice and Fire Documentation](https://anapioficeandfire.com/Documentation)

`IceAndFire` class handles communication with the API, parses response and calls competition handler. Check [main.swift](https://raw.githubusercontent.com/ujell/IceAndFireLoader/master/IceAndFireLoader/main.swift) for usage examples.

## TODO
* Loading all resources in a category with pagination
* API versioning support
* Caching
* XCtest
* Checking Linux compatibility. 
