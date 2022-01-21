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
    class AddRecordView : ViewModelBase
    {

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

        public List<string> Nulls { get; set; } = new List<string>()
        {
            "Klienci-Numer_telefonu",

            "Miejsca-Nr_pokoju",

            "Pracownicy-Email",
            "Pracownicy-Numer_telefonu",
            "Pracownicy-Czy_zwolniony",
            "Pracownicy-Data_zwolnienia",

            "Projekty-Opis",

            "Sprzęty-Opis",

            "Zadania-Opis",

            "Zespoły-Id_kierownika"
        };

        public void GetTable(string tableName)
        {
            Table = DBConnection.Basic($"[dbo].[Proc{tableName}]");

            Columns = new ObservableCollection<AddRecordHelper>();
            foreach (DataColumn el in Table.Columns)
            {
                string columnName = el.ColumnName;
                string dataType = el.DataType.Name;
                string paramether = null;
                string temp = tableName + "-" + columnName;
                bool nullable = Nulls.Contains(temp);


                if(columnName != "Id")
                Columns.Add(new AddRecordHelper()
                {
                    ColumnName = columnName,
                    DataType = dataType,
                    Paramether = paramether,
                    Nullable = nullable
                }
                );;

            }

        }

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

        private ObservableCollection<AddRecordHelper> columns;
        public ObservableCollection<AddRecordHelper> Columns
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

    public class AddRecordHelper : ViewModelBase
    {
        public string ColumnName { get; set; }
        public string DataType { get; set; }

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

                if(value != "" && !(value is null))
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

        public bool nullable;
        public bool Nullable
        {
            get
            {
                return nullable;
            }
            set
            {
                nullable = value;
                OnPropertyChanged();
            }
        }
}
}
