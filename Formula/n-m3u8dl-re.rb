class Nm3u8dlRe < Formula
  desc "Cross-platform DASH/HLS/MSS downloader"
  homepage "https://github.com/LeviTK/N_m3u8DL-RE"
  license "MIT"
  head "https://github.com/LeviTK/N_m3u8DL-RE.git", branch: "main"

  depends_on "dotnet"
  depends_on "ffmpeg"

  def install
    odie "This formula is macOS-only." unless OS.mac?

    rid = Hardware::CPU.arm? ? "osx-arm64" : "osx-x64"
    system "dotnet", "publish", "src/N_m3u8DL-RE/N_m3u8DL-RE.csproj",
      "-c", "Release",
      "-r", rid,
      "--self-contained", "false",
      "-p:PublishAot=false",
      "-p:PublishTrimmed=false",
      "-o", "publish"
    libexec.install Dir["publish/*"]
    bin.install_symlink libexec/"N_m3u8DL-RE"
  end

  test do
    system "#{bin}/N_m3u8DL-RE", "--version"
  end
end
