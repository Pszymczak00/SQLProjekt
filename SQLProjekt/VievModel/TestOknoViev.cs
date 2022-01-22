using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SQLProjekt.VievModel
{
    public class TestOknoViev : ViewModelBase
    {

        public int Id { get; set; }

        public string Tablica { get; set; }

        private DataTable table;
        public DataTable Table {
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

        public ObservableCollection<string> Buttons { get; set; } = null;

        public ObservableCollection<string> Pracownik { get; set; } = new ObservableCollection<string>();


        private DataTable tableList;
        public DataTable TableList
        {
            get
            {
                return tableList;
            }
            set
            {
                tableList = value;
                OnPropertyChanged();
            }
        }

        public TestOknoViev(int id, string tablica)
        {
            Id = id;
            Tablica = tablica;
            TableList = DBConnection.IdGet(id, tablica);

            switch(tablica)
            {
                case "Pracownicy":
                    Buttons = new ObservableCollection<string>() { "Zadania", "Wpisy Pracy", "Sprzęty", "Projekty" };
                    break;
                case "Klienci":
                    Buttons = new ObservableCollection<string>() { "Projekty"};
                    break;
                case "Miejsca":
                    Buttons = new ObservableCollection<string>() { "Wpisy Pracy" };
                    break;
                case "Projekty":
                    Buttons = new ObservableCollection<string>() { "Zadania", "Pracownicy" };
                    break;
                case "Rodzaje Zatrudnienia":
                    Buttons = new ObservableCollection<string>() { "Pracownicy" };
                    break;
                case "Stanowiska":
                    Buttons = new ObservableCollection<string>() { "Pracownicy" };
                    break;
                case "Zadania":
                    Buttons = new ObservableCollection<string>() { "Wpisy Pracy" };
                    break;
                case "Zespoły":
                    Buttons = new ObservableCollection<string>() { "Pracownicy", "Projekty" };
                    break;
            }

            if (Buttons is null) return;

            Table = DBConnection.IdGetTable(id, tablica, Buttons[0]);

        }
    }
}
