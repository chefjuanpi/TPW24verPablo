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
            if (Con == null) {
                Con = new SqlConnection(ConString);
            }

            if (Con.State == System.Data.ConnectionState.Open)
                return true;

            try {
                Con.Open();
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
            if (DR != null && !DR.IsClosed)
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
        public static int ExecuteNonQuery(SqlCommand com)
        {
            int affectedLines = -1;

            com.Connection = Con;

            try {
                affectedLines = com.ExecuteNonQuery();
            }
            catch (Exception) {
                
            }

            return affectedLines;
        }
        public static bool ExecuteScalar(SqlCommand com, out object scalarResult)
        {
           scalarResult = "";

            com.Connection = Con;

            try {
                scalarResult = com.ExecuteScalar();
            }
            catch (Exception) {
                return false;
            }

            return true;
        }
        public static bool ExecuteScalar(SqlCommand com, out int scalarResult)
        {
            scalarResult = -1;

            com.Connection = Con;

            try {
                scalarResult = (int)com.ExecuteScalar();
            }
            catch (Exception) {
                return false;
            }

            return true;
        }

        public static bool FillDataSet(SqlDataAdapter da, DataSet ds)
        {
            da.SelectCommand.Connection = Con;

            try {
                da.Fill(ds);
            }
            catch (Exception) {
                return false;
            }

            return true;
        }

        public static bool BindRepeater(Repeater rpt, DataSet ds)
        {
            try {
                rpt.DataSource = ds;

                rpt.DataBind();
            }
            catch (Exception) {
                return false;
            }

            return true;
        }
    }
}