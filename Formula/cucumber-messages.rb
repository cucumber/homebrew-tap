# Generated with JReleaser 1.23.0 at 2026-04-03T17:09:27.573778455Z

class CucumberMessages < Formula
  desc "A commandline interface for working with Cucumber Messages"
  homepage "https://cucumber.io/"
  version "0.2.5"
  license "MIT AND Apache-2.0 AND (GPL-2.0 WITH Classpath-exception-2.0)"

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/cucumber/messages-cli/releases/download/v0.2.5/cucumber-messages-linux-aarch_64.zip"
    sha256 "50d0466bb438d36192e09a703247d5f719799d8efc2d56bbf79e069f740eec31"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/cucumber/messages-cli/releases/download/v0.2.5/cucumber-messages-linux-x86_64.zip"
    sha256 "de9526b173138ac3f71793bb385568208bb224ce4e8f6f3a500e4f8ea7e51501"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/cucumber/messages-cli/releases/download/v0.2.5/cucumber-messages-osx-aarch_64.zip"
    sha256 "2efd6921c40f0a849efe418d35dda55ed44f4013f6a3bb6f8989bcc40ca8f5b8"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/cucumber/messages-cli/releases/download/v0.2.5/cucumber-messages-osx-x86_64.zip"
    sha256 "780537d8c0e64f6a7f119897510739d0e43acfc4dd03899dc862f4beef6696a3"
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
    assert_match "0.2.5", output
  end
end
