    def test() 
        result = life 3, 3, nil, 2 , [0, 1, 0, 0, 1, 0, 0, 1, 0]
        if result == [0, 1, 0, 0, 1, 0, 0, 1, 0]
            return true
        else
            return false
        end 
    end

    def clearScreen() #clears screen
        print "\e[2J\e[f"
    end

    def life(rows, cols, some, generations, initial_life=nil)
        if initial_life == nil
            now = Array.new
            for c in 0..(rows*cols-1)
            if rand(1000) > some
                b=1
            else
                b=0
            end
            now.append(b)
            end
        else
            now = initial_life
        end
        return live(now, rows, cols, generations)
    end

    def live(a, r, cols, gen)
        sleep(0.1)
        clearScreen()
        puts("Generation: #{gen}")
        for c in 0..(a.length()-1)
        if a[c] == 1 
            print "o"
        else
            print " "
        end

        if (c+1) % r == 0
            print "\n"
        end
        end

        if gen<1
            return a
        end

        neighbors = 0
        b = Array.new
        for c in 0..(a.length()-1)
        if (c-1) >= 0 and (c % cols) !=0
            neighbors += a[c-1]
        end
        if c+1<=a.length()-1 and ((c+1) % cols) !=0
            neighbors += a[c+1]
        end
        if c-r-1 >= 0 and ((c-r) % cols) !=0
            neighbors += a[c-r-1]
        end
        if c-r >= 0
            neighbors += a[c-r]
        end
        if c-r+1 >= 0 and c-r+1<=a.length()-1 and ((c-r+1) % cols) !=0
            neighbors += a[c-r+1]
        end
        if c+r-1 >= 0 and c+r-1<=a.length()-1 and ((c+r) % cols) !=0
            neighbors += a[c+r-1]
        end
        if c+r<=a.length()-1
            neighbors += a[c+r]
        end
        if c+r+1<=a.length()-1  and ((c+r+1) % cols) !=0
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
        a = live(b, r, cols, gen)
        return a
    end

    #Main 
    sleep(0.1)
    clearScreen()
    life 50, 20, 619, 200

    '''
    if (test())
        puts ("1")
    else
        puts ("0")
    end
    '''