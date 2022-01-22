using SQLProjekt.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

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



        public static DataTable Basic(string procName)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
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


        public static List<ForeignKey> ForeignKeys(string tableName)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand($"[dbo].[procForeignKey{tableName}]", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                List<ForeignKey> list = new List<ForeignKey>();

                using(SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        int id = reader.GetInt32(0);
                        string name = reader.GetString(1);

                        ForeignKey temp = new ForeignKey(id, name);
                        list.Add(temp);
                    }
                }
                return list;
            }
        }


        public static void Insert(string polecenie)
        { 
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = System.Data.CommandType.Text;
                cmd.CommandText = polecenie;
                cmd.Connection = conn;

                conn.Open();
                try
                {
                    cmd.ExecuteNonQuery();
                }
                catch (Exception)
                {
                    MessageBox.Show("Polecenie nieudane, podano błędne dane");
                }
                conn.Close();
            }
        }
    }
}
