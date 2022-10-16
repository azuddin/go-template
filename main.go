package main

import (
	"fmt"
	"net/http"
	"os"
)

func ReturnJsonResponse(res http.ResponseWriter, httpCode int, resMessage []byte) {
	res.Header().Set("Content-type", "application/json")
	res.WriteHeader(httpCode)
	res.Write(resMessage)
}

func TestHandler(res http.ResponseWriter, req *http.Request) {
	HandlerMessage := []byte(`{
  "success": true,
  "message": "The server is running properly"
}`)

	ReturnJsonResponse(res, http.StatusOK, HandlerMessage)
}

func main() {
	http.HandleFunc("/health", TestHandler)

	err := http.ListenAndServe(":3000", nil)
	if err != nil {
		fmt.Println(err)
		os.Exit(1)
	}
}
