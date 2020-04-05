# frozen_string_literal: true

require 'spec_helper'

describe 'postgrey' do
  let(:facts) {
    {
        :os => {
            :family => 'Debian'
        }
    }
  }

  it { should include_class('postgrey::config') }
  it { should include_class('postgrey::service') }
  it { should include_class('postgrey::install') }
end
