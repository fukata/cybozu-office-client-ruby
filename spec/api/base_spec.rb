describe CybozuOffice::Api::Base do
  context "#base_get_my_groups_by_id" do
    let(:client) { CybozuOffice::Client.new({}) }
    it do
      expect(client.base_get_my_groups_by_id({})).to eq "base_get_my_groups_by_id"
    end
  end
end
