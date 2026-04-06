# Generated with JReleaser 1.23.0 at 2026-04-06T01:05:53.970181647Z

class CucumberMessages < Formula
  desc "A commandline interface to work with Cucumber Messages"
  homepage "https://cucumber.io"
  version "0.3.4"
  license "MIT AND Apache-2.0 AND (GPL-2.0 WITH Classpath-exception-2.0)"

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/cucumber/messages-cli/releases/download/v0.3.4/cucumber-messages-standalone-0.3.4-linux-aarch_64.zip"
    sha256 "3d017239384d4a0d4b51ec3c51fbe3a4eb1323eeecbed37d17face199d1405df"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/cucumber/messages-cli/releases/download/v0.3.4/cucumber-messages-standalone-0.3.4-linux-x86_64.zip"
    sha256 "f17358a2b732851a136ef8ba7f80e4f78cf888ee6fe5a77cd43adacc7c8a13b9"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/cucumber/messages-cli/releases/download/v0.3.4/cucumber-messages-standalone-0.3.4-osx-aarch_64.zip"
    sha256 "5a626bd31c2058a8f5d36f7a80b8e83c94a7bfbbfe4d9524c690263ad2835aa0"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/cucumber/messages-cli/releases/download/v0.3.4/cucumber-messages-standalone-0.3.4-osx-x86_64.zip"
    sha256 "afdaaca7947cfb12add6b00c529ce56fcc35406d07b0e1d30c6f4d1cf066f1ca"
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
    assert_match "0.3.4", output
  end
end
