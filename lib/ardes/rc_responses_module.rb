module Ardes
  # Just like ResponsesModule, but also handles the :except, :only stuff
  module RcResponsesModule
    include Ardes::ResponsesModule
    include Ardes::ResourcesController::IncludeActions
    
    # as well as undefing an exlcuded action from the dup mixin, we
    # also remove it's response
    def remove_action(action)
      undef_method action
      remove_response_for action
    end    
  end
end