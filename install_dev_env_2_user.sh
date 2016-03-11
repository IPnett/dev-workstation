#!/bin/bash -e

prepare_ruby() {
  ruby-install -j --no-reinstall ruby 2.1.8

  source /usr/local/share/chruby/chruby.sh
  chruby
  chruby ruby

  gem install bundler
  gem list
}

prepare_ruby


echo "
Ruby setup for Puppet dev:
--------------------------

  1. Add the following to your ~/.bashrc or ~/.zshrc file:

    source /usr/local/share/chruby/chruby.sh

  2. Switch from system ruby to this dev env with:

    chruby
    chruby ruby
    chruby

  Notice the dot after the last commad above, this shows what's currently
  active.

  3. In a project that has a Gemfile, you can now generally do:

    mkdir vendor
    export GEM_HOME=vendor
    bundle install

  And list installed gems for that project with

    bundle exec gem list
"
