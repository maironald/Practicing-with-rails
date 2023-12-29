module Visible
    extend ActiveSupport::Concern
    VALID_STATUSES = ['public', 'private', 'archived']
    # following by https://api.rubyonrails.org/v7.1.2/classes/ActiveSupport/Concern.html ( to create code as below)
    included do
        validates :status, inclusion: {in: VALID_STATUSES}
    end

    class_methods do 
        def public_count
            where(status: "public").count
        end
    end

    def archived?
        status == "archived"
    end
end