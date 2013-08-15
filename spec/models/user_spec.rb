require 'spec_helper'

describe User do
  it { should have_many(:projects) }
  it { should have_many(:tasks)    }
end
