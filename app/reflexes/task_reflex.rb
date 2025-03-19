# frozen_string_literal: true

class TaskReflex < ApplicationReflex
    def toggle_complete
        task = Task.find(element.dataset[:id])
        task.update(completed: !task.completed)
        cable_ready["tasks"].console_log(message: "Task updated in real-time!").broadcast
        morph :nothing
    end
    
    def update_status
        task = Task.find(element.dataset[:id])
        task.update(status: element.value)
        morph :nothing
    end
    
    def delete_task
        task = Task.find(element.dataset[:id])
        task.destroy
        morph :nothing
    end
end
