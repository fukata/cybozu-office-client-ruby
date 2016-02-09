module CybozuOffice
  class Connection
    def initialize(option)
      @option = option 
      @user = nil
      @error = nil
    end

    def login
      params = %{<parameters xmlns=""><login_name>#{@option.username}</login_name></parameters>}
      response = get(LOGIN_SERVICE, LOGIN_METHOD, params)

      if response
        doc = REXML::Document.new(response)
        elem = doc.elements['soap:Envelope/soap:Body/base:BaseGetUsersByLoginNameResponse/returns/user']
        id = elem.attributes['key']
        name = elem.attributes['name']
        @user = User.new(id, name)
      end

      return @user
    end
  end
end
