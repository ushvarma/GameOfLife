package main

import "testing"
import "main"

func goTest(t *testing.T){
	var result int
	result = Test_life()
	if(result != 1){
		t.Errorf("Actual - %d ; Expected - 1", result );
	}
}
