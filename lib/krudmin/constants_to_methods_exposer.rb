module Krudmin
  module ConstantsToMethodsExposer
    def constantized_methods(*attrs)
      attrs.flatten.each do |attr|
        define_method(attr) do
          self.class.const_get(attr.upcase)
        end

        define_singleton_method(attr) do
          const_get(attr.upcase)
        end
      end
    end
  end
end
