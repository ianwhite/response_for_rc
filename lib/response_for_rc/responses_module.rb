module ResponseForRc
  # Just like ResponseFor::ResponsesModule, but also handles the :except, :only options
  module ResponsesModule
    include ResourcesController::IncludeActions
    
    def self.extended(mixin)
      mixin.extend ResponseFor::ResponsesModule
    end
    
    # as well as undefing an exlcuded action from the dup mixin, we
    # also remove its response
    def remove_action_method(action)
      undef_method action
      remove_response_for action
    end
    
    # when we clone, we need to copy our action_responses
    def clone
      c=super
      c.instance_variable_set('@action_responses', action_responses.clone)
      c
    end    
  end
end