describe CybozuOffice::Api do
  context "encode_xml_str" do
    subject { client.encode_xml_str(text) }
    let(:client) { CybozuOffice::Client.new({}) }
    context "line break with text" do
      let(:text) { "a\nb" }
      it do
        expect(subject).to eq 'a&#xD;&#xA;b'
      end
    end
    context "already encoded line break with text" do
      let(:text) { "a&#xD;&#xA;b" }
      it do
        expect(subject).to eq 'a&#xD;&#xA;b'
      end
    end
    context "need escaped characters" do
      let(:text) { "a<hoge>b" }
      it do
        expect(subject).to eq 'a&lt;hoge&gt;b'
      end
    end

  end

end
