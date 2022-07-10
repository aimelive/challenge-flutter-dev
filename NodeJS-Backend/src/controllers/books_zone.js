import { uploadPhoto } from "../utils/upload_photo.js";
import Book from "../models/books.js";

//Adding Book to the Database
export const addBook = async (req, res) => {
  try {
    req.body.imgUrl = await uploadPhoto(req, res);
    const createdBook = await Book.create({
      title: req.body.title,
      category: req.body.category,
      imgUrl: req.body.imgUrl,
      price: req.body.price,
      audioUrl: req.body.audioUrl,
      pages: req.body.pages,
      authorId: req.body.authorId,
      previewText: req.body.previewText,
      description: req.body.description,
    });
    if (createdBook) {
      res.status(200).json({
        Message: "Book has been added successfully!",
        Book: createdBook,
      });
    }
  } catch (error) {
    res.status(500).json({
      Message: "Something went wrong! ",
      Error: error,
    });
  }
};

//Get list of all books
export const getAllBooks = async (req, res) => {
  try {
    const books = await Book.find().sort({ updatedAt: -1 });
    res.status(200).json({
      Message: "Books retrieved successfully!",
      Total: books.length,
      Books: books,
    });
  } catch (error) {
    res.status(500).json({
      Message: "Something went wrong! ",
      Error: error,
    });
  }
};
