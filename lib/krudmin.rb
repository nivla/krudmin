require "krudmin/engine"
require "hamlit"
require "krudmin/activable_labeler"
require "krudmin/navigation_menu"
require "krudmin/navigation_menu/node"
require "krudmin/search_form"
require "krudmin/app_router"
require_relative "config"
require "krudmin/resource_managers/base"
require "krudmin/resource_managers/routing"
require "krudmin/fields/base"
require "krudmin/fields/string"
require "krudmin/fields/hidden"
require "krudmin/fields/text"
require "krudmin/fields/rich_text"
require "krudmin/fields/number"
require "krudmin/fields/date"
require "krudmin/fields/date_time"
require "krudmin/fields/boolean"
require "krudmin/fields/associated"
require "krudmin/fields/belongs_to"
require "krudmin/fields/has_many"
require "krudmin/fields/has_many_ids"
require "krudmin/fields/has_one"
require "krudmin/fields/belongs_to_one"
require "krudmin/fields/enum_type"
require "krudmin/fields/currency"
require "krudmin/fields/decimal"
require "krudmin/fields/email"
require "krudmin/fields/inflector"
require "krudmin/action_buttons/base"
require "krudmin/action_buttons/model_action_button"
require "krudmin/action_buttons/cancel_button"
require "krudmin/action_buttons/show_button"
require "krudmin/action_buttons/edit_button"
require "krudmin/action_buttons/save_button"
require "krudmin/action_buttons/new_button"
require "krudmin/action_buttons/search_button"
require "krudmin/action_buttons/link_button"
require "krudmin/toolbar"
require "krudmin/params_parser"
require "krudmin/list_action_panel"
require "krudmin/action_buttons/active_button"
require "krudmin/action_buttons/destroy_button"
require "krudmin/mutation_handlers/action_dispatcher"
require "krudmin/mutation_handlers/action_result_message"
require "krudmin/mutation_handlers/create_handler"
require "krudmin/mutation_handlers/update_handler"
require "krudmin/mutation_handlers/form_context_update"
require "krudmin/mutation_handlers/modal_form_context_update"
require "krudmin/mutation_handlers/destroy_handler"
require "krudmin/mutation_handlers/switch_on_handler"
require "krudmin/mutation_handlers/switch_off_handler"

module Krudmin
  def self.config(&block)
    if block_given?
      Krudmin::Config.with(&block)
    else
      Krudmin::Config
    end
  end
end
