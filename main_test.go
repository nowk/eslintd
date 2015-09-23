package main

import (
	"testing"
)

func TestReplace(t *testing.T) {
	path := "/guest/path/index.js"

	var exp = "/host/path/index.js"

	str := replace(path, "/guest/path", "/host/path")

	if exp != str {
		t.Errorf("expected %s, got %s", exp, str)
	}
}
