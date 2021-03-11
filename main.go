package main

import (
	"fmt"
	"net/http"
)

func index(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Hello")
}
func check(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "How are you")
}

func main() {
	http.HandleFunc("/", index)
	http.HandleFunc("/heathceck", check)
	fmt.Println("server started")
	http.ListenAndServe(":8000", nil)
}
