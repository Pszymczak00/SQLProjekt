using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace SQLProjekt.VievModel
{
    class UpdateRecordView : ViewModelBase
    {

        public void InsertData()
        {
            string polecenie = "";

            var temp = SelectedColumn.Paramether;

            if (temp != "" && !(temp is null))
            {
                switch (SelectedColumn.DataType)
                {
                    case "Int32":
                        polecenie = $"{temp}";
                        break;

                    case "DateTime":
                        polecenie = $"\'{temp}\'";
                        break;

                    case "String":
                        polecenie = $"\'{temp}\'";
                        break;

                    case "Boolean":
                        if (temp == "True" || temp == "true")
                            polecenie = $"1";
                        if (temp == "False" || temp == "false")
                            polecenie = $"0";
                        break;
                }
            }
            else
            {
                polecenie += $"null";
            }

            string tempTable;

            if (SelectedTable == "Wpisy Pracy")
                tempTable = "Wpisy_pracy";
            else if (SelectedTable == "Rodzaje Zatrudnienia")
                tempTable = "Rodzaje_zatrudnienia";
            else if (SelectedTable == "Godziny Pracy")
                tempTable = "Godziny_pracy";
            else tempTable = SelectedTable;

            string tempId;
            if (SelectedTable == "Pracownicy") tempId = "Id_prac";
            else tempId = "Id";

            polecenie = $"UPDATE {tempTable} SET {SelectedColumn.ColumnName} = {polecenie} WHERE {tempId} = {SelectedColumn.Id};";
            DBConnection.Insert(polecenie);

            Table = DBConnection.Basic($"[dbo].[ProcDefault{SelectedTable}]");
        }


        public UpdateRecordView()
        {
            SelectedTable = "Pracownicy";
        }

        public ObservableCollection<string> Tables { get; set; } = new ObservableCollection<string>()
        {
            "Stanowiska",
            "Rodzaje Zatrudnienia",
            "Pracownicy",
            "Zespoły",
            "Projekty",
            "Sprzęty",
            "Klienci",
            "Godziny Pracy",
            "Zadania",
            "Miejsca",
            "Wpisy Pracy"
        };

        private string selectedTable;
        public string SelectedTable
        {
            get
            {
                return selectedTable;
            }
            set
            {
                selectedTable = value;
                OnPropertyChanged();
                GetTable(value);
            }
        }

        public void GetTable(string tableName)
        {
            Table = DBConnection.Basic($"[dbo].[ProcDefault{tableName}]");
            Columns = new ObservableCollection<UpdateRecordHelper>();
            foreach (DataColumn el in Table.Columns)
            {
                string columnName = el.ColumnName;
                string dataType = el.DataType.Name;

                if (columnName != "Id")
                    Columns.Add(new UpdateRecordHelper()
                    {
                        ColumnName = columnName,
                        DataType = dataType
                    });
            }
        }

        private UpdateRecordHelper selectedColumn;
        public UpdateRecordHelper SelectedColumn
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

        private ObservableCollection<UpdateRecordHelper> columns;
        public ObservableCollection<UpdateRecordHelper> Columns
        {
            get
            {
                return columns;
            }
            set
            {
                columns = value;
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


    public class UpdateRecordHelper : ViewModelBase
    {

        private string columnName;
        public string ColumnName
        {
            get
            {
                return columnName;
            }
            set
            {
                columnName = value;
                OnPropertyChanged();
            }
        }

        private string dataType;
        public string DataType
        {
            get
            {
                return dataType;
            }
            set
            {
                dataType = value;
                OnPropertyChanged();
            }
        }

        private string paramether;
        public string Paramether
        {
            get
            {
                return paramether;
            }
            set
            {
                paramether = value;
                OnPropertyChanged();

                if (value != "" && !(value is null))
                {
                    switch (DataType)
                    {
                        case "Int32":
                            if (!int.TryParse(value, out _))
                            {
                                MessageBox.Show("Wartość niepoprawna, zły typ danych");
                                paramether = "";
                            }
                            break;
                        case "DateTime":
                            if (!DateTime.TryParse(value, out _))
                            {
                                MessageBox.Show("Wartość niepoprawna, zły typ danych");
                                paramether = "";
                            }
                            break;
                        case "Boolean":
                            if (!Boolean.TryParse(value, out _))
                            {
                                MessageBox.Show("Wartość niepoprawna, zły typ danych");
                                paramether = "";
                            }
                            break;
                    }
                }
            }
        }

        private int id;
        public int Id
        {
            get
            {
                return id;
            }
            set
            {
                id = value;
                OnPropertyChanged();
            }
        }


    }


}
