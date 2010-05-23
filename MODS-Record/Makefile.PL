use inc::Module::Install;

# Metadata
name         'MODS-Record';
all_from     'lib/MODS/Record.pm';
author       'Heiko Jansen <hjansen@cpan.org>';
license      'perl';
version      '0.01';
perl_version '5.010'; # cf. PRANG 

# Specific dependencies
requires       'File::ShareDir' => '1.02';
requires       'PRANG' => '0.07';
test_requires  'Test::More';
test_requires  'XML::Compare' => '0.02';

install_share;

WriteAll;

