# Generated with JReleaser 1.23.0 at 2026-04-06T00:30:33.173990489Z

class CucumberMessages < Formula
  desc "A commandline interface to work with Cucumber Messages"
  homepage "https://cucumber.io"
  version "0.3.3"
  license "MIT AND Apache-2.0 AND (GPL-2.0 WITH Classpath-exception-2.0)"

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/cucumber/messages-cli/releases/download/v0.3.3/cucumber-messages-standalone-0.3.3-linux-aarch_64.zip"
    sha256 "6caa71f7266ed84caafe4e8b3b43e9c25816de2118b9a35550ba7fb6a6bd29b7"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/cucumber/messages-cli/releases/download/v0.3.3/cucumber-messages-standalone-0.3.3-linux-x86_64.zip"
    sha256 "9446ab2a2780414297e8e1158299842b06512767609dc5d2ec215462dacf4f2d"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/cucumber/messages-cli/releases/download/v0.3.3/cucumber-messages-standalone-0.3.3-osx-aarch_64.zip"
    sha256 "6cc7857db2b4acf205c1dac81a96c9904da6375bab7d9695c10cff98c8e64e2f"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/cucumber/messages-cli/releases/download/v0.3.3/cucumber-messages-standalone-0.3.3-osx-x86_64.zip"
    sha256 "32c3c8813933f2fac95149fec1554f91a7d23ed5c6d4d79b379f5b384bfe15d3"
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
    assert_match "0.3.3", output
  end
end
