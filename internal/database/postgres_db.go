package database

import (
	"database/sql"
	"fmt"
	"log"

	"github.com/AnthonyGOliveira/go_api/internal/config"
	_ "github.com/lib/pq"
)

func NewPostgresConnection(cfg config.Config) *sql.DB {
	connStr := fmt.Sprintf(
		"user=%s password=%s host=%s port=%s dbname=%s sslmode=disable",
		cfg.DBUser, cfg.DBPassword, cfg.DBHost, cfg.DBPort, cfg.DBName,
	)
	dataBase, err := sql.Open("postgres", connStr)
	if err != nil {
		log.Fatalf("Error to open database connection: %v", err)
	}

	if err := dataBase.Ping(); err != nil {
		log.Fatalf("Error to connect database : %v", err)
	}

	log.Println("Connection database start with success!")
	return dataBase
}
