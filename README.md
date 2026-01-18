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


### N_m3u8DL-RE

Cross-platform DASH/HLS/MSS downloader

```bash
brew install --HEAD n-m3u8dl-re
```

#### Requirements

- dotnet (SDK)
- ffmpeg

#### Usage

```bash
N_m3u8DL-RE --help
```

For more options, see [N_m3u8DL-RE documentation](https://github.com/LeviTK/N_m3u8DL-RE).
