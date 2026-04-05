# Generated with JReleaser 1.23.0 at 2026-04-05T19:49:42.531522137Z

class CucumberMessages < Formula
  desc "A commandline interface to work with Cucumber Messages"
  homepage "https://cucumber.io"
  version "0.2.12"
  license "MIT AND Apache-2.0 AND (GPL-2.0 WITH Classpath-exception-2.0)"

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/cucumber/messages-cli/releases/download/v0.2.12/cucumber-messages-standalone-0.2.12-linux-aarch_64.zip"
    sha256 "cdc4690f352890055a9e4d58004dc8d4e2f7e6865c58aebe2a306843860fab44"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/cucumber/messages-cli/releases/download/v0.2.12/cucumber-messages-standalone-0.2.12-linux-x86_64.zip"
    sha256 "afb100b7fc7170b3f103c815dbade85bcda35f5109191622d24bea71a89b5eef"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/cucumber/messages-cli/releases/download/v0.2.12/cucumber-messages-standalone-0.2.12-osx-aarch_64.zip"
    sha256 "1a3453e47cd5e1e44fb014c98e428806c1256e6f3f14b43d1c673965aea52c49"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/cucumber/messages-cli/releases/download/v0.2.12/cucumber-messages-standalone-0.2.12-osx-x86_64.zip"
    sha256 "e55392c3ad0098d9882486273c6059ee16591611274bb182cb621b9701079d9d"
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
