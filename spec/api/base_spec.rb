describe CybozuOffice::Api::Base do
  context "#base_get_organizations_by_id" do
    let(:client) { CybozuOffice::Client.new({}) }
    let(:ids) { 524 }
    let(:mock_response) { CybozuOffice::Response.new("<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:soap=\"http://www.w3.org/2003/05/soap-envelope\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:base=\"http://wsdl.cybozu.co.jp/base/2008\"> <soap:Header> <vendor>Cybozu</vendor> <product>Office</product> <version>10.4.5</version> <apiversion>1.3.0</apiversion> </soap:Header> <soap:Body> <base:BaseGetOrganizationsByIdResponse> <returns><organization key=\"524\" name=\"全営業\" version=\"1415260082\" order=\"1\"> <members xmlns=\"http://schemas.cybozu.co.jp/base/2008\" > <user id=\"175\" /> <user id=\"282\" /> <user id=\"178\" /> <user id=\"202\" /> <user id=\"518\" /> <user id=\"237\" /> <user id=\"264\" /> <user id=\"696\" /> <user id=\"705\" /> <user id=\"745\" /> <user id=\"794\" /> <user id=\"279\" /> </members></organization> </returns> </base:BaseGetOrganizationsByIdResponse> </soap:Body></soap:Envelope>", "Base", "BaseGetOrganizationsById") }
    it do
      expect(client).to receive(:request).and_return(mock_response).at_least(:once)
      res = client.base_get_organizations_by_id(ids)
      user_ids = res.response()['organization'].first['members'].first['user'].map{|v| v['id']}.join(",")
      expect(user_ids).to eq "175,282,178,202,518,237,264,696,705,745,794,279"
    end
  end

  context "#base_get_my_groups_by_id" do
  end
end
