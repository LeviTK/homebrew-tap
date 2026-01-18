# Homebrew Tap for LeviTK

This repository contains Homebrew formulae for LeviTK projects.

## Installation

```bash
brew tap LeviTK/tap
```

## Available Formulae

### BBDown

Bilibili video downloader - 哔哩哔哩下载器

```bash
brew install LeviTK/tap/bbdown
```

#### Requirements

- .NET 9.0 runtime (will prompt to install if missing)
- ffmpeg (recommended, for video muxing)

```bash
brew install --cask dotnet-sdk
brew install ffmpeg
```

#### Usage

```bash
# Login to Bilibili
bbdown login

# Download video
bbdown "https://www.bilibili.com/video/BV1xxxxxx"
```

For more options, see [BBDown documentation](https://github.com/LeviTK/BBDown).
