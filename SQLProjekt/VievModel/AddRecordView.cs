using SQLProjekt.Models;
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
        public void InsertData()
        {
            string polecenie = "";

            foreach(AddRecordHelper column in Columns)
            {

                var temp = column.Paramether;

                if (temp != "" && !(temp is null))
                {
                    switch (column.DataType)
                    {
                        case "Int32":
                            polecenie += $" {temp},";
                            break;

                        case "DateTime":
                            polecenie += $" \'{temp}\',";
                            break;

                        case "String":
                            polecenie += $" \'{temp}\',";
                            break;

                        case "Boolean":
                            if(temp == "True" || temp =="true")
                                polecenie += $" 1,";
                            if (temp == "False" || temp == "false")
                                polecenie += $" 0,";
                            break;
                    }
                }
                else
                {
                    polecenie += $" null,";
                }
            }
            string tempTable;

            if (SelectedTable == "Wpisy Pracy")
                tempTable = "Wpisy_pracy";
            else if (SelectedTable == "Rodzaje Zatrudnienia")
                tempTable = "Rodzaje_zatrudnienia";
            else if (SelectedTable == "Godziny Pracy")
                tempTable = "Godziny_pracy";
            else tempTable = SelectedTable;

            polecenie = $"INSERT INTO {tempTable} VALUES ({polecenie}";
            polecenie = polecenie.Remove(polecenie.Length - 1);
            polecenie = polecenie + ");";
            DBConnection.Insert(polecenie);
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
            Table = DBConnection.Basic($"[dbo].[ProcDefault{tableName}]");

            Columns = new ObservableCollection<AddRecordHelper>();
            foreach (DataColumn el in Table.Columns)
            {
                string columnName = el.ColumnName;
                string dataType = el.DataType.Name;
                string paramether = null;
                string temp = tableName + "-" + columnName;
                string nullable;
                if (Nulls.Contains(temp))
                {
                    nullable = "Null";
                }
                else
                {
                    nullable = "";
                }

                ObservableCollection<ForeignKey> tempKey = null;

                if (tableName == "Pracownicy" && columnName == "Zespoły_Id") tempKey = new ObservableCollection<ForeignKey>(DBConnection.ForeignKeys("Zespoły"));
                if (tableName == "Pracownicy" && columnName == "Stanowiska_Id") tempKey = new ObservableCollection<ForeignKey>(DBConnection.ForeignKeys("Stanowiska"));
                if (tableName == "Pracownicy" && columnName == "Rodzaje_zatrudnienia_Id") tempKey = new ObservableCollection<ForeignKey>(DBConnection.ForeignKeys("Rodzaje Zatrudnienia"));
                if (tableName == "Godziny Pracy" && columnName == "Pracownicy_Id_prac") tempKey = new ObservableCollection<ForeignKey>(DBConnection.ForeignKeys("Pracownicy"));
                if (tableName == "Projekty" && columnName == "Klienci_Id") tempKey = new ObservableCollection<ForeignKey>(DBConnection.ForeignKeys("Klienci"));
                if (tableName == "Projekty" && columnName == "ZespoLy_id") tempKey = new ObservableCollection<ForeignKey>(DBConnection.ForeignKeys("Zespoły"));
                if (tableName == "Sprzęty" && columnName == "Pracownicy_Id_prac") tempKey = new ObservableCollection<ForeignKey>(DBConnection.ForeignKeys("Pracownicy"));
                if (tableName == "Wpisy Pracy" && columnName == "Miejsca_Id") tempKey = new ObservableCollection<ForeignKey>(DBConnection.ForeignKeys("Miejsca"));
                if (tableName == "Wpisy Pracy" && columnName == "Zadania_Id") tempKey = new ObservableCollection<ForeignKey>(DBConnection.ForeignKeys("Zadania"));
                if (tableName == "Zadania" && columnName == "Pracownicy_Id_prac") tempKey = new ObservableCollection<ForeignKey>(DBConnection.ForeignKeys("Pracownicy"));
                if (tableName == "Zadania" && columnName == "Projekty_Id") tempKey = new ObservableCollection<ForeignKey>(DBConnection.ForeignKeys("Projekty"));
                if (tableName == "Zespoły" && columnName == "Id_kierownika") tempKey = new ObservableCollection<ForeignKey>(DBConnection.ForeignKeys("Pracownicy"));
                if (tableName == "Wpisy Pracy" && columnName == "Miejsca_id") tempKey = new ObservableCollection<ForeignKey>(DBConnection.ForeignKeys("Miejsca"));
                if (tableName == "Wpisy Pracy" && columnName == "Zadania_id") tempKey = new ObservableCollection<ForeignKey>(DBConnection.ForeignKeys("Zadania"));

                if (columnName != "Id")
                Columns.Add(new AddRecordHelper()
                {
                    ColumnName = columnName,
                    DataType = dataType,
                    Paramether = paramether,
                    Nullable = nullable,
                    ForeignKeys = tempKey
                });

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

        public string nullable;
        public string Nullable
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

        public ObservableCollection<ForeignKey> ForeignKeys { get; set; } = new ObservableCollection<ForeignKey>();

        private ForeignKey selectedForeignKey;
        public ForeignKey SelectedForeignKey
        {
            get
            {
                return selectedForeignKey;
            }
            set
            {
                selectedForeignKey = value;
                Paramether = selectedForeignKey.Id.ToString();
                OnPropertyChanged();
            }
        }

        public System.Windows.Visibility Visibility
        {
            get
            {
                if (ForeignKeys.Count == 0) return Visibility.Hidden;
                else return Visibility.Visible;
            } 
        }
    }
}
