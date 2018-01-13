require_relative 'attribute'
require_relative 'attribute_collection'

module Krudmin
  module ResourceManagers
    class Base
      include Enumerable

      delegate :each, :total_pages, :current_page, :limit_value, to: :items

      MODEL_CLASSNAME = nil
      LISTABLE_ATTRIBUTES = []
      EDITABLE_ATTRIBUTES = []
      SEARCHABLE_ATTRIBUTES = []
      LISTABLE_ACTIONS = [:show, :edit, :destroy]
      ORDER_BY = []
      LISTABLE_INCLUDES = []
      RESOURCE_INSTANCE_LABEL_ATTRIBUTE = nil
      RESOURCE_LABEL = ""
      RESOURCES_LABEL = ""
      ATTRIBUTE_TYPES = {}
      PRESENTATION_METADATA = {}

      def self.constantized_methods(*attrs)
        attrs.flatten.each do |attr|
          define_method(attr) do
            self.class.const_get(attr.upcase)
          end
        end
      end

      constantized_methods :searchable_attributes, :resource_label, :resources_label, :model_classname, :listable_attributes, :editable_attributes, :listable_actions, :order_by, :listable_includes, :resource_instance_label_attribute, :presentation_metadata

      def field_for(field, model = nil, root: nil)
        resource_attributes.attribute_for(field, root).new_field(model)
      end

      def model_label(given_model)
        given_model.send(resource_instance_label_attribute)
      end

      def self.editable_attributes
        new.editable_attributes
      end

      def label_for(given_model)
        given_model.send(resource_instance_label_attribute)
      end

      def items
        @items ||= list_scope
      end

      def scope
        model_class.all
      end

      def list_scope
        scope.includes(listable_includes).order(order_by)
      end

      def model_class
        @model_class ||= model_classname.constantize
      end

      def self.model_class
        self::MODEL_CLASSNAME.constantize
      end

      private

      delegate :attribute_types, :permitted_attributes, :editable_attributes, :grouped_attributes, to: :resource_attributes

      def resource_attributes
        @resource_attributes ||= Krudmin::ResourceManagers::AttributeCollection.new(
                                                self.class::ATTRIBUTE_TYPES,
                                                self.class::EDITABLE_ATTRIBUTES,
                                                self.class::PRESENTATION_METADATA)
      end
    end
  end
end
