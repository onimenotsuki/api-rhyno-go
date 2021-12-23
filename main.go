package main

import (
	"fmt"

	"github.com/gin-gonic/gin"
)

// main ...
func main() {
	const port int16 = 5000

	r := gin.Default()
	r.GET("/ping", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"message": "pong",
		})
	})

	r.Run(fmt.Sprintf(":%d", port))
}
