module TasksHelper
    def status_color(status)
        case status
        when "not_started" then "secondary"
        when "in_progress" then "warning"
        when "completed" then "success"
        else "primary"
        end
    end
end
