package main

import (
	"bufio"
	"flag"
	"fmt"
	"log"
	"os"
	"strings"
)

var (
	hostPath  string
	guestPath string
)

func main() {
	flag.StringVar(&hostPath, "host-path", "", "")
	flag.StringVar(&guestPath, "guest-path", "", "")
	flag.Parse()

	scan := bufio.NewScanner(os.Stdin)
	for scan.Scan() {
		fmt.Println(replace(scan.Text(), guestPath, hostPath))
	}
	if err := scan.Err(); err != nil {
		log.Fatal(err)
	}
}

func replace(path, a, b string) string {
	if a == "" {
		return path
	}

	return strings.Replace(path, a, b, 1)
}
