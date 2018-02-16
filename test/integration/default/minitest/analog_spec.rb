require 'minitest/autorun'

describe 'Winning' do

  it "should exist" do
    assert File.exists?("/usr/bin/analog")
  end

  it "should be executable" do
    assert File.executable?("/usr/bin/analog")
  end
end
