# Generated with JReleaser 1.23.0 at 2026-04-03T18:07:41.996883744Z

class CucumberMessages < Formula
  desc "A commandline interface for working with Cucumber Messages"
  homepage "https://cucumber.io/"
  version "0.2.6"
  license "MIT AND Apache-2.0 AND (GPL-2.0 WITH Classpath-exception-2.0)"

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/cucumber/messages-cli/releases/download/v0.2.6/cucumber-messages-0.2.6-linux-aarch_64.zip"
    sha256 "46adcf6112120ab1a04b16a09847886d6cb5c313b45857b957370c21e3f54eba"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/cucumber/messages-cli/releases/download/v0.2.6/cucumber-messages-0.2.6-linux-x86_64.zip"
    sha256 "00590e66d5bfb191736b62e4b9fa476799ef8f1f1d3e71b107ffb24660447152"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/cucumber/messages-cli/releases/download/v0.2.6/cucumber-messages-0.2.6-osx-aarch_64.zip"
    sha256 "8153577f71d992aa368703a7688899a555c896b815e399355e8025c3eff59c3f"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/cucumber/messages-cli/releases/download/v0.2.6/cucumber-messages-0.2.6-osx-x86_64.zip"
    sha256 "bfa5002e8f55c91cb9f3c8a6f85828081ac0003c9c927e70687374db4e3290b9"
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
    assert_match "0.2.6", output
  end
end
