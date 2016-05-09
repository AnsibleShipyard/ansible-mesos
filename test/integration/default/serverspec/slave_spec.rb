require 'spec_helper'

describe 'Mesos slave' do
  describe service('mesos-slave') do
    it { should be_enabled }
    it { should be_running }
  end

  describe port(5051) do
    it { should be_listening }
  end
end
