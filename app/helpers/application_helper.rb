module ApplicationHelper
  def chatposition
    @position = true
  end

  def nochatposition
    @position = false
  end

  def currentposition
    @position
  end
end
