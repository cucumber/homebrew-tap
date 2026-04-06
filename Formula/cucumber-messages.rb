# Generated with JReleaser 1.23.0 at 2026-04-06T00:08:46.772505111Z

class CucumberMessages < Formula
  desc "A commandline interface to work with Cucumber Messages"
  homepage "https://cucumber.io"
  version "0.3.0"
  license "MIT AND Apache-2.0 AND (GPL-2.0 WITH Classpath-exception-2.0)"

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/cucumber/messages-cli/releases/download/v0.3.0/cucumber-messages-standalone-0.3.0-linux-aarch_64.zip"
    sha256 "434f22bdb37ec57f337753c2c2b8b8b955f9f3030fe2e823fb192c55c0849f5d"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/cucumber/messages-cli/releases/download/v0.3.0/cucumber-messages-standalone-0.3.0-linux-x86_64.zip"
    sha256 "f5387f9af100d6d95be5e385df8148ecb0521f849358fafb74026e7c8b96f6d5"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/cucumber/messages-cli/releases/download/v0.3.0/cucumber-messages-standalone-0.3.0-osx-aarch_64.zip"
    sha256 "0410c07c7ad16c2242c21f9a98c70013ec9bba06766378f3c4b2fe3be3ae5767"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/cucumber/messages-cli/releases/download/v0.3.0/cucumber-messages-standalone-0.3.0-osx-x86_64.zip"
    sha256 "69612725d4ca8e36c15447dcc4a605772d0898f26cd0a569c244fadf6b28f1e2"
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
    assert_match "0.3.0", output
  end
end
