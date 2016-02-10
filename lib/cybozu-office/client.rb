module CybozuOffice
  class Client
    include Api
    include Api::Base
    include Api::Message

    def initialize(option={})
      @option = option
      @option[:url] ||= ENV['CYBOZU_OFFICE_URL'] + "?page=PApi"
      @option[:username] ||= ENV['CYBOZU_OFFICE_USERNAME']
      @option[:password] ||= ENV['CYBOZU_OFFICE_PASSWORD']
      puts @option if @option[:debug]
    end
  end
end
