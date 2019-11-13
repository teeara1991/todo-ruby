# frozen_string_literal: true

class Task < ApplicationRecord
  def self.list
    @tasks_uncomplited = Task.where(completed: 0).order(:created_at)
    @tasks_complited = Task.where(completed: 1)
    puts 'Uncomplited tasks'
    @tasks_uncomplited .each do |task|
      puts "id: #{task.id}
            title: #{task.title}
            text: #{task.text}
            completed: #{task.completed}
            data: #{task.created_at}"
    end
    puts '----------------------------------------------'
    puts 'Complited tasks'
    @tasks_complited .each do |task|
      puts "id: #{task.id}
      title: #{task.title}
      text: #{task.text}
      completed: #{task.completed}
      data: #{task.created_at}"
    end
  end

  def self.create(options = {})
    @task = Task.new
    @task.title = options[:title]
    @task.text = options[:text]
    @task.completed = false
    @task.save
  end

  def self.change(options = {})
    @task = Task.find(options[:id])
    @task.title = options[:title]
    @task.text = options[:text]
    @task.save
  end

  def self.complete(options = {})
    @task = Task.find(options[:id])
    @task.completed = !@task.completed
    @task.save
  end

  def self.delete(options = {})
    @task = Task.find(options[:id])
    @task.destroy
  end

  def self.deleteAll
    @tasks = Task.all
    @tasks .each do |task|
      task.destroy
    end
  end
end
