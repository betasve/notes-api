require 'rails_helper'

RSpec.describe NotesSerializer do

  describe "#to_json" do

    context "with single note" do
      before(:example) do
        @note = Fabricate(:note)
        @result = NotesSerializer.new(@note).to_json
      end

      it_behaves_like 'a serializer'

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
