require 'spec_helper'

describe "AadressPages" do
  describe "GET /aadress_pages" do
    subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "aadressi loomine" do
    before { visit root_path }

    describe "with invalid information" do

      it "should not create aa aadress" do
        expect { click_button "Post" }.not_to change(Aadress, :count)
      end

      describe "error messages" do
        before { click_button "Post" }
        it { should have_content('error') }
      end
    end

    describe "with valid information" do

      before { fill_in 'aadress_maja', with: "Lorem ipsum" }
      it "should create an aadress" do
        expect { click_button "Post" }.to change(Aadress, :count).by(1)
      end
    end
  end
end
