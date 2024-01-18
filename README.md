# Weather App -
Сurrent weather and forecast for each city using opneweather.  

## Getting Started
### Environment Dependencies
- Xcode 14.3+
- iOS 16+
- SwiftUI
- Swift Package Manager(SPM) Dependencies
- Bundler Dependencies
	- [Arkana](https://github.com/rogerluan/arkana): Manage app secrets
### Project Setup
1. Clone the repository.
2. Press `Shift`+`Command`+`"."`(Period) to show hidden files in the root directory.
<br><br>

## Arkana
[Arkana](https://github.com/rogerluan/arkana) is used to handle/manage/store project keys secretely.
Arkana requires the declaration of a YAML config file, named e.g. `.arkana.yml` that lists the keys (names) and an `.env` (e.g. `.env.arkana`) file that stores the values for the keys stored in the YAML file. Since the `.env.arkana` file contains the actual values of the secrets, it should be stored locally and never be checked-in to the repository (It has already been added to `.gitignore`).

To generate the secrets file (or `ArkanaKeys` framework) following the steps mentioned above, under `Project Setup`.

If you're adding a new secret, add appropriate keys to both `.env.arkana_ci` and `.env.arkana` files. Add a corresponding secret on Github Actions secrets and update the workflow files (e.g. `.github/workflows/deploy-alpha_snapshot.yml`) to pass the secret as environment variables for the CI to work. Also add the secrets to the 1Password vault(`Eater iOS App`) so that it's available for other team members to access.
<br><br>

## Project Structure
The repository contains an Xcode workspace constituting the below:
* **Packages**
	- **ArkanaKeys**: This package defines encoded values of the secrets/keys which are added in the corresponding environment file. This handles the retrieval and deciphering of the encrypted secrets.
	```swift
	import ArkanaKeys
	```
* **WeatherApp**(iOS Project): This folder contains the resources, source files and all other miscellaneous files to build the iOS project. This folder is further branched into:
	- **Resources**: Contains image and color assets in the asset catalog titled `Assets`. Fonts, Localization, Lottie, sample data and entitlement files are also placed in this folder. Additional files such as the `Info.plist` and `LaunchScreen.storyboard` are here too.
	- **Code**: The app is completely written in SwiftUI/Combine. Contains all the code to build the app which is further divided into:
		- Application: contains the delegates and scenes.
		- Generated: contains generated code from Swiftgen.
		- Networking: contains code for API Client and related models/types.
		- Helpers: contains manager classes, extensions, data-models and constants.
		- UI: contains all UI related code segregated into separate folders based on the UI component. There are more deeper levels of segregation based on the complexity of the views.



### Tools
This project is set up to use a variety of tools destined for eliminating writing boilerplate code and catching potential issues as early as possible.
- [SwiftLint](https://github.com/realm/SwiftLint/) is a tool that parses `swift` files, and output warnings when a code-smell is identified. Sometimes, SwiftLint outputs warnings for desired code, and in these cases the warnings may be disabled in code. *This tool is used through a shell command defined in the **Build Phases** > **SwiftLint** of the target **Eater**.*

- [SwiftGen](https://github.com/SwiftGen/SwiftGen) is a tool allowing to parse the app's various assets (including but not limited to xibs, storyboards, fonts, assets library, strings file, etc). This app is built to use SwiftGen to generate 3 kinds of compile-time constants related to:
	- *.xcassets*: A compile-time generated list of assets, accessible via the global type `Asset`.
	- *Localization*: A compile-time generated list of localization keys, accessible via the global type `Localizable`.
	- *Fonts*: Fonts in the folder `Resources/Fonts` are automatically parsed and added to the enumeration `FontWeight`, and usable from the custom constructor `UIFont.appFont(_:, size:)`. If no fonts are available, then the `FontWeight` only contains two cases, `regular` and `bold` corresponding the relevant system fonts.
	> The tool uses templates that allows to customize the generated code to your desired style. Default templates are bundled with the project in `Templates/SwiftGen`, and can be modified if needed.
	
	*The shell commands defined to use this tool can be found under **Edit Scheme(Eater)** > **Build** > **Pre-actions** > **Pre-generate code**.*
	
