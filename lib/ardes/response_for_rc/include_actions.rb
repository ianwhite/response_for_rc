module Ardes#:nodoc:
  module ResponseForRc#:nodoc:
    module IncludeActions#:nodoc:
      include Ardes::ResourcesController::IncludeActions
      
      def remove_action(action)
        undef_method action
        remove_response_for action
      end
    end
  end
end