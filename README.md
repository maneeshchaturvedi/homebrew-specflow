# Package Repository for Vokt

Official package repository for [Vokt](https://github.com/maneeshchaturvedi/vokt) - supporting Homebrew (macOS/Linux) and Chocolatey (Windows).

## Installation

### macOS/Linux (Homebrew)

```bash
brew tap maneeshchaturvedi/vokt
brew install vokt
```

### Windows (Chocolatey)

Download the latest `.nupkg` file from [releases](https://github.com/maneeshchaturvedi/homebrew-vokt/releases) and install:

```powershell
# Navigate to the directory containing the .nupkg file
choco install vokt-cli -s . -y
```

Or using PowerShell to download and install:

```powershell
# Replace with the desired version
$version = "1.1.0-alpha"
$url = "https://github.com/maneeshchaturvedi/homebrew-vokt/releases/download/v$version/vokt-cli.$version.nupkg"
Invoke-WebRequest -Uri $url -OutFile "vokt-cli.$version.nupkg"
choco install vokt-cli -s . -y
```

## About Vokt

Add tests and documentation to legacy code automatically - as you work.

Vokt lets you safely use AI assistants on legacy codebases by automatically generating specifications and tests. No big-bang refactoring required.

### Features

- 🔄 **Cold-Start** - Auto-generate specs from existing legacy code
- 🧪 **Test Generation** - Comprehensive tests with property-based testing
- 📊 **80/20 Rule** - Cover the 20% of code that changes 80% of the time
- 📚 **Living Documentation** - Version history shows WHY decisions were made
- 🛡️ **Drift Detection** - Prevents AI from breaking existing requirements

## Links

- [Documentation](https://github.com/maneeshchaturvedi/vokt)
- [Issues](https://github.com/maneeshchaturvedi/vokt/issues)

## License

MIT
