package Email::MIME::Kit::Renderer::TT;
our $VERSION = '0.091870';

use Moose;
with 'Email::MIME::Kit::Role::Renderer';
# ABSTRACT: render parts of your mail with Template-Toolkit

use Template;

# XXX: _include_path or something
# XXX: we can maybe default to the kit dir if the KitReader is Dir

sub render {
  my ($self, $input_ref, $stash) = @_;
  $stash ||= {};

  my $output;
  $self->tt->process($input_ref, $stash, \$output)
    or die $self->tt->error;

  return \$output;
}

has eval_perl => (
  is  => 'ro',
  isa => 'Bool',
  default => 0,
);

has tt => (
  isa  => 'Template',
  lazy => 1,
  accessor => '_tt',
  init_arg => undef,
  default  => sub {
    Template->new({
      ABSOLUTE  => 0,
      RELATIVE  => 0,
      EVAL_PERL => $_[0]->eval_perl,
    });
  },
);

sub tt {
  my $self = shift;
  return $self->_tt || $self->_tt(Template->new({
    ABSOLUTE => 1,
    RELATIVE => 1,
    INCLUDE_PATH => $self->_include_path_ref,
  }));
}

1;

__END__

=pod

=head1 NAME

Email::MIME::Kit::Renderer::TT - render parts of your mail with Template-Toolkit

=head1 VERSION

version 0.091870

=head1 AUTHOR

  Ricardo SIGNES <rjbs@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2009 by Ricardo SIGNES.

This is free software; you can redistribute it and/or modify it under
the same terms as perl itself.

=cut 


