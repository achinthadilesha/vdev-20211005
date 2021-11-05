# vdev-20211005
 VeracityDev Interview

(1) git init <br />

(2) git add README.md <br />

(3) git commit -m "Empty project with README" README.md. <br />

(4) git remote add origin  https://github.com/achinthadilesha/vdev-20211005.git <br />
git remote -v <br />

(5) git push -u origin main <br />

(6) To install flutter [vist page](https://flutter.dev/docs/get-started/install). <br />

- select your preffered platform
- read the minimum requirements for your machine
- download the flutter SDK and extract the file in the desired location
- add flutter tool to your path using the command:
  - export PATH="$PATH:`pwd`/flutter/bin"

depeding on the platform updating the path might be different. Please refer the ** for your OS. <br />

- [windows](https://flutter.dev/docs/get-started/install/windows#update-your-path)
- [mac](https://flutter.dev/docs/get-started/install/macos#update-your-path)
- [linux](https://flutter.dev/docs/get-started/install/linux#update-your-path)

- to verify if there is any dependencies to install run command:
  - flutter doctor

for iOS setup (only for mac os)

- install the latest version of xcode from app store
- configure the Xcode command-line tools
  - sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
  - sudo xcodebuild -runFirstLaunch
- make sure the Xcode license agreement is signed using,
  - sudo xcodebuild -license

for android setup

- install the latest version of [android studio](https://developer.android.com/studio)
- setup the android studio with the latest version of android SDK, android SDK Command-line Tools, and android SDK Build-Tools.
- run command
  - flutter doctor
- setup and android emulator by clicking avd manager
- agree to android licenses
  - flutter doctor --android-licenses

setup an editor

- you can use either VS code or android studio for developing flutter projects.
- install dart and flutter pluggins into your IDE

congratulations for installing and setting up flutter in your computer.
