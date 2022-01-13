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
        public static DataTable ConnectionFun()
        {
            using (SqlConnection conn = new SqlConnection("Data Source=LAPTOP-48S3MQBQ;Initial Catalog=Firma;User ID=User;Password=Pass1234;Integrated Security=False;"))
            {
               conn.Open();

                // 1.  create a command object identifying the stored procedure
                SqlCommand cmd = new SqlCommand("[dbo].[procGetPracownicy]", conn);
                // 2. set the command object so it knows to execute a stored procedure
                cmd.CommandType = CommandType.StoredProcedure;

                // 3. add parameter to command, which will be passed to the stored procedure
                //cmd.Parameters.Add(new SqlParameter("@CustomerID", custId));

                // execute the command
                
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

                // 1.  create a command object identifying the stored procedure
                SqlCommand cmd = new SqlCommand("[dbo].[procGetStanowiska]", conn);
                // 2. set the command object so it knows to execute a stored procedure
                cmd.CommandType = CommandType.StoredProcedure;

                // 3. add parameter to command, which will be passed to the stored procedure
                //cmd.Parameters.Add(new SqlParameter("@CustomerID", custId));

                // execute the command

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

                // 1.  create a command object identifying the stored procedure
                SqlCommand cmd = new SqlCommand("[dbo].[procGetZespoły]", conn);
                // 2. set the command object so it knows to execute a stored procedure
                cmd.CommandType = CommandType.StoredProcedure;

                // 3. add parameter to command, which will be passed to the stored procedure
                //cmd.Parameters.Add(new SqlParameter("@CustomerID", custId));

                // execute the command

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
