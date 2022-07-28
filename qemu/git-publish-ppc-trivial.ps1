git config --global core.editor notepad

$env:HOME="$env:USERPROFILE"
$env:PATH="C:\work\xtal\qt-deps\strawberry-perl-5.32.1.1-64bit\perl\bin;$env:PATH"
cd ..\..\qemu
python ..\git-publish\git-publish `
--cc-cmd="perl scripts/get_maintainer.pl --noroles --norolestats --nogit --nogit-fallback 2>nul" `
-b upstream/master --topic=ppc-trivial `
--to qemu-devel@nongnu.org `
--cc qemu-trivial@nongnu.org `
--cc qemu-ppc@nongnu.org

pause
