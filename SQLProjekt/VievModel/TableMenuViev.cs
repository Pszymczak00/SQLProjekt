using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
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
            TableView = new DataView(Table);
            Columns = new ObservableCollection<string>();

            foreach (DataColumn el in Table.Columns)
            {
                Columns.Add(el.ColumnName);
            }
        }
        public ObservableCollection<string> Columns { get; set; }

        private string selectedColumn;
        public string SelectedColumn
        {
            get
            {
                return selectedColumn;
            }
            set
            {
                selectedColumn = value;
                OnPropertyChanged();
            }
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

        private DataView tableView;
        public DataView TableView
        {
            get
            {
                return tableView;
            }
            set
            {
                tableView = value;
                OnPropertyChanged();
            }
        }
    }
}
