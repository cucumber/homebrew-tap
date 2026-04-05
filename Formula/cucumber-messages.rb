# Generated with JReleaser 1.23.0 at 2026-04-05T20:01:49.947646734Z

class CucumberMessages < Formula
  desc "A commandline interface to work with Cucumber Messages"
  homepage "https://cucumber.io"
  version "0.2.13"
  license "MIT AND Apache-2.0 AND (GPL-2.0 WITH Classpath-exception-2.0)"

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/cucumber/messages-cli/releases/download/v0.2.13/cucumber-messages-standalone-0.2.13-linux-aarch_64.zip"
    sha256 "93d079ff1e52e6055a90a96b9abe2fea011b039867225f8e5cc81d6ff390e528"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/cucumber/messages-cli/releases/download/v0.2.13/cucumber-messages-standalone-0.2.13-linux-x86_64.zip"
    sha256 "bedecf386612a03c5d73a34a9880b7c4044517a7dd33ee99c38e56918a7f03f7"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/cucumber/messages-cli/releases/download/v0.2.13/cucumber-messages-standalone-0.2.13-osx-aarch_64.zip"
    sha256 "080791fd8d25554710e34f7d8f96b3326e5b554d3779091fa07e83c1c775ef96"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/cucumber/messages-cli/releases/download/v0.2.13/cucumber-messages-standalone-0.2.13-osx-x86_64.zip"
    sha256 "abb4ecd265380e1afd6b3a5eb8a4920e7bc242f6a57c9709c7155fdada215004"
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
