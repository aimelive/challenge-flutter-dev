import mongoose from "mongoose";

const bookSchema = new mongoose.Schema({
  title: {
    type: String,
    required: [true, "Title is required"],
  },
  category: {
    type: String,
    required: [true, "Category is required"],
  },
  imgUrl: String,
  price: {
    type: String,
    default: "0",
  },
  audioUrl: String,
  pages: {
    type: Array,
    default: [],
  },
  authorId: {
    type: String,
    required: true,
  },
  previewText: String,
  description: String,
  publishedAt: {
    type: Date,
    default: Date.now(),
  },
  updatedAt: {
    type: Date,
    default: Date.now(),
  },
});

const Book = mongoose.model("Book", bookSchema);
export default Book;
