require 'spec_helper'

describe BlogPost do
  it { should belong_to :admin_user }

  it 'has a valid factory' do
    FactoryGirl.create(:blog_post).should be_valid
  end
end
