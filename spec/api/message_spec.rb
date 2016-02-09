describe CybozuOffice::Api::Message do
  context "#message_create_threads" do
    let(:client) { CybozuOffice::Client.new({}) }
    it do
      expect(client.message_create_threads({})).to eq "message_create_threads"
    end
  end
end
