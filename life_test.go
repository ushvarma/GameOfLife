package main

import "testing"

func goTest(t *testing.T){
	result := test(3)
	if(result != 4){
		t.Errorf("Actual - %d ; Expected - 4", result );
	}
}