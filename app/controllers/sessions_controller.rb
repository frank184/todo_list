class SessionsController < Devise::SessionsController
    
    respond_to :js
    
    def new
        self.resource = resource_class.new(sign_in_params)
        clean_up_passwords(resource)
        yield resource if block_given?
        respond_with(resource, serialize_options(resource))
        
        respond_to do |f|
            f.js
        end
    end
end
