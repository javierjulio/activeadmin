require 'active_admin/filters/active'

module ActiveAdmin
  module Filters
    class ActiveSidebar < ActiveAdmin::SidebarSection

      def initialize
        super I18n.t("active_admin.search_status.headline"), sidebar_options
      end

      def block
        -> do
          active_filters = ActiveAdmin::Filters::Active.new(active_admin_config, assigns[:search])
          para do
            if current_scope
              span I18n.t("active_admin.search_status.current_scope")
              b scope_name(current_scope), class: 'current_scope_name'
            end
          end
          div I18n.t("active_admin.search_status.current_filters") do
            ul do
              if active_filters.filters.blank?
                li I18n.t("active_admin.search_status.no_current_filters")
              else
                active_filters.filters.each do |filter|
                  li filter.html_options do
                    span do
                      text_node filter.label
                    end
                    b do
                      text_node filter.values.map { |v| pretty_format(v) }.to_sentence.html_safe
                    end
                  end
                end
              end
            end
          end
        end
      end

      protected

      def sidebar_options
        { only: :index, if: -> { active_admin_config.current_filters_enabled? && (params[:q] || params[:scope]) } }
      end

    end
  end
end
