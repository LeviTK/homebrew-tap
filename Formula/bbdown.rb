class Bbdown < Formula
  desc "Bilibili video downloader - 哔哩哔哩下载器 (supports Apple Silicon)"
  homepage "https://github.com/LeviTK/BBDown"
  url "https://github.com/LeviTK/BBDown/archive/refs/tags/v1.6.4.tar.gz"
  sha256 "725ea57bb737c875d0bd0399836e1aa58c46b120a5ce06625ae479217a99a466"
  license "MIT"
  head "https://github.com/LeviTK/BBDown.git", branch: "master"

  depends_on "dotnet" => :build
  depends_on "ffmpeg" => :recommended

  def install
    system "dotnet", "publish", "BBDown/BBDown.csproj",
           "-c", "Release",
           "-o", libexec,
           "-p:PublishAot=false",
           "-p:PublishSingleFile=false",
           "--self-contained", "false"

    (bin/"bbdown").write <<~EOS
      #!/bin/bash
      exec dotnet "#{libexec}/BBDown.dll" "$@"
    EOS
  end

  def caveats
    <<~EOS
      To login to Bilibili:
        bbdown login
      
      For video muxing, ffmpeg is recommended:
        brew install ffmpeg
    EOS
  end

  test do
    assert_match "BBDown", shell_output("#{bin}/bbdown --help 2>&1", 1)
  end
end
