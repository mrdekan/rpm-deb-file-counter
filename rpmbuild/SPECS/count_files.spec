Name: count_files
Version: 1.0
Release: 1%{?dist}
Summary: Script for calculating count of files in etc

License: GPL
Source0: count_files-1.0.tar.gz

%description
Simple script

%prep
%autosetup -c

%install
mkdir -p %{buildroot}/usr/local/bin
install -m 755 count_files.sh %{buildroot}/usr/local/bin/count_files.sh

%files
/usr/local/bin/count_files.sh

%changelog
* Sun Oct 13 2024 Yehor yeros05040504@gmail.com - 1.0-1
- Initial package
