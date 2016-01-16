RSpec.shared_examples 'JSON endpoint' do |status_code|

  it "has a #{status_code} status code" do
    expect(response.status).to eq(status_code)
  end

  it "returns attributes for the record" do
    expect(json[:data][:attributes]).to have_key(:title)
    expect(json[:data][:attributes]).to have_key(:body)
  end

  it "returns the right attribute values for the record" do
    expect(json[:data][:attributes][:title]).to eq(@note.title)
    expect(json[:data][:attributes][:body]).to eq(@note.body)
  end
end
