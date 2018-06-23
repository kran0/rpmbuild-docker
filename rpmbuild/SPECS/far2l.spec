Name: far2l
Version: 2.0
Release: %revision.fc28

Summary: Linux port of FAR v2

Group: File tools
License: GPLv2
Url: https://github.com/elfmz/far2l

# Source-git: https://github.com/elfmz/far2l.git
Source: %name-%version.tar

BuildRequires: gawk, m4, glib2-devel, wxGTK3-devel, cmake >= 3.2.2, gcc-c++
Requires: wxGTK, compat-wxGTK3-gtk2

%description
Linux port of FAR v2
ALPHA VERSION - currently interesting only for entusiasts!!!

Working plugins: colorer, multiarc, farftp, tmppanel, align, autowrap, drawline, editcase, SimpleIndent.

License: GNU/GPLv2

Used code from projects:
FAR for Windows
Wine
ANSICON
Portable UnRAR
7z ANSI-C Decoder

%global debug_package %{nil}

%prep
%setup

%build
cmake -DCMAKE_BUILD_TYPE=Release
make -j4

%install
mkdir -p %buildroot%_bindir/
mkdir -p %buildroot%_libexecdir/%name/
cp -a install/* %buildroot%_libexecdir/%name/
ln -s ../../%_libexecdir/%name/far2l %buildroot%_bindir/%name

%files
%_bindir/%name
%_libexecdir/%name/

%changelog
* Sat Jun 23 2018 Pavel Shumskii <shumskii+rpmbuild@gmail.com> 2.0-fc28
- initial build
