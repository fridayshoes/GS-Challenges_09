require 'Lists'
require 'Diary'
require 'Todo'
require 'PhoneSearch'

RSpec.describe 'integration' do
  context 'when given a diary object' do
    it 'returns the diary object' do
      diary_list = Lists.new
      diary_1 = Diary.new("Title", "Contents")
      diary_list.add_diary(diary_1)
      expect(diary_list.all_experiences_list).to eq [diary_1]
    end
  end

  context 'when given a multiple diary objects' do
    it 'returns multiple diary objects' do
      diary_list = Lists.new
      diary_1 = Diary.new("Title", "Contents")
      diary_2 = Diary.new("Title", "Contents")
      diary_list.add_diary(diary_1)
      diary_list.add_diary(diary_2)
      expect(diary_list.all_experiences_list).to eq [diary_1, diary_2]
    end
  end

  context 'when given a todo object' do
    it 'returns the todo object' do
      todo_list = Lists.new
      task_1 = Todo.new("Task")
      todo_list.add_task(task_1)
      expect(todo_list.all_todos_list).to eq [task_1]
    end
  end

  context 'when given multiple todo objects' do
    it 'returns multiple todo objects' do
      todo_list = Lists.new
      task_1 = Todo.new("Task")
      task_2 = Todo.new("Task")
      todo_list.add_task(task_1)
      todo_list.add_task(task_2)
      expect(todo_list.all_todos_list).to eq [task_1, task_2]
    end
  end

  context 'when a todo is marked done' do
    it 'returns list of todos still todo' do
      todo_list = Lists.new
      task_1 = Todo.new("Task")
      task_2 = Todo.new("Task")
      task_3 = Todo.new("Task")
      todo_list.add_task(task_1)
      todo_list.add_task(task_2)
      todo_list.add_task(task_3)
      task_1.mark_done!
      task_2.mark_done!
      expect(todo_list.still_todos_list).to eq [task_3]
    end
  end

  context 'when given 2 minutes and a wpm reading speed of 5' do
    it 'returns the diary experiences that can be read in that time' do
      diary_list = Lists.new
      diary_1 = Diary.new("Forest walk", "walking " * 10)
      diary_2 = Diary.new("Museum Visit", "paintings " * 12)
      diary_3 = Diary.new("Holiday Maldives", "sand " * 8)      
      diary_list.add_diary(diary_1)
      diary_list.add_diary(diary_2)
      diary_list.add_diary(diary_3)
      expect(diary_list.best_diary_experiences_for_reading_time(2, 5)).to eq [diary_1, diary_3]
    end
  end

  context 'takes diary entries' do
    it 'extracts phone numbers from them' do
      diary_list = Lists.new
      phone_number_list = PhoneSearch.new(diary_list)
      diary_list.add_diary(Diary.new("Forest walk", "...david's mobile was 07941225108."))
      diary_list.add_diary(Diary.new("Catch up", "......new number 07958422527"))
      diary_list.add_diary(Diary.new("Building job", "..call 07954545678, ask for Fred"))
      expect(phone_number_list.phone_num_search).to eq [
        "07941225108",
        "07958422527",
        "07954545678"
      ]
    end
  end
end