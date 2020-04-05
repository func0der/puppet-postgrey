require 'spec_helper'

describe 'postgrey' do
  it { should include_class('postgrey::config') }
  it { should include_class('postgrey::service') }
  it { should include_class('postgrey::install') }
end
