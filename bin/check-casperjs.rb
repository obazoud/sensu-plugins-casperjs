#! /usr/bin/env ruby
#
# check-casperjs
#
# DESCRIPTION:
#   Runs http://casperjs.org/ tests against your servers.
#   Fails with a critical if tests are failing.
#
# OUTPUT:
#   plain-text
#
# PLATFORMS:
#   Linux
#
# DEPENDENCIES:
#   gem: sensu-plugin
#   gem: English
#   phantomjs
#   casperjs
#
# USAGE:
#
# NOTES:
#
# LICENSE:
#   Copyright (c) 2015, Olivier Bazoud, olivier.bazoud@gmail.com
#   Released under the same terms as Sensu (the MIT license); see LICENSE
#   for details.
#

require 'English'
require 'sensu-plugin/check/cli'

class CheckCasperJS < Sensu::Plugin::Check::CLI
  option :tests_dir,
         short: '-d /tmp/dir',
         long: '--tests-dir /tmp/dir',
         required: true

  def run
    results = `casperjs test #{config[:tests_dir]} 2>&1`
    if $CHILD_STATUS.success?
      ok 'Everything operating normally.'
    else
      critical results
    end
  end
end
