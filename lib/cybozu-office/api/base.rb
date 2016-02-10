module CybozuOffice
  module Api
    module Base
      SERVICE = "Base"

      # 1.6 BaseGetOrganizationsById
      def base_get_organizations_by_id(ids)
        inner_params = [ ids ].flatten.map{|id| %Q{<organization_id>#{id}</organization_id>}}.join("\n")
        params = <<-EOS
        <parameters>
          #{inner_params}
        </parameters>
        EOS
        request(SERVICE, "BaseGetOrganizationsById", params)
      end

      # 1.8 BaseGetMyGroupsById
      def base_get_my_groups_by_id(ids)
        inner_params = [ ids ].flatten.map{|id| %Q{<my_group_id>#{id}</my_group_id>}}.join("\n")
        params = <<-EOS
        <parameters>
          #{inner_params}
        </parameters>
        EOS
        request(SERVICE, "BaseGetMyGroupsById", params)
      end
    end
  end
end
