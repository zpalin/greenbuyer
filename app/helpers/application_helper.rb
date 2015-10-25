module ApplicationHelper
    def is_active_controller(controller_name)
        params[:controller] == controller_name ? "active" : nil
    end

    def is_active_action(action_name)
        params[:action] == action_name ? "active" : nil
    end

    def department_path department
    	"/departments/#{department.id}/#{department.display_name}".gsub!(' ', '_')
    end
end