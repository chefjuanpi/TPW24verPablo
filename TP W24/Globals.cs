using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace TP_W24
{
    public class DB
    {
        private static string ConString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

        public static SqlConnection Con {get; private set;}
        public static SqlDataReader DR {get; private set;}

        public static bool OpenCon() {
            if (Con.State == System.Data.ConnectionState.Open)
                return true;

            try {
                Con = new SqlConnection(ConString);
            }
            catch (Exception) {
                return false;
            }

            return true;
        }
        public static bool CloseCon() {
            if (Con.State == System.Data.ConnectionState.Closed)
                return true;

            try {
                Con.Close();
            }
            catch (Exception) {
                return false;
            }

            return true;
        }

        public static void CloseDR()
        {
            if (!DR.IsClosed)
                DR.Close();
        }

        public static bool ExecuteReader(SqlCommand com)
        {
            if (!DR.IsClosed)
                DR.Close();

            com.Connection = Con;

            try {
                DR = com.ExecuteReader();
            }
            catch (Exception) {
                return false;
            }

            return true;
        }

        public static bool BindRepeater(Repeater rpt, DataSet ds)
        {
            rpt.DataSource = ds;
                
            try {
                rpt.DataBind();
            }
            catch (Exception) {
                return false;
            }

            return true;
        }
    }
}