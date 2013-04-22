## Debian Wheezy countdown banners

This is a set of SVG specially crafted banners for displaying a countdown to
Debian Wheezy release. The graphics are based on Wheezy's default theme, Joy, by
Adrien Aubourg.

Theme link: http://wiki.debian.org/DebianArt/Themes/Joy

### Update

I made some adjustments and now the script can be used like this:

    for i in `ls -1 svg/*.svg`; do
        ./countdown.sh $i
    done

This will generate the corresponding PNG files out of the SVG sources and put 
them in the './png/' directory (tune accordingly).

Also, I added a sample cron script I use for FTP upload and some downsizing of 
the resulted PNG file (modify to suit your own needs).

#### Changing the numbers

I have included a sample script that uses nothing but standard GNU utilities to
change the values used in the countdown. One can easily adjust it to read new
numbers from other sources than user input, for example Debian UDD queries.

**Important note:** The SVG files have a specific id for indicating the field
containing the numbers. The ID was assigned via Inkscape during editing, and it
should be preserved across further modifications done in the same software. I
have not tested it though, and it may be the source of a problem, so be sure to
check for them in case the script stops working.

The special IDs used for the countdown values are following the pattern:
`countdown-(RC|days)_(portrait|landscape)`. I checked for any ID starting with
the string 'countdown' in my script, so it can be used to alter any file from
the batch, but it can be tuned to alter only the portrait files, or only the
RC-related ones, maybe due to some separation of data sources.

#### Samples

<img src="http://debian.org.ro/uploads/wheezy-countdown/png/days_portrait.png">
<img src="http://debian.org.ro/uploads/wheezy-countdown/png/days_landscape.png">

#### Credits

The theme used for inspiration is created by Adrien Aubourg as a submission in
the Debian theme contest that happened before Wheezy entered freeze. The
files I created contain elements from the CD art designed in the theme.

Special thanks go to Adrian Hada for supporting my whining while writing the
replacement script for this :-)
