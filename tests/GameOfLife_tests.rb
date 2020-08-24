require_relative '../code/GameOfLife.rb'

  def test() 
    result = life 3, 3, nil, 2 , [0, 1, 0, 0, 1, 0, 0, 1, 0]
    if result == [0, 1, 0, 0, 1, 0, 0, 1, 0]
        return true
    else
        return false
    end 
  end