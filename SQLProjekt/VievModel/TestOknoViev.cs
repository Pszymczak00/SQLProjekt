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
        private bool buttonIsEnabled = true;
        public bool ButtonIsEnabled
        {
            get { return buttonIsEnabled; }
            set
            {
                if(buttonIsEnabled != value)
                {
                    buttonIsEnabled = value;
                    OnPropertyChanged();
                }
            }
        }

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

        public TestOknoViev()
        {
            Table = DBConnection.ConnectionFun();

            foreach (DataColumn item in Table.Columns)
            {
                Pracownik.Add(item.ColumnName + " : " + item.DefaultValue.ToString());
            }
        }
    }
}
