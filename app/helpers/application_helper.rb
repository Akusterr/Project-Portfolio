module ApplicationHelper

    def login_helper style
        if current_user.is_a?(GuestUser)
            (link_to "register", new_user_registration_path, class: style) +
            " ".html_safe +
            (link_to "login", new_user_session_path, class: style)
        else
            link_to "logout", destroy_user_session_path, method: :delete, class: style
        end
    end

    def source_helper
        if session[:session]
            "Thanks for visiitg me from #{session[:source]}"
        end
    end
end
