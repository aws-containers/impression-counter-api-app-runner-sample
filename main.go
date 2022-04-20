package main

import (
	"context"
	"encoding/json"
	"fmt"
	"html"
	"log"
	"net/http"
	"runtime"

	"golang-impression-counter/pkg/redis"

	"github.com/gorilla/mux"
)

var ctx = context.Background()

func GetRootRequest(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Hello world, %q, working on %v/%v", html.EscapeString(r.URL.Path), runtime.GOOS, runtime.GOARCH)
	json.NewEncoder(w)
}

func GetPing(w http.ResponseWriter, r *http.Request) {
	rdc := redis.GetRedisClient()
	pong, err := rdc.Ping().Result()
	log.Println(ctx, pong, err)
	json.NewEncoder(w).Encode(pong)
}

func GetImpression(w http.ResponseWriter, r *http.Request) {
	rdc := redis.GetRedisClient()
	increment, err := rdc.Incr("counter").Result()
	if err != nil {
		log.Println(err)
	}
	json.NewEncoder(w).Encode(increment)
}

func GetCounter(w http.ResponseWriter, r *http.Request) {
	rdc := redis.GetRedisClient()
	value, err := rdc.Get("counter").Result()
	if err != nil {
		log.Println(err)
	}
	json.NewEncoder(w).Encode(value)
}

func main() {
	router := mux.NewRouter()
	router.HandleFunc("/", GetImpression).Methods("GET")
	router.HandleFunc("/info", GetRootRequest).Methods("GET")
	router.HandleFunc("/ping", GetPing).Methods("GET")
	router.HandleFunc("/admin", GetCounter).Methods("GET")
	log.Fatal(http.ListenAndServe(":8080", router))
}
