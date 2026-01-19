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

Cross-platform DASH/HLS/MSS downloader - 跨平台 DASH/HLS/MSS 下载工具

```bash
brew install LeviTK/tap/n-m3u8dl-re
```

#### Requirements

自动安装：
- dotnet (SDK/Runtime)
- ffmpeg

推荐安装（可选功能）：
- mkvtoolnix - mkvmerge 混流
- bento4 - mp4decrypt 解密

#### Usage

```bash
# 下载 HLS/DASH 视频
N_m3u8DL-RE "https://example.com/playlist.m3u8" --save-name video

# 查看帮助
N_m3u8DL-RE --help

# 小写命令也可用
n-m3u8dl-re --help
```

#### Apple Silicon 注意事项

shaka-packager 官方未提供 arm64 版本，需下载 x64 版本通过 Rosetta 运行，或使用 `--decryption-binary-path` 指定路径。

For more options, see [N_m3u8DL-RE documentation](https://github.com/LeviTK/N_m3u8DL-RE).
