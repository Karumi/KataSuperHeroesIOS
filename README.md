![Karumi logo][karumilogo] KataSuperHeroes for iOS. [![Build Status](https://travis-ci.org/Karumi/KataSuperHeroesIOS.svg?branch=master)](https://travis-ci.org/Karumi/KataSuperHeroesIOS)
============================

- We are here to practice UI Testing.
- We are going to use [KIF][kif] and [Nimble][nimble] to interact with the Application UI.
- We are going to use manual [Dependency Injection][dependencyInjection] to replace production code with [Test Doubles][testDoubles].
- We are going to practice pair programming.

---

## Getting started

This repository contains an iOS application written in Swift to show Super Heroes information:

![ApplicationScreencast][applicationScreencast]

This Application is based on two ViewControllers:

* ``SuperHeroesViewController`` showing a list of super heroes with name, photo and a special badge if is part of the Avengers Team.

![SuperHeroesViewControllerScreenshot][superHeroesViewControllerScreenshot]

* ``SuperHeroDetailViewController`` showing detailed information for a super hero like the name, photo and description.

![SuperHeroDetailViewControllerScreenshot][superHeroDetailViewControllerScreenshot]


The application architecture, dependencies and configuration is ready to just start writing tests. In this project you'll find all the classes ready to be able to replace production code with test doubles easily and KIF to be able to interact with the application user interface. The accessibility labels needed to interact with the UI using KIF are already configured.

## Tasks

Your task as iOS Developer is to **write all the UI tests** needed to check if the Application UI is working as it should. 

**This repository is ready to build the application, pass the checkstyle and your tests in Travis-CI environments.**

Our recommendation for this exercise is:

  * Before starting
    1. Fork this repository.
    2. Checkout `kata-super-heroes` branch.
    3. Execute the application, explore it manually and make yourself familiar with the code.
    4. Execute `SuperHeroesViewControllerTests` and watch the only test it contains pass.

  * To help you get started, these are some test cases for `SuperHeroesViewControllerTests`:     
    1. Setup mocked `SuperHeroesRepository` in `SuperHeroesViewControllerTests` to return a list of some Super Heroes.
    2. Test that TableView is listing the correct number of elements when `SuperHeroesRepository` returns a list of some Super Heroes.
    3. Test that each of this elements contains the correct Super Hero name.

## Considerations

* If you get stuck, `master` branch contains already solved tests for `SuperHeroesViewControllerTests` and `SuperHeroViewControllerTests`

## Extra Tasks

If you've covered all the application functionality using UI tests try to continue with the following tasks:

* Add a pull to refresh mechanism to ``SuperHeroesViewController`` and test it.
* Modify ``SuperHeroDetailViewController`` to handle an error case where the name of the super hero used to start this ViewController does not exist and show a message if this happens.
* Modify the project to handle connection errors and show a message to indicate something went wrong.

---

## Documentation

There are some links which can be useful to finish these tasks:

* [KIF Framewkork Documentation][kif]
* [Nimble Documentation][nimble]

Data provided by Marvel. © 2016 MARVEL

#License

Copyright 2016 Karumi

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

[karumilogo]: https://cloud.githubusercontent.com/assets/858090/11626547/e5a1dc66-9ce3-11e5-908d-537e07e82090.png
[kif]: https://github.com/kif-framework/KIF
[nimble]: https://github.com/Quick/Nimble
[dependencyInjection]: http://www.martinfowler.com/articles/injection.html
[testDoubles]: http://www.martinfowler.com/bliki/TestDouble.html
[applicationScreencast]: ./art/applicationScreencast.gif
[superHeroesViewControllerScreenshot]: ./art/superHeroesViewControllerScreenshot.png
[superHeroDetailViewControllerScreenshot]: ./art/superHeroDetailViewControllerScreenshot.png
