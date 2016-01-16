require 'rails_helper'

RSpec.describe Api::V1::TagsController do
  context "with valid data" do
    describe "GET index" do
      it "has status code 200" do
        get :index
        expect(response.status).to eq(200)
      end

      it "returns all tags when not nested" do
        tags = Fabricate.times(3, :tag)
        get :index
        expect(json).to have_key(:data)
        expect(json[:data].count).to eq(3)
      end

      it "returns only given tags when nested" do
        note = Fabricate(:note)
        tag = Fabricate(:tag)
        get :index, note_id: note
        expect(Tag.count).to eq(4)
        expect(json).to eq(TagsSerializer.new(note.tags).to_json)
      end
    end

    describe "GET show" do
      it "returns serialized tag" do
        tag = Fabricate(:tag)
        get :show, id: tag
        expect(json).to eq(TagsSerializer.new(tag).to_json)
      end
    end
  end
end
