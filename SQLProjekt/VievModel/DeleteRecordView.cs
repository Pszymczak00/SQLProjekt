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
    class DeleteRecordView : ViewModelBase
    {
        public void InsertData()
        {
            string polecenie = "";

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

            polecenie = $"DELETE FROM {tempTable} WHERE {tempId} = {Id};";
            DBConnection.Insert(polecenie);

            Table = DBConnection.Basic($"[dbo].[ProcDefault{SelectedTable}]");
        }


        public DeleteRecordView()
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

        private string id;
        public string Id
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

        public void GetTable(string tableName)
        {
            Table = DBConnection.Basic($"[dbo].[ProcDefault{tableName}]");
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

