require 'spec_helper'

describe 'Mesos master' do
  describe service('mesos-master') do
    it { should be_enabled }
    it { should be_running }
  end

  describe port(5050) do
    it { should be_listening }
  end
end
