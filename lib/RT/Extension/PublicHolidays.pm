use strict;
use warnings;

package RT::Extension::PublicHolidays;

our $VERSION = '1.0.0';

# Register the dashboard widget automatically when the plugin is loaded
{
    my $components = RT->Config->Get('HomepageComponents');
    unless ( grep { $_ eq 'TodaysHolidays' } @{$components} ) {
        RT->Config->Set( 'HomepageComponents', [ @{$components}, 'TodaysHolidays' ] );
    }
}

=head1 NAME

RT-Extension-Public-Holidays - Worldwide public holidays on the RT login page and dashboards

=head1 DESCRIPTION

This extension displays today's worldwide public holidays in two places:

=over 4

=item * B<Login page> — a banner above the login form showing today's holidays with
type icons, country flags, and descriptions.

=item * B<Dashboard widget> — a C<TodaysHolidays> portlet that can be added to any
RT dashboard, styled to match both light and dark themes automatically.

=back

Holiday data is read from a CSV file (C<holidays-worldwide.csv>) containing
approximately 280 entries covering national, religious, cultural, and
international holidays from over 100 countries. Entries on the same date are
consolidated into a single card with per-country sub-entries.

=head1 RT VERSION

Works with RT 5.0.x and RT 6.0.x.

=head1 INSTALLATION

=over 4

=item 1. Install the extension

    perl Makefile.PL
    make
    make install

May need root permissions.

=item 2. Copy the CSV data file

    cp etc/holidays-worldwide.csv /opt/rt6/local/etc/holidays-worldwide.csv

Adjust the path to match your C<$RT::LocalEtcPath> if it differs.

=item 3. Edit F</opt/rt6/etc/RT_SiteConfig.pm>

Add this line:

    Plugin('RT::Extension::PublicHolidays');

The C<TodaysHolidays> dashboard widget is registered automatically. The login
page banner requires no additional configuration.

=item 4. Clear the Mason cache and restart

    rm -rf /opt/rt6/var/mason_data/obj
    systemctl restart apache2   # or your web server

=back

=head1 CONFIGURATION

=head2 Custom CSV path

By default the extension looks for the CSV at C<$RT::LocalEtcPath/holidays-worldwide.csv>.
To override this, set in your C<RT_SiteConfig.pm>:

    Set($HolidaysCSVPath, '/path/to/your/holidays-worldwide.csv');

=head2 CSV format

The CSV has five columns:

    Date,Holiday,Countries,Type,Description

=over 4

=item * B<Date> — C<MM-DD> for fixed dates, C<variabel (...)> for lunar/variable dates.
A date range C<MM-DD/DD> matches both days.

=item * B<Holiday> — Holiday name. Multiple holidays on the same date are joined with
C< · > (U+00B7 middle dot).

=item * B<Countries> — Country name(s) separated by C< · >. Use English country names
matching the built-in ISO-3166-1 lookup table.

=item * B<Type> — One of: C<National Holiday>, C<Religious Holiday>,
C<Cultural Holiday>, C<International Holiday>, C<Commemoration>, etc.

=item * B<Description> — Free text. For consolidated entries, descriptions are also
separated by C< · >.

=back

=head1 ADDING OR UPDATING HOLIDAYS

Edit C<holidays-worldwide.csv> and redeploy it to C<$RT::LocalEtcPath>. No restart
is required — the file is read on every page load.

=head1 AUTHOR

Torsten Brumm

=head1 LICENSE AND COPYRIGHT

This software is Copyright (c) 2026 by Torsten Brumm.

This is free software, licensed under:

  The GNU General Public License, Version 2, June 1991

=cut

1;
