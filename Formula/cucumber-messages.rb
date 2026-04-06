# Generated with JReleaser 1.23.0 at 2026-04-06T00:28:37.667294066Z

class CucumberMessages < Formula
  desc "A commandline interface to work with Cucumber Messages"
  homepage "https://cucumber.io"
  version "0.3.1"
  license "MIT AND Apache-2.0 AND (GPL-2.0 WITH Classpath-exception-2.0)"

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/cucumber/messages-cli/releases/download/v0.3.1/cucumber-messages-standalone-0.3.1-linux-aarch_64.zip"
    sha256 "68d0a4f88ade45080874c0cf7e990b18834860f93e5a42b325c41285e98a724a"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/cucumber/messages-cli/releases/download/v0.3.1/cucumber-messages-standalone-0.3.1-linux-x86_64.zip"
    sha256 "2f1fec28537ee631f39bf98004ccee1b05fe04fe73c6f0fedfc25f23c8e55b41"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/cucumber/messages-cli/releases/download/v0.3.1/cucumber-messages-standalone-0.3.1-osx-aarch_64.zip"
    sha256 "c423af197fc434ad520ec1d955600b234b7a16755ceaee27c270e4315e1a3f7b"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/cucumber/messages-cli/releases/download/v0.3.1/cucumber-messages-standalone-0.3.1-osx-x86_64.zip"
    sha256 "2bb13d69a07576fa7b52c2dc0695f88dd81824c9e433d3b0557c9f513efb10f7"
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
    assert_match "0.3.1", output
  end
end
