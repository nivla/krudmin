module Krudmin
  module Presenters
    class RichTextFieldPresenter < BaseFieldPresenter
      def render_form
        render_partial(:form)
      end

      def render_list
        value and value.html_safe
      end

      alias_method :render_show, :render_list
    end
  end
end
