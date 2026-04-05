# Generated with JReleaser 1.23.0 at 2026-04-05T20:01:22.070427402Z

class CucumberMessages < Formula
  desc "A commandline interface to work with Cucumber Messages"
  homepage "https://cucumber.io"
  version "0.2.12"
  license "MIT AND Apache-2.0 AND (GPL-2.0 WITH Classpath-exception-2.0)"

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/cucumber/messages-cli/releases/download/v0.2.12/cucumber-messages-standalone-0.2.12-linux-aarch_64.zip"
    sha256 "8b85ccb84403b17f47674429c83216b97bd172d59988143111295ad16b28ea1a"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/cucumber/messages-cli/releases/download/v0.2.12/cucumber-messages-standalone-0.2.12-linux-x86_64.zip"
    sha256 "b3ae9d92133650daa192c7be7819f91e7dc22b8bad16ddd476eccc6b7a268fe4"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/cucumber/messages-cli/releases/download/v0.2.12/cucumber-messages-standalone-0.2.12-osx-aarch_64.zip"
    sha256 "f9788fd490e6a4d6ae6b24b6eb6ee4c9fe00287b2c423a1019e535e6cc907c65"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/cucumber/messages-cli/releases/download/v0.2.12/cucumber-messages-standalone-0.2.12-osx-x86_64.zip"
    sha256 "24c308d38da39333132df544823f4495b05236ee0530c2563540a1472ba4eddc"
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
