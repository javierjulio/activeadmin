module ActiveAdmin
  module Views
    class Tabs < ActiveAdmin::Component
      builder_method :tabs

      def tab(title, options = {}, &block)
        title = title.to_s.titleize if title.is_a? Symbol
        @menu << build_menu_item(title, options, &block)
        @tabs_content << build_content_item(title, options, &block)
      end

      def build(&block)
        @menu = ul(class: 'nav nav-tabs', role: "tablist")
        @tabs_content = div(class: 'tab-content')
        @id_prefix = Time.current.to_i.to_s
        @is_first_item = true
      end

      def build_menu_item(title, options, &block)
        fragment = @id_prefix + options.fetch(:id, title.parameterize)
        li { link_to title, "##{fragment}", data: { toggle: "tab" } }
      end

      def build_content_item(title, options, &block)
        fragment = @id_prefix + options.fetch(:id, title.parameterize)
        classes = [ 'tab-pane' ]
        classes << 'active' if @is_first_item
        @is_first_item = false
        options = options.reverse_merge(id: fragment, class: classes.join(' '))
        div(options, &block)
      end
    end
  end
end
