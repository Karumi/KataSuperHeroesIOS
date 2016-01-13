![Karumi logo][karumilogo] KataSuperHeroes for iOS. [![Build Status](https://travis-ci.org/Karumi/KataSuperHeroesIOS.svg?branch=master)](https://travis-ci.org/Karumi/https://travis-ci.com/Karumi/KataSuperHeroesIOS)
============================

- We are here to practice UI Testing.
- We are going to use [KIF][kif] and [Nimble][nimble] to interact with the Application UI.
- We are going to use manual [Dependency Injection][dependencyInjection] to replace production code with [Test Doubles][testDoubles].
- We are going to practice pair programming.

---

## Tasks

This repository contains an iOS application written in Swift to show Super Heroes information:

![ApplicationScreencast][applicationScreencast]

This Application is based on two ViewControllers:

* ``SuperHeroesViewController`` showing a list of super heroes with name, photo and a special badge if is part of the Avengers Team.

![SuperHeroesViewControllerScreenshot][superHeroesViewControllerScreenshot]

* ``SuperHeroDetailViewController`` showing detailed information for a super hero like the name, photo and description.

![SuperHeroDetailViewControllerScreenshot][superHeroDetailViewControllerScreenshot]


**Your task as iOS Developer is to write all the UI tests needed to check if the application UI is working as should. The application architecture, dependencies and configuration is ready to just start writing tests. In this project you'll find a testable code ready to be able to replace production code with test doubles easily and KIF to be able to interact with the application user interface.**

This repository is ready to build the application, pass the checkstyle and your tests in Travis-CI environments. **Our recommendation for this exercise is to fork this repository, checkout to the brach project-withtout-tests and start testing the application.**

Before to start, execute the application, explore it manually and review the code to design your test scenarios.

## Extra Tasks

If you've covered all the application functionality using UI tests try to continue with the following tasks:

* Add a pull to refresh mechanism to ``SuperHeroesViewController`` and test it.
* Modify ``SuperHeroDetailViewController`` to handle an error case where the name of the super hero used to start this activity does not exist and show a message if this happens.
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
[applicationScreencast]: ./art/ApplicationScreencast.gif
[superHeroesViewControllerScreenshot]: ./art/MainActivityScreenshot.png
[superHeroDetailViewControllerScreenshot]: ./art/SuperHeroDetailActivityScreenshot.png