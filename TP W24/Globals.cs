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
            catch (Exception ex) {
                AddErrorToLog(ex, "Méthode DB.OpenCon()");

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
            catch (Exception ex) {
                AddErrorToLog(ex, "Méthode DB.CloseCon()");

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
            catch (Exception ex) {
                AddErrorToLog(ex, "Méthode ExecuteReader()");

                return false;
            }

            return true;
        }
        public static int ExecuteNonQuery(SqlCommand com)
        {
            if (DR != null && !DR.IsClosed)
                DR.Close();

            int affectedLines = -1;

            com.Connection = Con;

            try {
                affectedLines = com.ExecuteNonQuery();
            }
            catch (Exception ex) {
                AddErrorToLog(ex, "Méthode DB.ExecuteNonQuery()");
            }

            return affectedLines;
        }
        public static bool ExecuteScalar(SqlCommand com, out object scalarResult)
        {
            if (DR != null && !DR.IsClosed)
                DR.Close();

           scalarResult = "";

            com.Connection = Con;

            try {
                scalarResult = com.ExecuteScalar();
            }
            catch (Exception ex) {
                AddErrorToLog(ex, "Méthode DB.ExecuteScalar(SqlCommand, out object)");

                return false;
            }

            return true;
        }
        public static bool ExecuteScalar(SqlCommand com, out int scalarResult)
        {
            if (DR != null && !DR.IsClosed)
                DR.Close();

            scalarResult = -1;

            com.Connection = Con;

            try {
                scalarResult = (int)com.ExecuteScalar();
            }
            catch (Exception ex) {
                AddErrorToLog(ex, "Méthode DB.ExecuteScalar(SqlCommand, out int)");

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
            catch (Exception ex) {
                AddErrorToLog(ex, "Méthode DB.FillDataSet()");

                return false;
            }

            return true;
        }

        public static bool BindControl(Repeater rpt, DataSet ds)
        {
            try {
                rpt.DataSource = ds;

                rpt.DataBind();
            }
            catch (Exception ex) {
                AddErrorToLog(ex, "Méthode DB.BindControl(Repeater, DataSet)");

                return false;
            }

            return true;
        }
        public static bool BindControl(ListView lv, DataTable t)
        {
            try {
                lv.DataSource = t;

                lv.DataBind();
            }
            catch (Exception ex) {
                AddErrorToLog(ex, "Méthode DB.BindListView(ListView, DataTable)");

                return false;
            }

            return true;
        }

        private static void AddErrorToLog(Exception ex, string additionalInfos = "")
        {
            try {
                SqlConnection cn = new SqlConnection(ConString);
                cn.Open();

                SqlCommand com = new SqlCommand("INSERT INTO ErrorLog (ErrorType, ErrorMsg, AdditionalInfo) VALUES (@errorType, @errorMsg, @additionaInfo)", cn);
                com.Parameters.AddWithValue("@errorType", ex.GetType().ToString());
                com.Parameters.AddWithValue("@errorMsg", ex.Message);
                com.Parameters.AddWithValue("@additionaInfo", additionalInfos);

                com.ExecuteNonQuery();

                cn.Close();
            }
            catch (Exception) {}
        }
    }
}