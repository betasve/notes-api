require 'rails_helper'

RSpec.describe Api::V1::TagsController do
  render_views

  context "with valid data" do
    before(:example) do
      set_content_type
    end

    describe "GET index" do
      it "has status code 200" do
        get :index, format: :json
        expect(response.status).to eq(200)
      end

      it "returns all tags when not nested" do
        tags = Fabricate.times(3, :tag)
        get :index, format: :json
        expect(jdata).to have_key(:data)
        expect(jdata[:data].count).to eq(3)
      end
    end

    describe "GET show" do
      it "returns serialized tag" do
        tag = Fabricate(:tag)
        get :show, id: tag, format: :json
        expect(jdata).to eq(TagsSerializer.new(tag).to_json)
      end
    end
  end
end
