use strict;
use warnings;
use inc::Module::Install;

RTx('RT-Extension-Public-Holidays');

license('gpl_2');
author('Torsten Brumm');
version_from('lib/RT/Extension/PublicHolidays.pm');

requires_rt('5.0.0');
rt_too_new('7.0.0');

requires('POSIX');

auto_manifest();
sign(0);
WriteAll();
