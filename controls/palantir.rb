# frozen_string_literal: true

palantir_files = input('palantir_files', value: true, description: 'Check Palantir configuration files are present')

if palantir_files
  title 'Palantir files & configuration'
  control 'palantir-01' do
    title 'Palantir windows-event-forwarding files check'
    desc 'Ensure Palantir windows-event-forwarding files are present'
    describe file('c:\Program Files\windows-event-forwarding') do
      it { should be_directory }
    end
    describe file('c:\Program Files\windows-event-forwarding\AutorunsToWinEventLog\Install.ps1') do
      it { should be_file }
    end
  end
  control 'palantir-02' do
    title 'Scheduled Task'
    desc 'AutorunsToWinEventLog scheduled task is configured'
    describe windows_task('AutorunsToWinEventLog') do
      it { should be_enabled }
    end
  end
end
