- Start docker by run

  ```
  make start-docker
  ```

- When want to run go command, ssh into docker first by running

  ```
  make ssh
  ```

- then can start install your go dependency.

  e.g.:

  ```
  go get github.com/gofiber/fiber/v2
  ```

  or

  ```
  go get -u github.com/gin-gonic/gin
  ```
