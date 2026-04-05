# Generated with JReleaser 1.23.0 at 2026-04-05T14:20:04.645480526Z

class CucumberMessages < Formula
  desc "A commandline interface for working with Cucumber Messages"
  homepage "https://cucumber.io/"
  version "0.2.10"
  license "MIT AND Apache-2.0 AND (GPL-2.0 WITH Classpath-exception-2.0)"

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/cucumber/messages-cli/releases/download/v0.2.10/cucumber-messages-standalone-0.2.10-linux-aarch_64.zip"
    sha256 "28442a9ca1bdfc32d9b50856edc74194d0be5d2374fd585c2038dbff83b5d2f1"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/cucumber/messages-cli/releases/download/v0.2.10/cucumber-messages-standalone-0.2.10-linux-x86_64.zip"
    sha256 "ca3b307c7593df9224d62074c4fd31f69807d5b17b0b998ed8b45b1acfa4574b"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/cucumber/messages-cli/releases/download/v0.2.10/cucumber-messages-standalone-0.2.10-osx-aarch_64.zip"
    sha256 "77a3a277592e494f0460a39f543549059ac0a568594ce0e4ac96f2f89e8d80e8"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/cucumber/messages-cli/releases/download/v0.2.10/cucumber-messages-standalone-0.2.10-osx-x86_64.zip"
    sha256 "b230e92e70053215d202963411ebf4239d1b28b4b568ee895fef7fc070a8ae88"
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
    assert_match "0.2.10", output
  end
end
