require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe User do

  it { should have_many(:items) }

end
