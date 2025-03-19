class Task < ApplicationRecord
    after_save :schedule_reminder, if: -> { due_date.present? && !reminder_sent }
    
    def schedule_reminder
        ReminderJob.set(wait_until: due_date - 1.hour).perform_later(self.id)
    end
end
