package Acme::CPANModules::DumpingDataForDebugging;

# DATE
# VERSION

our $LIST = {
    summary => 'Some modules and tips when dumping data structures for debugging',
    description => <<'_',

This list catalogs some of the modules you can you to dump your data structures
for debugging purposes, so the modules will be judged mostly by the
appropriateness of its output for human viewing (instead of other criteria like
speed, footprint, etc).

_
    entries => [
        {
            module=>'Data::Dumper',
            tags => ['perl'],
            description => <<'_',

Everybody knows this module and it's core so sometimes it's the only appropriate
choice. However, the default setting is not really optimized for viewing by
human. I suggest you tweak these before dumping your data:

* Set $Useqq to 1.

By default, <pm:Data::Dumper> quotes strings using single-quotes


_
        },

        {
            module=>'Data::Dump',
            tags => ['perl'],
        },
        {
            module=>'Data::Dump::Color',
            tags => ['perl'],
        },
        {
            module=>'Data::Dmp',
            tags => ['perl'],
        },
        {
            module=>'Data::Dumper::Compact',
            tags => ['perl'],
            description => <<'_',

A relatively recent module by MSTROUT. I will need to use this more to see if I
really like the output, but so far I do.

_
        },

        {
            module=>'XXX',
        },

        {
            module=>'Data::Printer',
            tags => ['perlish'],
        },

        {
            module=>'JSON::PP',
            tags => ['json'],
        },
        {
            module=>'JSON::Color',
            tags => ['json'],
        },
    ],
};

1;
# ABSTRACT:
