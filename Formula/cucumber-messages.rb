# Generated with JReleaser 1.23.0 at 2026-04-05T14:09:44.38022063Z

class CucumberMessages < Formula
  desc "A commandline interface for working with Cucumber Messages"
  homepage "https://cucumber.io/"
  version "0.2.9"
  license "MIT AND Apache-2.0 AND (GPL-2.0 WITH Classpath-exception-2.0)"

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/cucumber/messages-cli/releases/download/v0.2.9/cucumber-messages-standalone-0.2.9-linux-aarch_64.zip"
    sha256 "cbb39eb332720198523e21a1d2fd92d0e6840c5a7a6257bc451fe9b2bcfc5013"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/cucumber/messages-cli/releases/download/v0.2.9/cucumber-messages-standalone-0.2.9-linux-x86_64.zip"
    sha256 "7904fa83cb1c56cd38b6659d544f1729a363d5342f1e38b5f9b309251747e401"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/cucumber/messages-cli/releases/download/v0.2.9/cucumber-messages-standalone-0.2.9-osx-aarch_64.zip"
    sha256 "fd14886f5aaeacd2923d6bf6e9ac7bd71ce3e80abcdbbb24b6aa97cd3f01c2ca"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/cucumber/messages-cli/releases/download/v0.2.9/cucumber-messages-standalone-0.2.9-osx-x86_64.zip"
    sha256 "f6e3eaff6515fd0123933f13a32a366b97ab5f957a99c0ea49b2ab68d2b66972"
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
    assert_match "0.2.9", output
  end
end
