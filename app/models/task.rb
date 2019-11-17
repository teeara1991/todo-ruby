# frozen_string_literal: true

class Task < ApplicationRecord
  def self.list
    @tasks_uncomplited = Task.where(completed: 0).order(:created_at)
    @tasks_complited = Task.where(completed: 1)
    @tasks_uncomplited .each do |task|
      puts "id: #{task.id}
              text: #{task.text}
              completed: #{task.completed}
              data: #{task.created_at}"
    end
    @tasks_complited .each do |task|
      puts "id: #{task.id}
        text: #{task.text}
        completed: #{task.completed}
        data: #{task.created_at}"
    end
  rescue StandardError
    puts 'Error showing list of task'
  end

  def self.create(options = {})
    @task = Task.new
    @task.text = options[:text].to_s
    @task.completed = false
    @task.save if @task.text != ''
  rescue StandardError
    puts 'Error creating task, please check input parameters'
  end

  def self.change(options = {})
    @task = Task.find(options[:id])
    @task.text = options[:text].to_s
    @task.save if @task.text != ''
  rescue StandardError
    puts 'Error changing task, please check input parameters'
  end

  def self.complete(options = {})
    @task = Task.find(options[:id])
    @task.completed = !@task.completed
    @task.save
  rescue StandardError
    puts 'Error changing status of task, please check input parameters'
  end

  def self.delete(options = {})
    @task = Task.find(options[:id])
    @task.destroy
  rescue StandardError
    puts 'Error deleting task, please check input parameters'
  end

  def self.deleteAll
    @tasks = Task.all
    @tasks .each(&:destroy)
  rescue StandardError
    puts 'Error deleting tasks'
  end
end
