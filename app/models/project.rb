class Project < ApplicationRecord

    validates :name, :due_date, presence: true
    has_many :tasks
    validates_associated :tasks

    def complete
        self.tasks.where(complete: true)
    end

    def incomplete
        self.tasks.where(complete: false)
    end

end
