package main

// package models

import (
	"database/sql"
	"encoding/json"
	"fmt"
	"log"
	"models"
	"net/http"

	"github.com/gorilla/mux"
	_ "github.com/lib/pq"
)

const (
	DB_USER     = "postgres"
	DB_PASSWORD = "0214807424"
	DB_NAME     = "movies"
)

// DB set up
func setupDB() *sql.DB {
	dbinfo := fmt.Sprintf("user=%s password=%s dbname=%s sslmode=disable", DB_USER, DB_PASSWORD, DB_NAME)
	DB, err := sql.Open("postgres", dbinfo)

	checkErr(err)

	return DB
}

func main() {

	// Init the mux router
	router := mux.NewRouter()

	// Route handles & endpoints

	// Get all movies
	router.HandleFunc("/movies/", GetMovies).Methods("GET")

	// Create a movie
	router.HandleFunc("/movies/", CreateMovie).Methods("POST")

	// Delete a specific movie by the movieID
	router.HandleFunc("/movies/{movieid}", DeleteMovie).Methods("DELETE")

	// Delete all movies
	router.HandleFunc("/movies/", DeleteMovies).Methods("DELETE")

	// serve the app
	fmt.Println("Server at 8080")
	log.Fatal(http.ListenAndServe(":8000", router))
}

func printMessage(message string) {
	fmt.Println("")
	fmt.Println(message)
	fmt.Println("")
}

func checkErr(err error) {
	if err != nil {
		panic(err)
	}
}

func GetMovies(w http.ResponseWriter, r *http.Request) {
	db := setupDB()

	printMessage("Getting movies...")

	// Get all movies from movies table that don't have movieID = "1"
	rows, err := db.Query("SELECT * FROM movies")

	// check errors
	checkErr(err)

	// var response []JsonResponse
	var movies []models.Movie

	// Foreach movie
	for rows.Next() {
		var id int
		var movieID string
		var movieName string

		err = rows.Scan(&id, &movieID, &movieName)

		// check errors
		checkErr(err)

		movies = append(movies, models.Movie{MovieID: movieID, MovieName: movieName})
	}

	var response = models.JsonResponse{Type: "success", Data: movies}

	json.NewEncoder(w).Encode(response)
}

func CreateMovie(w http.ResponseWriter, r *http.Request) {
	movieID := r.FormValue("movieid")
	movieName := r.FormValue("moviename")

	var response = models.JsonResponse{}

	if movieID == "" || movieName == "" {
		response = models.JsonResponse{Type: "error", Message: "You are missing movieID or movieName parameter."}
	} else {
		db := setupDB()

		printMessage("Inserting movie into DB")

		fmt.Println("Inserting new movie with ID: " + movieID + " and name: " + movieName)

		var lastInsertID int
		err := db.QueryRow("INSERT INTO movies(movieID, movieName) VALUES($1, $2) returning id;", movieID, movieName).Scan(&lastInsertID)

		// check errors
		checkErr(err)

		response = models.JsonResponse{Type: "success", Message: "The movie has been inserted successfully!"}
	}

	json.NewEncoder(w).Encode(response)
}

func DeleteMovie(w http.ResponseWriter, r *http.Request) {
	params := mux.Vars(r)

	movieID := params["movieid"]

	var response = models.JsonResponse{}

	if movieID == "" {
		response = models.JsonResponse{Type: "error", Message: "You are missing movieID parameter."}
	} else {
		db := setupDB()

		printMessage("Deleting movie from DB")

		_, err := db.Exec("DELETE FROM movies where movieID = $1", movieID)

		// check errors
		checkErr(err)

		response = models.JsonResponse{Type: "success", Message: "The movie has been deleted successfully!"}
	}

	json.NewEncoder(w).Encode(response)
}

func DeleteMovies(w http.ResponseWriter, r *http.Request) {
	db := setupDB()

	printMessage("Deleting all movies...")

	_, err := db.Exec("DELETE FROM movies")

	// check errors
	checkErr(err)

	printMessage("All movies have been deleted successfully!")

	var response = models.JsonResponse{Type: "success", Message: "All movies have been deleted successfully!"}

	json.NewEncoder(w).Encode(response)
}
