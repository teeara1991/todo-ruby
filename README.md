ToDo App on Ruby on Rails  

Создать новую задачу:                       Task.create(text:'your text')  
Изменить задачу:                            Task.change(id:your_id, text: 'your text')  
Удалить задачу:                             Task.delete(id:your_id)  
Отметить задачу выполненной/невыполненной:  Task.complete(id:your_id)  
Просмотреть список задач:                   Task.list 
Удалить все задачи:                         Task.deleteAll 
   
Перед работой убедитесь, что у вас установлена версия ruby не ниже 2.5.3, rails не ниже 6.0.1.
