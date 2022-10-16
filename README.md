1. Start docker by run

   ```
   make start
   ```

2. When want to run go command, ssh into docker first by running

   ```
   make ssh
   ```

3. Then can start install your go dependency.

   e.g.:

   ```
   go get github.com/gofiber/fiber/v2
   ```

   or

   ```
   go get -u github.com/gin-gonic/gin
   ```

   or

   ```
   go get -u github.com/gorilla/mux
   ```

