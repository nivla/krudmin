module Krudmin
  module CrudMessages
    extend ActiveSupport::Concern

    included do
      helper_method :confirm_deactivation_message, :confirm_activation_message, :confirm_destroy_message, :crud_title
      helper_method :activated_message, :deactivated_message, :destroyed_message
      helper_method :edit_title, :new_title
    end

    def confirm_destroy_message(given_model)
      I18n.t("krudmin.messages.confirm_destroy", label: krudmin_manager.model_label(given_model))
    end

    def confirm_activation_message(given_model)
      I18n.t("krudmin.messages.confirm_activation", label: krudmin_manager.model_label(given_model))
    end

    def confirm_deactivation_message(given_model)
      I18n.t("krudmin.messages.confirm_deactivation", label: krudmin_manager.model_label(given_model))
    end

    def edit_title(label = model_label)
      I18n.t("krudmin.messages.edit_record", label: label)
    end

    def new_title(label = resource_label)
      I18n.t("krudmin.messages.new_record", label: label)
    end

    def created_message
      I18n.t("krudmin.messages.created", label: model_label)
    end

    def modified_message
      I18n.t("krudmin.messages.modified", label: model_label)
    end

    def cant_be_activated_message
      I18n.t("krudmin.messages.cant_be_activated", label: model_label)
    end

    def cant_be_deactivated_message
      I18n.t("krudmin.messages.cant_be_deactivated", label: model_label)
    end

    def activated_message
      I18n.t("krudmin.messages.activated", label: model_label)
    end

    def deactivated_message
      I18n.t("krudmin.messages.deactivated", label: model_label)
    end

    def destroyed_message
      I18n.t("krudmin.messages.destroyed", label: model_label)
    end

    def cant_be_destroyed_message
      I18n.t("krudmin.messages.cant_be_destroyed", label: model_label)
    end

    def crud_title
      model.new_record? ? new_title : edit_title
    end
  end
end
