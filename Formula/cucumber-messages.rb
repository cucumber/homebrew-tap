# Generated with JReleaser 1.23.0 at 2026-04-05T17:39:33.052561713Z

class CucumberMessages < Formula
  desc "A commandline interface to work with Cucumber Messages"
  homepage "https://cucumber.io"
  version "0.2.11"
  license "MIT AND Apache-2.0 AND (GPL-2.0 WITH Classpath-exception-2.0)"

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/cucumber/messages-cli/releases/download/v0.2.11/cucumber-messages-standalone-0.2.11-linux-aarch_64.zip"
    sha256 "4cd714927b273b4b1de2cc46855c1ebc1ffdf6c1951835833c5c9351c969d85e"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/cucumber/messages-cli/releases/download/v0.2.11/cucumber-messages-standalone-0.2.11-linux-x86_64.zip"
    sha256 "74d7a90167ade499095eb2e5b3f34c4fbea446ec6b70f9c78914a5bbcf0dae89"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/cucumber/messages-cli/releases/download/v0.2.11/cucumber-messages-standalone-0.2.11-osx-aarch_64.zip"
    sha256 "1a22c08b00d1e838775e3686c022b563cde8e0d1f021242ccb2e04b2f5b04594"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/cucumber/messages-cli/releases/download/v0.2.11/cucumber-messages-standalone-0.2.11-osx-x86_64.zip"
    sha256 "baa1def9e140191f8e11052392219c2ffe42b50241bd00938653f5c20bb8c864"
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
    assert_match "0.2.11", output
  end
end
