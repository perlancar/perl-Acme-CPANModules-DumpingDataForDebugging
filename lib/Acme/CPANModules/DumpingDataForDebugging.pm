package Acme::CPANModules::DumpingDataForDebugging;

# AUTHORITY
# DATE
# DIST
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

* Set $Data::Dumper::Useqq to 1.

By default, <pm:Data::Dumper> quotes strings using single-quotes and does not
quote things like "\n" and "\b" making it difficult to spot special characters.


_
        },

        {
            module=>'Data::Dump',
            tags => ['perl'],
            description => <<'_',

A data dumper that produces nicer Perl code output, with features like vertical
alignment of "=>" when dumping hashes, compacting sequences like 1,2,3,4,5,6 to
1..6, compacting repeating characters in string like "ccccccccccccccccccccc" to
("c" x 21), and so on.

It tries harder to produce Perl code that generates the original data structure,
particularly with circular references. But with interlinked references like
trees, Data::Dumper might be more helpful in showing you which references get
mentioned where. For example this data:

    $tree = {children=>[{children=>[{}]}, {children=>[]}]};
    $tree->{children}[0]{parent}=$tree;
    $tree->{children}[1]{parent}=$tree;
    $tree->{children}[0]{children}[0]{parent} = $tree->{children}[0];

Data::Dump will produce:

    do {
       my $a = {
         children => [
          { children => [{ parent => 'fix' }], parent => 'fix' },
          { children => [], parent => 'fix' },
        ],
      };
      $a->{children}[0]{children}[0]{parent} = $a->{children}[0];
      $a->{children}[0]{parent} = $a;
      $a->{children}[1]{parent} = $a;
      $a;
    }

while Data::Dumper will produce:

    $VAR1 = {
              'children' => [
                              {
                                'children' => [
                                                {
                                                  'parent' => $VAR1->{'children'}[0]
                                                }
                                              ],
                                'parent' => $VAR1
                              },
                              {
                                'parent' => $VAR1,
                                'children' => []
                              }
                            ]
            };

_
        },

        {
            module=>'Data::Dump::Color',
            tags => ['perl'],
            description => <<'_',

A modification to Data::Dump which adds color (and color theme) support, as well
as other visual aids like depth and array index/hash pair count indicator. It's
usually my go-to module for debugging.

_
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
            tags => ['perl'],
            description => <<'_',

A nice little dumper module from the creator of YAML. Obviously, it uses YAML
output by default but it's configurable to dump in other formats. For example:

    PERL_XXX_DUMPER=Data::Dump::Color

It's main selling point is that the dumper function returns the original
arguments so the dumping can be done in various places in code, making it more
convenient. More (if not all) dumpers should do this too.

_
        },

        {
            module=>'Data::Printer',
            tags => ['perlish'],
            description => <<'_',

Favorites among many Perl programmers, it sports colors, array index indicator,
as well as nice object dumper showing methods and inheritance information. It's
also very customizable. It uses its own format though, and my preference for
dumping is the Perl format (with additional informations/hints as comments) so
I've never used it in my daily coding activities. I probably should though.

_
        },

        {
            module=>'JSON::Color',
            tags => ['json'],
            description => <<'_',

JSON is a limited format; it cannot represent many things that Perl supports
e.g. globs, circular references, or even ASCII NUL. But if you are working only
with JSON-able data, this JSON dumping module adds color output.

_
        },

        {
            module=>'YAML::Tiny::Color',
            tags => ['yaml'],
            description => <<'_',

_
        },
    ],
};

1;
# ABSTRACT:
