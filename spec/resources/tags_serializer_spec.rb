require 'rails_helper'
include Rails.application.routes.url_helpers

RSpec.describe TagsSerializer do

  describe "#to_json" do
    context "with single note" do
      before(:example) do
        @tag = Fabricate(:tag)
        @result = TagsSerializer.new(@tag).to_json
      end

      it_behaves_like 'a serializer'

      it "has links pointing to record" do
        expect(@result[:links][:self]).to eq(api_v1_tag_url(@tag))
      end
    end

    context "with many notes" do
      before(:example) do
        tags = Fabricate.times(3, :tag)
        @result = TagsSerializer.new(tags).to_json
      end

      it "adds links" do
        expect(@result).to be_a Hash
        expect(@result[:data]).to be_an Array
      end

      it "has links pointing to index" do
        expect(@result[:links][:self]).to eq(api_v1_tags_url)
      end
    end
  end
end
