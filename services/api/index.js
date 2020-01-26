const express = require("express")

const app = express()

app.use((req, res) => {
  console.log(`Received ${req.method} ${req.url}`)
  res.status(200);
  res.send({ message: "Hello world" })
})

const port = process.env.PORT || 3000
app.listen(port, () => console.log(`Listening on port ${port}`))
