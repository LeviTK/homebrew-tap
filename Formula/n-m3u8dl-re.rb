class NM3u8dlRe < Formula
  desc "Cross-platform DASH/HLS/MSS downloader"
  homepage "https://github.com/LeviTK/N_m3u8DL-RE"
  url "https://github.com/LeviTK/N_m3u8DL-RE/archive/refs/tags/v0.5.1-beta.tar.gz"
  sha256 "55559fec4deef7e40a4d45eebb699865f01d04f7e72110ce5d11b4ca3e655a93"
  license "MIT"
  version "0.5.1"

  # 必需依赖
  depends_on "dotnet" => :build
  depends_on "ffmpeg"

  # 推荐依赖（可选功能）
  depends_on "mkvtoolnix" => :recommended  # mkvmerge 混流
  depends_on "bento4" => :recommended      # mp4decrypt 解密

  def install
    rid = Hardware::CPU.arm? ? "osx-arm64" : "osx-x64"

    # 使用 framework-dependent 发布，减小体积
    system "dotnet", "publish", "src/N_m3u8DL-RE/N_m3u8DL-RE.csproj",
           "-c", "Release",
           "-r", rid,
           "--self-contained", "false",
           "-p:PublishAot=false",
           "-p:PublishTrimmed=false",
           "-o", "publish"

    libexec.install Dir["publish/*"]
    (bin/"N_m3u8DL-RE").write_env_script libexec/"N_m3u8DL-RE",
      DOTNET_ROOT: Formula["dotnet"].opt_libexec

    # 创建小写别名方便使用
    bin.install_symlink "N_m3u8DL-RE" => "n-m3u8dl-re"
  end

  def caveats
    <<~EOS
      N_m3u8DL-RE 已安装。

      必需依赖：
        - ffmpeg (已自动安装)
        - dotnet runtime (已自动安装)

      可选依赖（按需功能）：
        - mkvmerge: brew install mkvtoolnix  # 用于 -M muxer=mkvmerge
        - mp4decrypt: brew install bento4    # 用于 DRM 解密（默认引擎）
        - shaka-packager: 需手动安装         # 用于 DRM 解密（备选引擎）

      shaka-packager 注意事项（Apple Silicon）：
        官方未提供 arm64 版本，需下载 x64 版本通过 Rosetta 运行。
        下载后重命名为 shaka-packager 并放入 PATH，或使用：
          --decryption-binary-path /path/to/packager

      使用示例：
        N_m3u8DL-RE "https://example.com/playlist.m3u8" --save-name video
        N_m3u8DL-RE --help
    EOS
  end

  test do
    assert_match "0.5.1", shell_output("#{bin}/N_m3u8DL-RE --version", 0)
  end
end
