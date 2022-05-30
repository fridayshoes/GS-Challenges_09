class Diary
  def initialize(title, contents) # title and contents are both strings
    # ...
    @title = title
    @contents = contents
  end

  def title
    # Returns title as a string
    return @title
  end

  def contents
    # Returns contents as a string
    return @contents
  end

  def content_num_words
    # Returns the number of words in the contents as an integer
    @contents.split(" ").length
  end

  def experience_readable?(reading_time_calculator) # returns true or false
    # returns the title of the diary experience if there is enough time to read it
    if true
      return "You have time to read #{@title}"
    else 
      false
      return "You don't have time"
    end
  end 

  def reading_time_calculator(minutes, wpm) # minutes is an integer, wpm (avg. reading speed is an integer)
    # returns true or false
    if content_num_words <= minutes * wpm
      true
    else
      false
    end
  end
end