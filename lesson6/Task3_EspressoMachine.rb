# Взять несколько предметов, которые вас окружают, и описать их, как классы.
# Создать по объекту каждого класса, сравнить их поведение
class EspressoMachine
  attr_reader :current_amount_of_beans,
              :current_amount_of_water,
              :beans_container_limit,
              :water_container_limit

  BEANS_PER_CUP = 0.7
  WATER_PER_CUP = 0.3

  def initialize(water_limit, beans_limit)
    @current_amount_of_water = 0
    @current_amount_of_beans = 0
    @water_container_limit = water_limit
    @beans_container_limit = beans_limit
  end

  def add_water(amount)
    if (current_amount_of_water + amount) > water_container_limit
      puts "Слишком много воды. Ещё можно добавить #{water_container_limit - current_amount_of_water} воды"
    else
      @current_amount_of_water += amount
    end
  end

  def add_beans(amount)
    if (@current_amount_of_beans + amount) > beans_container_limit
      puts "Слишком много зёрен. Ещё можно добавить #{beans_container_limit - @current_amount_of_beans} грамм"
    else
      @current_amount_of_beans += amount
    end
  end

  def brew
    if can_brew?
      @current_amount_of_water -= WATER_PER_CUP
      @current_amount_of_beans -= BEANS_PER_CUP
      puts 'Вот твой кофе!'
    else
      puts 'Не хватает кофе или воды!'
    end
  end

  private

  def can_brew?
    @current_amount_of_water >= WATER_PER_CUP && @current_amount_of_beans >= BEANS_PER_CUP
  end
end


espresso_maker = EspressoMachine.new(2.5, 350)
espresso_maker.add_water(2)
espresso_maker.add_beans(1.3)
espresso_maker.brew #=> Вот твой кофе!
espresso_maker.brew #=> Не хватает кофе или воды!
