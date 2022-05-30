require 'Diary'

RSpec.describe Diary do
  it 'constructs' do
    diary_experience = Diary.new("Forest walk", "walking in the woods")
    expect(diary_experience.title).to eq "Forest walk"
    expect(diary_experience.contents).to eq "walking in the woods"
  end

  it 'counts the number of words in the contents' do
    diary_experience = Diary.new("Forest walk", "walking in the woods")
    expect(diary_experience.content_num_words).to eq 4
  end
  
  it 'if contents is empty returns zero' do
    diary_experience = Diary.new("Forest walk", "")
    expect(diary_experience.content_num_words).to eq 0
  end 

  context "given an experience containing contents that is readable withtin a given time" do
    it 'returns true' do
      diary_experience = Diary.new("Forest walk", "walking " * 1250)
      expect(diary_experience.reading_time_calculator(6, 250)).to eq true
    end
  end

  context "If there's time to read the diary experience" do
    it 'return the title' do
      diary_experience = Diary.new("Forest walk", "walking " * 1250)
      expect(diary_experience.experience_readable?(true)).to eq "You have time to read Forest walk"
    end
  end
end
    
  