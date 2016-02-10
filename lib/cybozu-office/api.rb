module CybozuOffice
  module Api
    def make_request_xml(service, method, params)
      time = Time.now
      created = time.strftime('%Y-%m-%dT%H:%M:%SZ')
      time = time + 1
      expires = time.strftime('%Y-%m-%dT%H:%M:%SZ')

      xml = <<-EOS
      <?xml version="1.0" encoding="utf-8"?>
      <soap:Envelope xmlns:soap="http://www.w3.org/2003/05/soap-envelope" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
        <soap:Header>
            <Action soap:mustUnderstand="1" xmlns="http://schemas.xmlsoap.org/ws/2003/03/addressing">#{method}</Action>
            <Timestamp soap:mustUnderstande="1" xmlns="http://schemas.xmlsoap.org/ws/2002/07/utility">
                  <Created>#{created}</Created>
                  <Expires>#{expires}</Expires>
            </Timestamp><Security xmlns:wsu="http://schemas.xmlsoap.org/ws/2002/07/utility" soap:mustUnderstand="1" xmlns="http://schemas.xmlsoap.org/ws/2002/12/secext">
            <UsernameToken>
              <Username>#{@option[:username]}</Username>
              <Password>#{@option[:password]}</Password>
            </UsernameToken>
          </Security>
      </soap:Header>
        <soap:Body>
          <#{method} xmlns="http://wsdl.cybozu.co.jp/base/2008">
            #{params}
          </#{method}>
        </soap:Body>
      </soap:Envelope>
      EOS

      xml.strip
    end

    def request(service, method, params)
      require 'rest-client'
      xml = make_request_xml(service, method, params)
      puts xml if @option[:debug]
      response = RestClient.post @option[:url] + service, xml, :content_type => "application/soap+xml; charset=utf-8; action=\"#{method}\""
      CybozuOffice::Response.new(response, service, method)
    end
  end
end
