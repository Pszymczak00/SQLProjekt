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
                    Buttons = new ObservableCollection<string>() { "Zadania", "Wpisy Pracy" };
                    break;
            }

            if (Buttons is null) return;

            Table = DBConnection.IdGetTable(id, tablica, Buttons[0]);

        }
    }
}
