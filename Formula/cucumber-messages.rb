# Generated with JReleaser 1.23.0 at 2026-04-05T20:03:49.019341124Z

class CucumberMessages < Formula
  desc "A commandline interface to work with Cucumber Messages"
  homepage "https://cucumber.io"
  version "0.2.13"
  license "MIT AND Apache-2.0 AND (GPL-2.0 WITH Classpath-exception-2.0)"

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/cucumber/messages-cli/releases/download/v0.2.13/cucumber-messages-standalone-0.2.13-linux-aarch_64.zip"
    sha256 "279fab5a6cca9ed1f896009861727fee3812d703fa72d2eb2c2e9e9e3025bac7"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/cucumber/messages-cli/releases/download/v0.2.13/cucumber-messages-standalone-0.2.13-linux-x86_64.zip"
    sha256 "9bd96a8271c032b5f7145c2c2ed3ea74ff9ea6f9a267b59c7ff1baeaa9d1715e"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/cucumber/messages-cli/releases/download/v0.2.13/cucumber-messages-standalone-0.2.13-osx-aarch_64.zip"
    sha256 "6951c58b9119240ce99281054b35c952473bce4adccfb42bb785b2680d56cf17"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/cucumber/messages-cli/releases/download/v0.2.13/cucumber-messages-standalone-0.2.13-osx-x86_64.zip"
    sha256 "319fb24338315fc8dd76a220ec2854ec67b59afe86d7b1e0871fa7f44411a8d6"
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
    assert_match "0.2.13", output
  end
end
