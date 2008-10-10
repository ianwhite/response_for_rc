module Ardes#:nodoc:
  module ResponseForRc#:nodoc:
    # singleton actions using response_for
    module SingletonActions
      extend Ardes::RcResponsesModule
            
      include Ardes::ResponseForRc::Actions
      
      undef_method :index
      
      remove_response_for :index, :destroy
      
      response_for :destroy, :types => [:js, :xml] do |format|
        format.html do
          flash[:notice] = "#{resource_name.humanize} was successfully destroyed."
          redirect_to enclosing_resource_url if enclosing_resource
        end
      end
    end
  end
end