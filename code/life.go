/*
 Conway's Game of Life implementation in Go language
 Description of the rules can be found at:
 	http://rosettacode.org/wiki/Conway%27s_Game_of_Life
 Requirements - Go compiler
 Usage - go run life.go 

 The implementation is exactly similar to the professor's code in awk.
 Go syntax is similar to C, so the implementation is straightforward
*/

package main

import "fmt"
import "time"
import "math/rand"

//Execution starts here
func main(){
	sleep()
	clearScreen()
	life(50, 20, 619, 200);
}

func life(rows, cols, some, generations int){
	var now []int;
	var b int;
	for c:=0; c<rows*cols; c++ {
		if(rand.Intn(1000)>some){
			b = 1
		} else {
			b = 0
		}
		now = append(now, b)
	}
	live(now, rows, generations)
}

func live(a []int, r, gen int)int{
	if(gen<1){
		return 0
	}
	sleep()
	homeScreen()
	fmt.Printf("Generation %3d\n",gen)
	for c:=0; c<len(a); c++ {
		if(a[c] == 1){
			fmt.Printf("o")
		} else {
			fmt.Printf(" ")
		}
		if((c+1)%r == 0){
			fmt.Printf("\n")
		}
	}
	var neighbors int
	neighbors = 0
	var b []int
	for c:=0; c<len(a); c++ {
		if(c-1 >= 0 && c%r != 0 && c-1<=len(a)-1){
			neighbors += a[c-1]
		}
		if(c+1 >= 0 && (c+1)%r != 0 && c+1<=len(a)-1){
			neighbors += a[c+1]
		}
		if(c-r-1 >= 0 && c-r-1<=len(a)-1){
			neighbors += a[c-r-1]
		}
		if(c-r >= 0 && c-r<=len(a)-1){
			neighbors += a[c-r]
		}
		if(c-r+1 >= 0 && c-r+1<=len(a)-1){
			neighbors += a[c-r+1]
		}
		if(c+r-1 >= 0 && c+r-1<=len(a)-1){
			neighbors += a[c+r-1]
		}
		if(c+r >= 0 && c+r<=len(a)-1){
			neighbors += a[c+r]
		}
		if(c+r+1 >= 0 && c+r+1<=len(a)-1){
			neighbors += a[c+r+1]
		}
		if(a[c] == 0){
			if(neighbors == 3){
				b = append(b, 1)
			} else {
				b = append(b, 0)
			}
		} else {
			if(neighbors == 2 || neighbors == 3){
				b = append(b, 1)
			} else {
				b = append(b, 0)
			}
		}
		neighbors = 0
	}
	gen -= 1
	live(b, r, gen)
	return 1
}

func sleep() {time.Sleep(100*time.Millisecond)}
func homeScreen(){ fmt.Println("\033[1;1H") }
func clearScreen(){ fmt.Println("\033[2J") }
//test function for travis build
func Test_life()int{ return 1 }