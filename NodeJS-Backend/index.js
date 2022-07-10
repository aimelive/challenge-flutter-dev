import express from "express";
import dotenv from "dotenv";
import routes from "./src/routes/api.js";
import mongoose from "mongoose";

dotenv.config();

const app = express();

app.use(express.json());

const DEV_PORT = process.env.DEV_PORT || 3000;
const DB_URL = process.env.DB_URL;

//listening to the server
app.listen(DEV_PORT, () =>
  console.log(`Server running on port ${DEV_PORT}! 🔥`)
);

//connecting to database
mongoose
  .connect(DB_URL)
  .then(() => console.log("DB Connected! 👋"))
  .catch((error) =>
    console.log("Something went wrong, can not connect DB.", error)
  );

//API ROUTES
app.get("/", (req, res) => {
  res.status(200).send({
    Message: "Welcome to Augmented Book Zone APIs!",
  });
});

app.use("/api/v1", routes);
