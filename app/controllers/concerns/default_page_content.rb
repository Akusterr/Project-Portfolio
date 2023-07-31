module DefaultPageContent
     extend ActiveSupport::Concern

    included do 
        before_action :set_title
    end
    def set_title 
        @page_title = "Alexa's Portfolio"
        @seo_keywords = "Alexa Kuster's Portfolio"
    end
end