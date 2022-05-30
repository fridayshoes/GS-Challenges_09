class Lists
  def initialize # Make arrays for experiences, todos
    @diary_list = []
    @todo_list = []
  end

  def add_diary(diary) # diary is an instance of Diary
    # Diary gets added to the experiences list
    # Returns nothing
    @diary_list << diary
  end

  def add_task(todo) # todo is an instance of Todo
    # Todo gets added to the tasks list
    # Returns nothing
    @todo_list << todo
  end

  def all_experiences_list
    # returns a list of all the diary entries
    return @diary_list
  end

  def best_diary_experiences_for_reading_time(minutes, wpm)
    # returns a list of diary entries based on available reading time
    best_list = @diary_list.select do |diary|
      diary.reading_time_calculator(minutes, wpm) == true
    end
    return best_list
  end  
  
  def all_todos_list
    # returns a list of all the todos
    return @todo_list
  end

  def still_todos_list
    # returns a list of all todos still todo
    incomplete = @todo_list.select do |todo|
      todo.done? == false
    end
    return incomplete
  end
end