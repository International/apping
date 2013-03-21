class Site < ActiveRecord::Base
    validates_presence_of :address, :request_type
    validates_inclusion_of :request_type,:in => ["get","post","put","delete"]
    validate :valid_url

    #serialize :request_body, Hash

    before_validation :downcase_request_type
    before_save       :serialize_request_body

    def request_body_casted
        JSON.load(self.request_body) if self.request_body.present?
    end

    def self.decode(data)
        JSON.load(data)
    end

    private
    def downcase_request_type
        self.request_type = self.request_type.downcase if self.request_type
    end 

    def serialize_request_body
        self.request_body = JSON.dump(self.request_body) if(self.request_body_changed? and self.request_body.present?)
    end

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
