module Krudmin
  module Presenters
    class EnumTypeFieldPresenter < BelongsToFieldPresenter
      delegate :associated_options, :enum_value, :enum_text, to: :field

      def render_form
        render_partial(:form, associated_options: associated_options, enum_value: enum_value)
      end

      def render_show
        render_partial(:show, enum_text: enum_text)
      end
    end
  end
end
