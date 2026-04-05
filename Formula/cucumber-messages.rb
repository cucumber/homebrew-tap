# Generated with JReleaser 1.23.0 at 2026-04-05T22:48:33.954541881Z

class CucumberMessages < Formula
  desc "A commandline interface to work with Cucumber Messages"
  homepage "https://cucumber.io"
  version "0.2.14"
  license "MIT AND Apache-2.0 AND (GPL-2.0 WITH Classpath-exception-2.0)"

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/cucumber/messages-cli/releases/download/v0.2.14/cucumber-messages-standalone-0.2.14-linux-aarch_64.zip"
    sha256 "82ddcf7e327da606a51283b7f67a126a5e0345fe3f24d9cf9202b26764f0251f"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/cucumber/messages-cli/releases/download/v0.2.14/cucumber-messages-standalone-0.2.14-linux-x86_64.zip"
    sha256 "af46333700b9ebc4b7a04239eb5f3e926479217d722e14c52e011dc81033ca7d"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/cucumber/messages-cli/releases/download/v0.2.14/cucumber-messages-standalone-0.2.14-osx-aarch_64.zip"
    sha256 "2d7dab1e977627c42cd5da1c6dc3ddc8c5ba888a6900868c623cae6daa36c566"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/cucumber/messages-cli/releases/download/v0.2.14/cucumber-messages-standalone-0.2.14-osx-x86_64.zip"
    sha256 "37e9e4eecc5ffb5090cea1639681ff68b6e554e9c4d86a08c31d6d012a0cf5a2"
  end


  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/cucumber-messages" => "cucumber-messages"
  end

  def post_install
    if OS.mac?
      Dir["#{libexec}/lib/**/*.dylib"].each do |dylib|
        chmod 0664, dylib
        MachO::Tools.change_dylib_id(dylib, "@rpath/#{File.basename(dylib)}")
        MachO.codesign!(dylib)
        chmod 0444, dylib
      end
    end
  end

  test do
    output = shell_output("#{bin}/cucumber-messages --version")
    assert_match "0.2.14", output
  end
end
