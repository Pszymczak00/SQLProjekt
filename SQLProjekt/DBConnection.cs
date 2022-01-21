using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SQLProjekt
{
    public static class DBConnection
    {
        private static string connectionString = "Data Source=LAPTOP-48S3MQBQ;Initial Catalog=Firma;User ID=User;Password=Pass1234;Integrated Security=False;";
        public static DataTable IdGet(int id, string tablica)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand($"[dbo].[ProcId{tablica}]", conn);
                cmd.Parameters.AddWithValue("@Id", id);
                cmd.CommandType = CommandType.StoredProcedure;

                using (var da = new SqlDataAdapter(cmd))
                {
                    DataTable table = new DataTable();
                    da.Fill(table);
                    return table;
                }
            }
        }


        public static DataTable IdGetTable(int id, string tablica, string tablicaSzczegol)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand($"[dbo].[ProcId{tablica}{tablicaSzczegol}]", conn);
                cmd.Parameters.AddWithValue("@Id", id);
                cmd.CommandType = CommandType.StoredProcedure;

                using (var da = new SqlDataAdapter(cmd))
                {
                    DataTable table = new DataTable();
                    da.Fill(table);
                    return table;
                }
            }
        }

        public static DataTable ConnectionFun()
        {
            using (SqlConnection conn = new SqlConnection("Data Source=LAPTOP-48S3MQBQ;Initial Catalog=Firma;User ID=User;Password=Pass1234;Integrated Security=False;"))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("[dbo].[ProcPracownicy]", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                using(var da = new SqlDataAdapter(cmd))
                {
                    DataTable table = new DataTable();
                    da.Fill(table);
                    return table;
                }
            }
        }


        public static DataTable ConnectionFun2()
        {
            using (SqlConnection conn = new SqlConnection("Data Source=LAPTOP-48S3MQBQ;Initial Catalog=Firma;User ID=User;Password=Pass1234;Integrated Security=False;"))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("[dbo].[ProcPracownicy]", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                using (var da = new SqlDataAdapter(cmd))
                {
                    DataTable table = new DataTable();
                    da.Fill(table);
                    return table;
                }
            }
        }



        public static DataTable ConnectionFun3()
        {
            using (SqlConnection conn = new SqlConnection("Data Source=LAPTOP-48S3MQBQ;Initial Catalog=Firma;User ID=User;Password=Pass1234;Integrated Security=False;"))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("[dbo].[ProcPracownicy]", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                using (var da = new SqlDataAdapter(cmd))
                {
                    DataTable table = new DataTable();
                    da.Fill(table);
                    return table;
                }
            }
        }


        public static DataTable Basic(string procName)
        {
            using (SqlConnection conn = new SqlConnection("Data Source=LAPTOP-48S3MQBQ;Initial Catalog=Firma;User ID=User;Password=Pass1234;Integrated Security=False;"))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(procName, conn);
                cmd.CommandType = CommandType.StoredProcedure;

                using (var da = new SqlDataAdapter(cmd))
                {
                    DataTable table = new DataTable();
                    da.Fill(table);
                    return table;
                }
            }
        }
    }
}
