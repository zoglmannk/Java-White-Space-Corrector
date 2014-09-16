Java-White-Space-Corrector
==========================

This is a quick and dirty Perl script to safely convert tabs to spaces in Java source files. This script is intended
to fix issues where editors have introduced BOTH tabs and spaces for indentation and you
want to do a one time correction.

##To use this script:
```
cd ~/$JAVA_PROJECT_ROOT

find * | grep \\.java$ | xargs -IXX /Users/kaz/tmp/tabs2spaces/tabs2spaces.pl XX
find * | grep \\.java+$ | xargs -IXX bash -c 'Z=XX; mv $Z ${Z:0:$((${#Z}-1))}'
```
