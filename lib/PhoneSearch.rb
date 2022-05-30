class PhoneSearch
  def initialize(diary_list) # phone is a string
  # ...
    @diary_list = diary_list
  end

  def phone_num_search
    # Returns a list of all the phone numbers found in diary contents
    return @diary_list.all_experiences_list.map do |experience|
      get_numbers_from_experience(experience)
    end.flatten
  end

  def get_numbers_from_experience(experience)
    # scans contents looking for numbers beginning 07 and then the next 9 numbers
    return experience.contents.scan(/07[0-9]{9}/)
  end
end