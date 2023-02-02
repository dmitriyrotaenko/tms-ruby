# Реализуйте класс Student (Студент), который будет наследовать от класса User,
# подобно тому, как это сделано в теоретической части урока.
# Этот класс должен иметь следующие свойства: name (имя, наследуется от User),
# surname (фамилия, наследуется от User), year (год поступления в вуз). Класс должен иметь метод full name()
# (наследуется от User), с помощью которого можно вывести одновременно имя и фамилию студента.
# Также класс должен иметь метод course(), который будет выводить текущий курс студента (от 1 до 5).
# Курс вычисляется так: нужно от текущего года отнять год поступления в вуз. Текущий год получите самостоятельно.


class User
  def initialize(name, surname)
    @name = name
    @surname = surname
  end

  def full_name
    puts "#{@name} #{@surname}"
  end
end

class Student < User

  FINAL_COURSE = 5

  def initialize(name, surname, year)
    @year = year
    super(name, surname)
  end

  def course
    curr_course = Time.now.year - @year
    puts curr_course <= FINAL_COURSE ? "Студент на #{curr_course} курсе" :
           "Закончил университет в #{@year + FINAL_COURSE} году"
  end
end

dima = Student.new('Dima', 'Rotaenko', 2020)
vasya = Student.new('Vasya', 'Pupkin', 2010)

dima.full_name #=> Dima Rotaenko
dima.course #=> Студент на 3 курсе
vasya.course #=> Закончил университет в 2015 году