import express from "express";
import { addBook, getAllBooks } from "../controllers/books_zone.js";
import multer from "multer";

const routes = express.Router();

const storage = multer.diskStorage({});

const fileFilter = (req, file, cb) => {
  if (file.mimetype.startsWith("image")) {
    cb(null, true);
  } else {
    cb("invalid image file!", false);
  }
};

const upload = multer({ storage, fileFilter });

routes.post("/add-book", upload.single("imgUrl"), addBook);

routes.get("/books", getAllBooks);

export default routes;
