require 'spec_helper'

describe Aadress do

  let(:user) { FactoryGirl.create(:user) }
  before { @aadress = user.aadresses.build(maja: "Lorem ipsum") }

  subject { @aadress }

  it { should respond_to(:maja) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should eq user }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @aadress.user_id = nil }
    it { should_not be_valid }
  end

  describe "with blank maja" do
    before { @aadress.maja = " " }
    it { should_not be_valid }
  end

  describe "with maja that is too long" do
    before { @aadress.maja = "a" * 141 }
    it { should_not be_valid }
  end
end