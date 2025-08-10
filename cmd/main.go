package main

import (
	"encoding/json"
	"log"
	"net/http"
	"time"

	"github.com/gorilla/mux"

	"github.com/AnthonyGOliveira/go_api/internal/config"
	"github.com/AnthonyGOliveira/go_api/internal/database"
	"github.com/AnthonyGOliveira/go_api/internal/transport/http/middleware"
)

const port string = ":8000"

func main() {
	serverConfig := config.LoadConfig()
	database.NewPostgresConnection(serverConfig)
	router := mux.NewRouter()
	server := &http.Server{
		Handler:      router,
		Addr:         ":" + serverConfig.ServerPort,
		WriteTimeout: 15 * time.Second,
		ReadTimeout:  15 * time.Second,
	}
	router.HandleFunc("/api/health", func(w http.ResponseWriter, r *http.Request) {
		w.WriteHeader(http.StatusAccepted)
		json.NewEncoder(w).Encode(map[string]bool{"ok": true})
	})
	router.Use(middleware.LoggingMiddleware)
	log.Println("Server running in", serverConfig.ServerPort)
	log.Fatal(server.ListenAndServe())
}
