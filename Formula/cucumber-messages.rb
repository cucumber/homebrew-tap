# Generated with JReleaser 1.23.0 at 2026-04-05T22:12:52.618436718+02:00

class CucumberMessages < Formula
  desc "A commandline interface to work with Cucumber Messages"
  homepage "https://cucumber.io"
  version "0.2.12"
  license "MIT AND Apache-2.0 AND (GPL-2.0 WITH Classpath-exception-2.0)"

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/cucumber/messages-cli/releases/download/v0.2.12/cucumber-messages-standalone-0.2.12-linux-aarch_64.zip"
    sha256 "f874224eb2cacdfc0d07a2430fbabd3ab8c937b651c1d09c37914fdd67fa045e"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/cucumber/messages-cli/releases/download/v0.2.12/cucumber-messages-standalone-0.2.12-linux-x86_64.zip"
    sha256 "eb87d98b2b94b945bc5b83288512952d514b34cd47a4420c60deb26c8aaa7d0a"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/cucumber/messages-cli/releases/download/v0.2.12/cucumber-messages-standalone-0.2.12-osx-aarch_64.zip"
    sha256 "1d9320c33b090484f860d43d1bb4e2567179bda86bd1589d6a8cb5d65bf4d9ef"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/cucumber/messages-cli/releases/download/v0.2.12/cucumber-messages-standalone-0.2.12-osx-x86_64.zip"
    sha256 "eda573343e92de2191a729b6ce428115273e9f5828d8210f2dcd9eee603a306b"
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
    assert_match "0.2.12", output
  end
end
