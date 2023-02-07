#!/usr/bin/env perl

use 5.018;
use strict;
use warnings;
use PPI::Find;
use PPI::Document;
use PPI::Dumper;
use Data::Dumper;

sub main {
    my $file  = $ARGV[0];

    if ($file) {
        my $document = PPI::Document -> new($file);
        my $dumper   = PPI::Dumper -> new($document);
        
        $document -> prune("PPI::Token::Pod");
        $document -> prune("PPI::Token::Comment");

        $dumper -> print();

        foreach my $token (@{$document -> find("PPI::Token")}) {
            # print $token -> class() . "-> " . $token -> content() . "\n";

            if ($token -> class() eq "PPI::Statement") {
                # print $token -> content();
            }


            # PPI::Token::Word             -> syntax
            # if have "PPI::Token::Symbol" -> variable
            #    - verify hard coded credentials
            #    - verify if this is present in a string (PPI::Token::Quote::Double)

            # PPI::Token::Quote::Double     -> string -> need run AST again
        }
    }

    return 0;
} 

main();