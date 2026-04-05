# Generated with JReleaser 1.23.0 at 2026-04-05T00:32:40.807125595Z

class CucumberMessages < Formula
  desc "A commandline interface for working with Cucumber Messages"
  homepage "https://cucumber.io/"
  version "0.2.8"
  license "MIT AND Apache-2.0 AND (GPL-2.0 WITH Classpath-exception-2.0)"

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/cucumber/messages-cli/releases/download/v0.2.8/cucumber-messages-0.2.8-linux-aarch_64.zip"
    sha256 "cade27ac3a56d0df4be9d6c91d9aff729a639d3ce77c3522fb7af7601a686e96"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/cucumber/messages-cli/releases/download/v0.2.8/cucumber-messages-0.2.8-linux-x86_64.zip"
    sha256 "6d9ab8ba0812290da6fc522b14bdf87122a0cd03a6e6ce781e4bb366428a68d9"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/cucumber/messages-cli/releases/download/v0.2.8/cucumber-messages-0.2.8-osx-aarch_64.zip"
    sha256 "79a1bb3525e735fa5824687f00132027c68a5dc75cc2a71f2ad5c75c8eb708d7"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/cucumber/messages-cli/releases/download/v0.2.8/cucumber-messages-0.2.8-osx-x86_64.zip"
    sha256 "b87bd7f2a1c34f4c4ca2fe5a4ec7c92365fb395a72a38f10e85105343018fcae"
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
    assert_match "0.2.8", output
  end
end
