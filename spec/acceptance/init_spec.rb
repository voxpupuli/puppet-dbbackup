# frozen_string_literal: true

require 'spec_helper_acceptance'

describe 'dbbackup' do
  let(:date) { Time.now.strftime('%Y-%m-%d') }

  context 'with basic params' do
    let(:backup_dir) { "/var/test/dumps/#{date}" }
    let(:pp) do
      'include dbbackup'
    end

    it 'applies without errors' do
      apply_manifest(pp, catch_failures: true)
    end

    it 'applies idempotently' do
      apply_manifest(pp, catch_changes: true)
    end

    describe service('dump_databases.timer') do
      it { is_expected.to be_enabled }
      it { is_expected.to be_running }
    end

    describe file('/usr/local/bin/dump_databases') do
      it { is_expected.to be_executable }
    end

    it 'runs the backup script successfully' do
      # Run the script manually to ensure backups are created for the test
      result = shell('/usr/local/bin/dump_databases')
      expect(result.exit_code).to eq(0)
      expect(result.stdout).to match(%r{dumping mysql})
      expect(result.stdout).to match(%r{dumping postgres})
    end

    it 'creates mysql backup files' do
      # This check is inside an 'it' block, so `backup_dir` is available.
      expect(command("ls #{backup_dir}/*.mysql.gz").exit_status).to eq(0)
    end

    it 'creates postgresql backup files' do
      expect(command("ls #{backup_dir}/*.psql.gz").exit_status).to eq(0)
    end
  end

  context 'with custom params' do
    let(:backup_custom_dir) { "/var/dumps/#{date}" }
    let(:pp) do
      "class { 'dbbackup':
        destination => '/var/dumps'
      }"
    end

    it 'applies without errors' do
      apply_manifest(pp, catch_failures: true)
    end

    it 'applies idempotently' do
      apply_manifest(pp, catch_changes: true)
    end

    describe service('dump_databases.timer') do
      it { is_expected.to be_enabled }
      it { is_expected.to be_running }
    end

    describe file('/usr/local/bin/dump_databases') do
      it { is_expected.to be_executable }
    end

    it 'runs the backup script successfully with custom params' do
      # Run the script manually to ensure backups are created for the test
      result = shell('/usr/local/bin/dump_databases')
      expect(result.exit_code).to eq(0)
      expect(result.stdout).to match(%r{dumping mysql})
      expect(result.stdout).to match(%r{dumping postgres})
    end

    it 'creates mysql backup files in the custom directory' do
      expect(command("ls #{backup_custom_dir}/*.mysql.gz").exit_status).to eq(0)
    end

    it 'creates postgresql backup files in the custom directory' do
      expect(command("ls #{backup_custom_dir}/*.psql.gz").exit_status).to eq(0)
    end
  end
end
