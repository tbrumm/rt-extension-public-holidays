use lib '.';

use inc::Module::Install;

version '1.0';
license 'gpl_2';
author  'Torsten Brumm';

RTx 'RT-Extension-PublicHolidays';

requires_rt '6.0.0';
rt_too_new  '7.0.0';

requires 'POSIX';

sign;
WriteAll;
