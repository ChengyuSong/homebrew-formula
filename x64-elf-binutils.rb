require 'formula'

class X64ElfBinutils < Formula
  homepage 'http://gcc.gnu.org'
  url 'http://ftp.gnu.org/gnu/binutils/binutils-2.25.1.tar.gz'
  sha1 '3b5e9351d94b94c037e55dd1f8e985a5a8cb0fde'

  depends_on 'gcc' => :build

  def install
    ENV['CC'] = '/usr/local/bin/gcc-5'
    ENV['CXX'] = '/usr/local/bin/g++-5'
    ENV['CPP'] = '/usr/local/bin/cpp-5'
    ENV['LD'] = '/usr/local/bin/gcc-5'

    mkdir 'build' do
      system '../configure', '--disable-nls', '--target=x86_64-elf',
                             '--disable-werror', 
                             '--enable-gold=yes',
                             '--enable-multilib',
                             '--enable-lto',
                             "--prefix=#{prefix}"
      system 'make all'
      system 'make install'
      # FileUtils.mv lib, libexec
    end
  end

end
