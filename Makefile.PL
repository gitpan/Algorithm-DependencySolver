
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Algorithm::DependencySolver - A dependency solver for scheduling access to a shared resource",
  "AUTHOR" => "Colin Horne",
  "BUILD_REQUIRES" => {
    "Test::More" => "0.98"
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Algorithm-DependencySolver",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "Algorithm::DependencySolver",
  "PREREQ_PM" => {
    "Data::Dumper" => "2.139",
    "Graph" => "0.94",
    "Graph::Convert" => "0.09",
    "Graph::Easy" => "0.72",
    "List::Compare" => "0.37",
    "List::MoreUtils" => "0.33",
    "Moose" => "2.0604",
    "MooseX::FollowPBP" => "0.05",
    "MooseX::Method::Signatures" => "0.44"
  },
  "VERSION" => "0.02",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



