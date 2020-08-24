package main

import "testing"

func goTest(t *testing.T){
	var result int
	result = Test()
	if(result != 1){
		t.Errorf("Actual - %d ; Expected - 1", result );
	}
}
