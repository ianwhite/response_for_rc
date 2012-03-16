require 'resources_controller'
require 'response_for'
require 'response_for_rc/responses_module'
require 'response_for_rc/actions'
require 'response_for_rc/singleton_actions'

if defined? ResourcesController
  ResourcesController.actions = ResponseForRc::Actions
  ResourcesController.singleton_actions = ResponseForRc::SingletonActions
end

# BC
module Ardes
  ResponseForRc = ::ResponseForRc
  RcResponsesModule = ::ResponseForRc::ResponsesModule
end