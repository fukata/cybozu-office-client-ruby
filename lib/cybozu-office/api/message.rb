module CybozuOffice
  module Api
    module Message
      SERVICE = "Message"

      # 1.5 MessageCreateThreads
      def message_create_threads(opt)
        require 'base64'

        addressee_xml = opt[:user_ids].map{|id| %Q{<addressee xmlns="http://schemas.cybozu.co.jp/message/2008" user_id="#{id}" deleted="false" confirmed="false"/>}}.join("\n") if opt[:user_ids]
        file_content_xml = opt[:files].each_with_index.map do |file,i|
          %Q{<file id="attached#{i}" name="#{File::basename(file)}" mime_type="appliaction/octet-stream"/>}
        end.join("\n") if opt[:files]
        file_xml = opt[:files].each_with_index.map do |file,i|
          %Q{<file id="attached#{i}"><content>#{Base64.encode64(File.binread(file))}</content></file>}
        end.join("\n") if opt[:files]
       
        content_xml = %Q{<content xmlns="http://schemas.cybozu.co.jp/message/2008"}
        content_xml << %Q{ body="#{opt[:body]}"}
        content_xml << %Q{ html_body="#{opt[:html_body]}"} if opt.key?(:html_body)
        content_xml << %Q{>}
        content_xml << file_content_xml.to_s 
        content_xml << %Q{</content>}

        params = <<-EOS
        <parameters xmlns="">
          <create_thread>
            <thread
              id="dummy"
              version="999999"
              subject="#{opt[:subject]}"
              confirm="#{opt[:confirm] == true}"
              is_draft="#{opt[:is_draft] == true}">
              #{addressee_xml}
              #{content_xml}
            </thread>
            #{file_xml}
          </create_thread>
        </parameters>
        EOS
        request(SERVICE, "MessageCreateThreads", params)
      end
    end
  end
end
