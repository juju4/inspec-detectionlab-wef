# frozen_string_literal: true

splunk_enabled = input('splunk_enabled', value: true, description: 'Check Splunk Forwarder is configured')

if splunk_enabled
  title 'Splunk Forwarder'
  control 'splunk-01' do
    title 'Splunk configuration'
    desc 'Splunk Forwarder is configured'
    describe file('C:\Program Files\SplunkUniversalForwarder\etc\apps\SplunkUniversalForwarder\local\inputs.conf') do
      it { should be_file }
    end
  end
  control 'splunk-02' do
    title 'Splunk service'
    desc 'Splunk Forwarder service is configured and running'
    describe service('SplunkForwarder') do
      it { should be_installed }
      it { should be_running }
    end
  end
end
