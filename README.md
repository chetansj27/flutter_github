Flutter package to get details of Github user
## How to Use
To use flutter_github start by importing the package
``` dart
import 'package:flutter_github/flutter_github.dart';
```
## Get Profile Details
``` dart
FlutterGithub _flutterGithub = new FlutterGithub();
await _flutterGithub.getUserData(userName);
```
## Print User Details
```dart 
print("Name: ${_flutterGithub.name}")
print("Bio: ${_flutterGithub.bio}")
print("Image: ${_flutterGithub.image}")
print("Followers: ${_flutterGithub.followers}")
print("Following: ${_flutterGithub.following}")
print("CreatedAt: ${_flutterGithub.createdAt}")
print("UpdatedAt: ${_flutterGithub.updatedAt}")
print("Public Repos: ${_flutterGithub.publicRepos}")
print("Public Gists: ${_flutterGithub.publicGists}")
print("Email: ${_flutterGithub.email}")
print("Company: ${_flutterGithub.company}")
print("Location: ${_flutterGithub.location}")

```
### Example
[See Example](https://pub.dev/packages/flutter_github/example)

![Image1](https://github.com/csj5483/flutter_github/blob/master/ScreenShots/image1.png) 

#### Created By [Chetan](https://github.com/csj5483)
