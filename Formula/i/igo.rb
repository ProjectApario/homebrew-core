class Igo < Formula
  desc "Multi-version Go Installer"
  homepage "https://github.com/ProjectApario/igo"
  url "https://github.com/ProjectApario/igo/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "3beea9ea96a6f32aaffd5ee1013847f8f8285a557f37fe3ee978066887737005"
  license all_of: [
    "MIT",
    any_of: ["MIT", "Apache-2.0"],
  ]
  head "https://github.com/ProjectApario/igo.git", branch: "master"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "0b6c7273363c4aef80f0e14e6c6e35dd6fab26954b18ddaf6095a2284d664a6e"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "0b6c7273363c4aef80f0e14e6c6e35dd6fab26954b18ddaf6095a2284d664a6e"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "0b6c7273363c4aef80f0e14e6c6e35dd6fab26954b18ddaf6095a2284d664a6e"
    sha256 cellar: :any_skip_relocation, sonoma:        "b0e95697e7dccadd74b5746875269e485010599b73236f09d0253b4d7746ae7a"
    sha256 cellar: :any_skip_relocation, ventura:       "b0e95697e7dccadd74b5746875269e485010599b73236f09d0253b4d7746ae7a"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "e605d76bb7e403507b6b52cf839ae22ddf0610b6b57d87fb09995199c0164788"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "316018515f2bb088bca43b10992a974095f25ac702eeea70541ad3a079963eca"
  end

  depends_on "go" => :build

  def install
    ldflags = %W[
      -s -w
      -X github.com/ProjectApario/igo.CurrentCommit=#{tap.user}
    ]
    system "go", "build", *std_go_args(ldflags:), "."
  end

  test do
    assert_match "initializing IGO Environment", shell_output("#{bin}/igo -e")
  end
end
