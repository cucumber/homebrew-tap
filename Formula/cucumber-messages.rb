# Generated with JReleaser 1.23.0 at 2026-04-05T22:07:12.186795072+02:00

class CucumberMessages < Formula
  desc "A commandline interface to work with Cucumber Messages"
  homepage "https://cucumber.io"
  version "0.2.12"
  license "MIT AND Apache-2.0 AND (GPL-2.0 WITH Classpath-exception-2.0)"

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/cucumber/messages-cli/releases/download/v0.2.12/cucumber-messages-standalone-0.2.12-linux-aarch_64.zip"
    sha256 "0c1869b6e79f44de173bd53317bb93d808dea0868c0153858f623495bd85fe53"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/cucumber/messages-cli/releases/download/v0.2.12/cucumber-messages-standalone-0.2.12-linux-x86_64.zip"
    sha256 "95f71cf8a056224d704e308a7972900902441497966d83d3e230e5446e17ad8b"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/cucumber/messages-cli/releases/download/v0.2.12/cucumber-messages-standalone-0.2.12-osx-aarch_64.zip"
    sha256 "38032a87240c386c5c7f57d486f9b8d3505aefb29d2f564e0e112f063dc0e76b"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/cucumber/messages-cli/releases/download/v0.2.12/cucumber-messages-standalone-0.2.12-osx-x86_64.zip"
    sha256 "6814cf26f8f4e2477c0a598b35c223b9fabc46937fd96b77aaf0abfa1d3bad36"
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
