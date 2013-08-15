require 'spec_helper'

describe Task do
  it { should belong_to(:project) }

  subject { FactoryGirl.create(:task) }
  it { should validate_uniqueness_of(:name).scoped_to(:project_id) }
end
