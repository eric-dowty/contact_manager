require 'rails_helper'

RSpec.describe "phone_numbers/index", type: :view do
  before(:each) do
    assign(:phone_numbers, [
      PhoneNumber.create!(
        :number => "1112223333",
        :person_id => 1
      ),
      PhoneNumber.create!(
        :number => "4445556666",
        :person_id => 1
      )
    ])
  end

  # it "renders a list of phone_numbers" do
  #   render
  #   assert_select "tr>td", :text => "1112223333".to_s, :count => 2
  #   assert_select "tr>td", :text => 1.to_s, :count => 2
  # end

end
