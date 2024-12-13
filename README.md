# digipost

A new Flutter project.

### Requirements
- Flutter (latest stable version)
- Dart (latest stable version)
- Android Studio (latest stable version) // for Android development
- Xcode (latest stable version) // for iOS development
- Make

## Getting Started development

1- Clone the project
```bash
git clone https://github.com/Djancyp/digipost-flutter --branch develop
```

2- create .env file
```bash
mv .env.example .env
```
3- generate .env keys
```bash
make generate-keys
```
```bash
lib/
├── env
│   ├── env.dart 
│   └── env.g.dart (generated))
```
- make sure after adding new keys to .env file to run the command `make generate-keys` to generate the new keys in the env.g.dart file




