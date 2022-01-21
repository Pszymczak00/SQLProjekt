using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SQLProjekt.VievModel
{
    class TableMenuViev : ViewModelBase
    {
        public TableMenuViev(string procName)
        {
            Table = DBConnection.Basic($"[dbo].[Proc{procName}]");
            TableName = procName;
        }

        private string tableName;
        public string TableName
        {
            get
            {
                return tableName;
            }
            set
            {
                tableName = value;
                OnPropertyChanged();
            }
        }

        private DataTable table;
        public DataTable Table
        {
            get
            {
                return table;
            }
            set
            {
                table = value;
                OnPropertyChanged();
            }
        }
    }
}
