# frozen_string_literal: true

sysmon_enabled = input('sysmon_enabled', value: true, description: 'Check Sysmon is configured')

if sysmon_enabled
  title 'Sysmon'
  control 'sysmon-01' do
    title 'Sysmon configuration'
    desc 'Sysmon is configured'
    describe file('C:\ProgramData\chocolatey\lib\sysmon\tools\Sysmon64.exe') do
      it { should be_file }
    end
  end
  control 'sysmon-02' do
    title 'Sysmon service'
    desc 'Sysmon service is configured and running'
    describe service('sysmon64') do
      it { should be_installed }
      it { should be_running }
    end
  end
end
