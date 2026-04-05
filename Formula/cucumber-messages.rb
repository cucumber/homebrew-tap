# Generated with JReleaser 1.23.0 at 2026-04-05T00:08:33.786334152Z

class CucumberMessages < Formula
  desc "A commandline interface for working with Cucumber Messages"
  homepage "https://cucumber.io/"
  version "0.2.7"
  license "MIT AND Apache-2.0 AND (GPL-2.0 WITH Classpath-exception-2.0)"

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/cucumber/messages-cli/releases/download/v0.2.7/cucumber-messages-0.2.7-linux-aarch_64.zip"
    sha256 "f31e27dc5b0a12426b966a31482c0712f60385be08f7a72b19a4a6400fc72fd1"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/cucumber/messages-cli/releases/download/v0.2.7/cucumber-messages-0.2.7-linux-x86_64.zip"
    sha256 "8b33e8d52ed4ce89442c48e3a531c9ff6b97495819a36008a0a539e5eeb435bc"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/cucumber/messages-cli/releases/download/v0.2.7/cucumber-messages-0.2.7-osx-aarch_64.zip"
    sha256 "c2592c7889160a6a803ed74579ae5dcd1125ba4f218e9ae5af4395f5deadb9d5"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/cucumber/messages-cli/releases/download/v0.2.7/cucumber-messages-0.2.7-osx-x86_64.zip"
    sha256 "5b88426bdbed137092274984d14acb44ac11226a21ef54d89ec72ec876e43212"
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
    assert_match "0.2.7", output
  end
end
