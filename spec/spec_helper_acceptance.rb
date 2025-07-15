# frozen_string_literal: true

# Managed by modulesync - DO NOT EDIT
# https://voxpupuli.org/docs/updating-files-managed-with-modulesync/

require 'voxpupuli/acceptance/spec_helper_acceptance'
require 'beaker-puppet'

configure_beaker(modules: :fixtures)

Dir['./spec/support/acceptance/**/*.rb'].sort.each { |f| require f }

hosts.each do |host|
  # fix for arch distros
  host.add_env_var('LC_ALL', 'C.UTF-8')

  # configure hiera on SUT
  proj_root = File.expand_path(File.join(File.dirname(__FILE__), '..'))
  fixture_path = File.expand_path(File.join(proj_root, 'spec', 'fixtures'))
  hieradata = File.join(fixture_path, 'hiera', 'hieradata', 'common.yaml')
  hiera_conf = File.join(fixture_path, 'hiera', 'hiera.yaml')
  scp_to(host, hiera_conf, '/etc/puppetlabs/puppet/hiera.yaml')
  on(host, 'mkdir -p /etc/puppetlabs/puppet/hieradata')
  scp_to(host, hiera_conf, '/etc/puppetlabs/puppet/hiera.yaml')
  scp_to(host, hieradata, '/etc/puppetlabs/puppet/hieradata/common.yaml')

  # install mysql and postgresql modules
  on host, puppet('module install puppetlabs-mysql')
  on host, puppet('module install puppetlabs-postgresql')

  on(host, 'mkdir -p /var/test')

  # create mysqlDB and psqlDB on node
  pp = %(
    include mysql::server
    include postgresql::server
  )

  apply_manifest_on(host, pp, catch_failures: true)
end
