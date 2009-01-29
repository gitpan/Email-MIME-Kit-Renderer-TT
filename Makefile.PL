
use strict;
use warnings;

use ExtUtils::MakeMaker;

WriteMakefile(
  DISTNAME  => 'Email-MIME-Kit-Renderer-TT',
  NAME      => 'Email::MIME::Kit::Renderer::TT',
  AUTHOR    => 'Ricardo\ SIGNES\ \<rjbs\@cpan\.org\>',
  ABSTRACT  => 'render parts of your mail with Template-Toolkit',
  VERSION   => '0.001',
  EXE_FILES => [ qw() ],
  (eval { ExtUtils::MakeMaker->VERSION(6.21) } ? (LICENSE => 'perl') : ()),
  PREREQ_PM    => {
    "Email::MIME::Kit" => '2',
    "Template" => '2',
  },
);
