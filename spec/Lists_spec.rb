require "Lists"

RSpec.describe 'Lists' do
  it 'checks for presence of empty array of diary experiences' do
    diary_list = Lists.new
    diary_list.all_experiences_list
    expect(diary_list.all_experiences_list).to eq []
  end

  it 'checks for presence of empty array of todo task' do
    todo_list = Lists.new
    todo_list.all_todos_list
    expect(todo_list.all_todos_list).to eq []
  end
end

