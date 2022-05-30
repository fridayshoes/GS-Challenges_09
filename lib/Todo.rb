class Todo
  def initialize(task) # task is a string
  # ...
  @task = task
  end

  def task
    # Returns the task as a string
    @task
  end

  def mark_done!
    # Marks the todo as done
    # Returns nothing
    @task = @task + " #DONE"
  end

  def done?
    # Returns true if the task is done
    # Otherwise returns false
    @task.include? " #DONE"
  end
end