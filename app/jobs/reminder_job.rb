class ReminderJob < ApplicationJob
  queue_as :default

  def perform(*args)
    task = Task.find_by(id: task_id)
    return unless task && task.status != "Completed"

    cable_ready["notifications"].console_log(message: "Reminder: Task '#{task.title}' is due soon!").broadcast
    task.update(reminder_sent: true)
  end
end
