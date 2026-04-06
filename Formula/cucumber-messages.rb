# Generated with JReleaser 1.23.0 at 2026-04-06T00:30:04.792534656Z

class CucumberMessages < Formula
  desc "A commandline interface to work with Cucumber Messages"
  homepage "https://cucumber.io"
  version "0.3.2"
  license "MIT AND Apache-2.0 AND (GPL-2.0 WITH Classpath-exception-2.0)"

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/cucumber/messages-cli/releases/download/v0.3.2/cucumber-messages-standalone-0.3.2-linux-aarch_64.zip"
    sha256 "ba4d537336c6c8507998b7bfe02653946778499e7e9da4b9ae92a51f0849f92f"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/cucumber/messages-cli/releases/download/v0.3.2/cucumber-messages-standalone-0.3.2-linux-x86_64.zip"
    sha256 "1af7ef3f9419fd18e536755e9080a8cda8186b1f575cc51a01ee42890940eff7"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/cucumber/messages-cli/releases/download/v0.3.2/cucumber-messages-standalone-0.3.2-osx-aarch_64.zip"
    sha256 "bde0b2cb52576e5dff82f18fa243d1f9b9381dde731a60b64f726d17c3468727"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/cucumber/messages-cli/releases/download/v0.3.2/cucumber-messages-standalone-0.3.2-osx-x86_64.zip"
    sha256 "d22b76f89e64170fa2c31754d8b1510a099547eae921b1de1768a0f5e1156760"
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
    assert_match "0.3.2", output
  end
end
