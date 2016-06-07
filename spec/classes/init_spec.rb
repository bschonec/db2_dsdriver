require 'spec_helper'
describe 'db2_dsdriver' do

  context 'with defaults for all parameters' do
    it { should contain_class('db2_dsdriver') }
  end
end
