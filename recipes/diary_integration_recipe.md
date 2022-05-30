# Design a Multi-Class Program

_**This is a Makers Vine.** Vines are designed to gradually build up sophisticated skills. They contain a mixture of text and video, and may contain some challenge exercises without proposed solutions. [Read more about how to use Makers
Vines.](https://github.com/makersacademy/course/blob/main/labels/vines.md)_

Learn to design a multi-class program.

## Introduction

Once more we need to update our design recipe. However, this time we have a
whole new level of challenge. How do we figure out how to break our program up
into classes? There are two common approaches to this:

1. **Emergent Design**  
   Start with a single class, and then extract out new classes when it seems
   like it is doing too much.

2. **Planned Design**  
   Design a multi-class system and then build it, updating your design as you
   learn where you were wrong at first.

You can also use a mix of both.

We are going to start off with Planned Design. Exercises on Emergent Design are
available in the adventure section — and you're not too far!

Here's our Multi-Class Planned Design Recipe

> # Multi-Class Planned Design Recipe
> 
> ## 1. Describe the Problem
> 
As a user
So that I can record my experiences 
I want to keep a regular diary

As a user
So that I can reflect on my experiences
I want to read my past diary entries

As a user
So that I can reflect on my experiences in my busy day
I want to select diary entries to read based on how much time I have and my reading speed

As a user
So that I can keep track of my tasks
I want to keep a todo list along with my diary

As a user
So that I can keep track of my contacts
I want to see a list of all of the mobile phone numbers in all my diary entries
> 
> ## 2. Design the Class System
> 
> Design the interfaces of each of your classes and how they will work together
> to achieve the job of the program. You can use diagrams to visualise the
> relationships between classes.
> 
> Consider pulling out the key verbs and nouns in the problem description to
> help you figure out which classes and methods to have.
> 

can record my experience
keep a regular diary
read my past diary entries
select diary entries to read based on how much time I have and my reading speed
keep a todo list
keep track of my contacts
see a list of all of the mobile phone numbers in all my diary entries



                                        ┌───────────────────────────────────────────┐
                                        │                                           │
                                        │   Lists                                   │
                                        │   -----                                   │
                                        │                                           │
                  ┌────────────────────►│   - List of diary experiences             │
                  │                     │   - Todo List                             │
                  │   ┌─────────────────┤                                           │◄─────────────┐
                  │   │                 │                                           │              │
                  │   │                 │   - Add an experience                     ├───────────┐  │
                  │   │                 │   - Add a todo                            │           │  │
                  │   │                 │                                           │           │  │
                  │   │                 │                                           │           │  │
                  │   │                 │                                           │           │  │
                  │   │                 └────────────────▲──┬───────────────────────┘           │  │
                  │   │                                  │  │                                   │  │
                  │   │                                  │  │                                   │  │
  ┌───────────────┴───▼─────────────────┐     ┌──────────┴──▼───────────────────┐  ┌────────────▼──┴─────────────┐
  │                                     │     │                                 │  │                             │
  │  Diary Actioner                     │     │   Todo Actioner                 │  │   Phone Actioner            │
  │  -------------                      │     │   ------------                  │  │   ---------------           │
  │                                     │     │                                 │  │                             │
  │  - Create exprce  (title, contents) │     │   - Create a todo               │  │  - Search for phone number  │
  │  - List experiences by read time    |     │   - Mark a todo as done         │  │                             │
  │  - Read past experience             │     │                                 │  │                             │
  │                                     │     │                                 │  │                             │
  │                                     │     │                                 │  │                             │
  └─────────────────────────────────────┘     └─────────────────────────────────┘  └─────────────────────────────┘


class Lists
  def initialize # Make arrays for experiences, todos
  end

  def add_diary(diary) # diary is an instance of Diary
    # Diary gets added to the experiences list
    # Returns nothing
  end

  def add_todo(todo) # todo is an instance of Todo
    # Todo gets added to the tasks list
    # Returns nothing
  end

  def all_experiences_list
    # returns a list of all the diary entries
  end

  def best_diary_experiences_for_reading_time(minutes, wpm)
    # returns a list of diary entries based on available reading time
  end

  def all_todos_list
    # returns a list of all the todos
  end

  def still_todos_list
  # returns a list of all todos still todo
  end
end


class Diary
  def initialize(title, contents) # title and contents are both strings
  end

  def title
    # Returns title as a string
  end

  def contents
    # Returns contents as a string
  end

  def content_num_words
    # Returns the number of words in the contents as an integer
  end

  def experience_readable?(reading_time_calculator) # returns true or false
    # returns the title of the diary experience if there is enough time to read it
  end

  def reading_time_calculator(minutes, wpm) # minutes is an integer, wpm (avg. reading speed is an integer)
    # returns true or false
  end  
end


class Todo
  def initialize(task) # task is a string
  # ...
  end

  def task
    # Returns the task as a string
  end

  def mark_done!
    # Marks the todo as done
    # Removes todo from todo list
  end

  def done?
    # Returns true if task is done
    # Otherwise returns false
  end
end


class PhoneSearch
  def initialize(diary_list) 
  end

  def phone_num_search
    # Returns a list of all the phone numbers found in diary contents
  end

  def get_numbers_from_experience(experience)
    # scans contents looking for numbers beginning 07 and then the next 9 numbers
  end
end



Steps 3, 4, and 5 then operate as a cycle.
> 
> ## 3. Create Examples as Integration Tests
> 
> Create examples of the classes being used together in different situations
> and combinations that reflect the ways in which the system will be used.
> 
> Encode one of these as a test and move to step 4.

--- Test array list for diary and todos

# 1
diary_list = Lists.new
diary_list.add_diary(diary_1) # => [diary_1]

# 2
todo.list = Lists.new
todo_list.add_todo(task_ 1) # => [task_1]

# 3
diary_list = Lists.new
diary_list.add_diary(diary_1)
diary_list.add_diary(diary_2) # => [diary_1, diary_2]

# 4
todo.list = Lists.new
todo_list.add_todo(task_ 1)
todo_list.add_todo(task_ 2) # => [task_1, task_2]


--- Testing Todo integration

# 5
todo.list = Lists.new
todo_list.add_todo(task_ 1)
todo_list.add_todo(task_ 2)
todo_list.add_todo(task_ 3)
task_1.mark_done!
taks_2.mark_done! # => [task_3]


--- Testing diary integration

# 6
diary_list = Lists.new
diary_list.add_diary(diary_1)
diary_list.add_diary(diary_2)
diary_1.count_words
diary_2.count_words # => number of words


# 7
diary_list = Lists.new
diary_list.add_diary(diary_1)
diary_list.add_diary(diary_2)
diary_list.add_diary(diary_3)
diary_list.best_diary_experiences_for_reading_time # => [diary_1, diary_3]


--- Testing phone number extraction

# 8
diary_experience = Diary.new("Forest walk", "...david's mobile was 07941225108.)
diary_experience.phone_num_search # => 07941225108








> 
> ## 4. Create Examples as Unit Tests
> 
> Create examples, where appropriate, of the behaviour of each relevant class at
> a more granular level of detail.
> 
> Encode one of these as a test and move to step 5.

# 1

diary_list = Lists.new
diary_list.all_experiences_list # => []

# 2

todo_list = Lists.new
todo_list.all_todos_list # => []


# 3
diary_experence = Diary.new("Forest walk", "walking in the woods")
title # => Forest walk
contents #  => "walking in the woods"

# 4
diary_experience = Diary.new(Forest walk, "walking in the woods")
diary_experience.content_num_words # => 4

# 5
diary_experience = Diary.new("Forest walk", "")
diary_experience.content_num_words # => 0

# 6
diary_experience = Diary.new("Forest walk", "walking" * 600)
reading_time_calculator(3, 250)
diary_experience.minutes_i_have_to_read # => true

# 7
diary_experience = Diary.new("Forest walk", "walking" * 1250)
experience_readable?(true)
diary_experience.minutes_i_have_to_read # => "You have time to read Forest walk"











> ## 5. Implement the Behaviour
> 
> For each example you create as a test, implement the behaviour that allows the
> class to behave according to your example.
> 
> Then return to step 3 until you have addressed the problem you were given. You
> may also need to revise your design, for example if you realise you made a
> mistake earlier.

Copy and fill out [this template](../resources/multi_class_recipe_template.md)
for each of the below exercises.

## Demonstration

[A video demonstration](https://www.youtube.com/watch?v=CkyhW3pNTUY&t=0s)

## Exercise

**This is a process feedback challenge.** That means you should record yourself
doing it and submit that recording to your coach for feedback. [How do I do
this?](../pills/process_feedback_challenges.md)

This is the big one! You might want to start a new RSpec project for this.

Use object-oriented design and test-driven development, backed up by your
debugging and pairing skills, to develop the following program.

> As a user  
> So that I can record my experiences  
> I want to keep a regular diary

> As a user  
> So that I can reflect on my experiences  
> I want to read my past diary entries 

> As a user  
> So that I can reflect on my experiences in my busy day  
> I want to select diary entries to read based on how much time I have and my
> reading speed

> As a user  
> So that I can keep track of my tasks  
> I want to keep a todo list along with my diary

> As a user  
> So that I can keep track of my contacts  
> I want to see a list of all of the mobile phone numbers in all my diary
> entries

Some pointers:

* Remember that user stories don't map to classes 1:1. You'll need to digest the
  full problem and then develop a multi-class system that meets the user's
  needs.
* Don't worry about user interface or input-output. That means you shouldn't be
  using `gets` and only use `puts` for debugging purposes.

After you're done, [submit your recording
here.](https://airtable.com/shrNFgNkPWr3d63Db?prefill_Item=gs_as03)

## Example Solution

There are many ways to solve this exercise, but [here is an example
solution.](https://www.youtube.com/watch?v=CkyhW3pNTUY&t=2046s) Bear in mind
that once you look at it, you may be influenced by my approach and this may
affect how much learning you can get from this exercise. That said, I trust you
to make the right decision.


[Next Challenge](10_adventure.md)