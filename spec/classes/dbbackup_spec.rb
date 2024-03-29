# frozen_string_literal: true

require 'spec_helper'

describe 'dbbackup' do
  let :node do
    'postgres01.example.com'
  end

  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let :facts do
        facts
      end

      context 'with all defaults' do
        it { is_expected.to compile.with_all_deps }
        it { is_expected.to contain_file('/usr/local/bin/dump_databases') }
        it { is_expected.to contain_systemd__unit_file('dump_databases.service') }
        it { is_expected.to contain_systemd__unit_file('dump_databases.timer') }
        it { is_expected.to contain_service('dump_databases.timer') }
        it { is_expected.not_to contain_package('pigz') }
      end

      context 'with managed deps' do
        let :params do
          {
            manage_dependencies: true
          }
        end

        it { is_expected.to compile.with_all_deps }
        it { is_expected.to contain_package('pigz') }
      end
    end
  end
end
