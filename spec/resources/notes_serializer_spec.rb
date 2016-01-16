require 'rails_helper'
include Rails.application.routes.url_helpers

RSpec.describe NotesSerializer do

  describe "#to_json" do

    context "with single note" do
      before(:example) do
        @note = Fabricate(:note)
        @result = NotesSerializer.new(@note).to_json
      end

      it "returns a Hash" do
        expect(@result).to be_a Hash
      end

      it "has a data hash" do
        expect(@result[:data]).to be_a Hash
      end

      it "has attributes in data hash" do
        expect(@result[:data][:attributes]).to be_a Hash
      end

      it "has links pointing to record" do
        expect(@result[:links][:self]).to eq(api_v1_note_url(@note))
      end
    end

    context "with many notes" do
      before(:example) do
        notes = Fabricate.times(3, :note)
        @result = NotesSerializer.new(notes).to_json
      end

      it "adds links" do
        expect(@result).to be_a Hash
        expect(@result[:data]).to be_an Array
      end

      it "has links pointing to index" do
        expect(@result[:links][:self]).to eq(api_v1_notes_url)
      end
    end
  end
end
