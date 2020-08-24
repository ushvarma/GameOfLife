def test(x) #simple increment function
    return x+1
  end

  def clearScreen() #clears screen
    print "\e[2J\e[f"
  end

  def life(rows, cols, some, generations, initial_life=nil)
    now = Array.new
    for c in 0..(rows*cols-1)
      if rand(1000) > some
        b=1
      else
        b=0
      end
      now.append(b)
    end
    live(now, rows, generations)
  end

  def live(a, r, gen)
    if gen<1
      return 0
    end
    sleep(0.1)
    clearScreen()
    puts("Generation: #{gen}")
    for c in 0..(a.length()-1)
      if a[c] == 1 
        print "o"
      else
        print " "
      end

      if (c+1)%r == 0
        print "\n"
      end
    end

    neighbors = 0
    b = Array.new
    for c in 0..(a.length()-1)
      if c-1 >= 0 and c-1<=a.length()-1 
        neighbors += a[c-1]
      end
      if c+1 >= 0 and c+1<=a.length()-1
        neighbors += a[c+1]
      end
      if c-r-1 >= 0 and c-r-1<=a.length()-1
        neighbors += a[c-r-1]
      end
      if c-r >= 0 and c-r<=a.length()-1
        neighbors += a[c-r]
      end
      if c-r+1 >= 0 and c-r+1<=a.length()-1
        neighbors += a[c-r+1]
      end
      if c+r-1 >= 0 and c+r-1<=a.length()-1
        neighbors += a[c+r-1]
      end
      if c+r >= 0 and c+r<=a.length()-1
        neighbors += a[c+r]
      end
      if c+r+1 >= 0 and c+r+1<=a.length()-1
        neighbors += a[c+r+1]
      end


      if a[c] == 0
        if neighbors == 3
          b.append(1)
        else
          b.append(0)
        end
      else
        if neighbors == 2 or neighbors == 3
          b.append(1)
        else 
          b.append(0)
        end
      end
      neighbors = 0
    end
    gen -= 1
    live(b, r, gen)
    return 1
  end

sleep(0.1)
clearScreen()
life 50, 20, 619, 200
# puts test 10