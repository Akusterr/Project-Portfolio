module ApplicationHelper

    def login_helper
        if current_user 
            link_to "logout", destroy_user_session_path, method: :delete
        else
            (link_to "register", new_user_registration_path) +
            "<br>".html_safe +
            (link_to "login", new_user_session_path)
        end
    end

    def source_helper
        if session[:session]
            "Thanks for visiitg me from #{session[:source]}"
        end
    end
end
