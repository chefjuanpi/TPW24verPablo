using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TP_W24
{
    public partial class Compte : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void byebye()
        {

        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                string addresse = "~/images/" + FileUpload1.FileName;
                FileUpload1.SaveAs(MapPath(addresse));
                profileImages.ImageUrl = addresse;
            }  
        }

        protected void UploadImage_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                string addresse = "~/images/" + FileUpload1.FileName;
                FileUpload1.SaveAs(MapPath(addresse));
                profileImages.ImageUrl = addresse;
            }  
            //// Save the uploaded file to an "Uploads" directory
            //// that already exists in the file system of the 
            //// currently executing ASP.NET application.  
            //// Creating an "Uploads" directory isolates uploaded 
            //// files in a separate directory. This helps prevent
            //// users from overwriting existing application files by
            //// uploading files with names like "Web.config".
            //string saveDir = @"\images\";

            //// Get the physical file system path for the currently
            //// executing application.
            //string appPath = Request.PhysicalApplicationPath;

            //// Before attempting to save the file, verify
            //// that the FileUpload control contains a file.
            //if (FileUpload1.HasFile)
            //{
            //    string savePath = appPath + saveDir +
            //        Server.HtmlEncode(FileUpload1.FileName);

            //    // Call the SaveAs method to save the 
            //    // uploaded file to the specified path.
            //    // This example does not perform all
            //    // the necessary error checking.               
            //    // If a file with the same name
            //    // already exists in the specified path,  
            //    // the uploaded file overwrites it.
            //    FileUpload1.SaveAs(savePath);

            //    // Notify the user that the file was uploaded successfully.
            //    UploadStatusLabel.Text = "Your file was uploaded successfully.";

            //}
            //else
            //{
            //    // Notify the user that a file was not uploaded.
            //    UploadStatusLabel.Text = "You did not specify a file to upload.";
            //}
        }

        protected void UploadImage_Click(object sender, ImageClickEventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                string addresse = "~/images/" + FileUpload1.FileName;
                FileUpload1.SaveAs(MapPath(addresse));
                profileImages.ImageUrl = addresse;
            }  
        }
    }
}