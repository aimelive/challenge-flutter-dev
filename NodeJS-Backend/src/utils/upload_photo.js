import cloudinary from "./cloudinary.js";

export const uploadPhoto = async (req, res) => {
  let imgUrl = "";
  const cloud_uploader = await cloudinary.v2.uploader.upload(
    req.file.path,
    async (error, image) => {
      if (error) {
        res.status(400).json({
          Message: "Upload photo failed!",
          Error: error,
        });
      } else {
        imgUrl = image.url;
      }
    }
  );
  if (cloud_uploader) return imgUrl;
};
