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

        public ObservableCollection<string> Buttons { get; set; } = new ObservableCollection<string>() { "Pracownicy", "Stanowiska", "Zespoły" };

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
            Table = DBConnection.ConnectionFun();
            TableList = DBConnection.IdGet(id, tablica);

        }
    }
}
