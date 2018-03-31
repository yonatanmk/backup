require 'spec_helper'

describe Meetup do
  it { should have_valid(:name).when("Liz") }
  it { should_not have_valid(:name).when(nil, "") }
end
