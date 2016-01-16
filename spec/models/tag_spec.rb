require 'rails_helper'

RSpec.describe Tag do
  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe "relations" do
    it { is_expected.to have_and_belong_to_many(:notes) }
  end
end
