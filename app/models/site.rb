class Site < ActiveRecord::Base
    validates_presence_of :address
    validate :valid_url

    private
    def valid_url
        self.errors.add(:address,"Is not a valid URL") unless is_valid_url?        
    end

    def is_valid_url?
        uri = URI.parse self.address
        uri.kind_of? URI::HTTP
    rescue URI::InvalidURIError
        false
    end
end
