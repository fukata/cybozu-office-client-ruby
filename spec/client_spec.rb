describe CybozuOffice::Client do
  context "new client" do
    subject { CybozuOffice::Client.new(opt) }
    context "with non opt" do
      let(:opt) { {} }
      it do
        client = subject
        expect(client).not_to be nil
      end
    end
  end

end
