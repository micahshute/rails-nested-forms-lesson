class Project < ApplicationRecord

    validates :name, :due_date, presence: true
    has_many :tasks, dependent: :destroy
    validates_associated :tasks

    # accepts_nested_attributes_for :tasks

    def tasks_attributes=(task_attr)
        task_attr.values.each do |attr|
            attr[:name] = attr[:name].upcase
            self.tasks.build(attr)
        end
    end

    def complete
        self.tasks.where(complete: true)
    end

    def incomplete
        self.tasks.where(complete: false)
    end

end
