RSpec.shared_examples 'a serializer' do

  it "returns a Hash" do
    expect(@result).to be_a Hash
  end

  it "has a data hash" do
    expect(@result[:data]).to be_a Hash
  end

  it "has attributes in data hash" do
    expect(@result[:data][:attributes]).to be_a Hash
  end
end
