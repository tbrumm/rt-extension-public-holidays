# RT::Extension::PublicHolidays

Display global public holidays in Request Tracker dashboards and on the RT login page.

## Description

`RT::Extension::PublicHolidays` adds a compact public-holiday widget to Request Tracker.

The extension can display current and upcoming public holidays from around the world in two places:

- RT dashboards
- A small area on the RT login page

This is useful for support teams, service desks, global operations teams, and organizations that need quick visibility into public holidays across multiple countries or regions.

## Screenshots

### Login Page 

![RT Public Holidays Login](images/Login.png)

### Dashboard Widget

![RT Public Holidays Dashboard](images/Widget.png)

## RT Version

Tested with:

- RT 6.0.x

## Installation

Install the extension using the standard RT extension installation process:

```bash
perl Makefile.PL
make
make install
```

Depending on your RT installation, `make install` may require root permissions:

```bash
sudo make install
```

## Enable the Extension

Edit your RT site configuration file:

```bash
/opt/rt6/etc/RT_SiteConfig.pm
```

Add the plugin line:

```perl
Plugin('RT::Extension::PublicHolidays');
```

Save the file.

## Clear the Mason Cache

After installing and enabling the extension, clear the RT Mason cache:

```bash
rm -rf /opt/rt6/var/mason_data/obj
```

## Restart the Web Server

Restart your web server or RT application service.

For example, depending on your setup:

```bash
systemctl restart apache2
```

or:

```bash
systemctl restart httpd
```

or, if you are using a standalone PSGI/RT service:

```bash
systemctl restart rt-server
```

## Configuration

Configuration options will be documented in a future release.

## Usage

After installation and activation, the extension provides:

- a dashboard widget for displaying public holidays
- a compact public-holiday display area on the RT login page

Add the widget to an RT dashboard through the regular dashboard configuration interface.

## Troubleshooting

### The widget does not appear

Check the following:

1. Confirm that the plugin is enabled in `RT_SiteConfig.pm`:

```perl
Plugin('RT::Extension::PublicHolidays');
```

2. Clear the Mason cache:

```bash
rm -rf /opt/rt6/var/mason_data/obj
```

3. Restart the web server or RT service.

4. Check the RT log files for loading or permission errors.

### RT does not start after enabling the plugin

Verify that the extension was installed into the same Perl environment used by your RT installation.

You can test whether Perl can load the module with:

```bash
perl -MRT::Extension::PublicHolidays -e 'print "OK\n"'
```

If this fails, reinstall the extension using the Perl environment used by RT.

## Author

Torsten Brumm  
Website: https://www.systemaniacs.de/  
Email: technik@picturepunxx.de

## License and Copyright

This library is free software; you can redistribute it and/or modify it under the same terms as Perl itself.
