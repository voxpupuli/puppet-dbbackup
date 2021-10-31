# frozen_string_literal: true

require 'spec_helper_acceptance'

describe 'dbbackup' do
  context 'with a backup server' do
    let(:pp) do
      'include dbbackup'
    end

    it 'works idempotently with no errors' do
      apply_manifest(pp, catch_failures: true)
      apply_manifest(pp, catch_changes: true)
    end

    describe service('dump_databases.timer') do
      it { is_expected.to be_enabled }
      it { is_expected.to be_running }
    end

    describe file('/usr/local/bin/dump_databases') do
      it { is_expected.to be_executable }
    end
  end
end
