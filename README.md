# RT::Extension::PublicHolidays - Display global Public Holidays in RT

## DESCRIPTION
    This extension add a Widget for your Dashboards and also a tiny Area
    on your RTs Login Page displaying actual public holidays around the world

## RT VERSION
    Works with RT 6.0

## INSTALLATION
```bash
    perl Makefile.PL
    make
    make install
        May need root permissions

    Edit your /opt/rt6/etc/RT_SiteConfig.pm
        Add this line to your /opt/rt6/etc/RT_SiteConfig.pm:

            Plugin('RT::Extension::PublicHolidays');

    Clear your mason cache
            rm -rf /opt/rt6/var/mason_data/obj

    Restart your webserver
```

## CONFIGURATION
    Will be explained later...

## AUTHOR
    Torsten Brumm https://www.systemaniacs.de/ <technik@picturepunxx.de>

## LICENSE AND COPYRIGHT
    This library is free software; you can redistribute it and/or modify it
    under the same terms as Perl itself.

