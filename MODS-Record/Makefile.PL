use inc::Module::Install;

name     'MODS-Record';
all_from 'lib/MODS/Record.pm';
author   q{Heiko Jansen <hjansen@cpan.org>};
license  'perl';

build_requires 'Test::More';

auto_install;

WriteAll;

