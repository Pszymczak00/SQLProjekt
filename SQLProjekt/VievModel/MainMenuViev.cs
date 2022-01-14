using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SQLProjekt.VievModel
{
    class MainMenuViev : ViewModelBase
    {
        public ObservableCollection<string> Buttons { get; set; } = new ObservableCollection<string>() 
        {
            "Stanowiska", 
            "Rodzaje Zatrudnienia",
            "Pracownicy",
            "Zespoły",
            "Projekty",
            "Sprzęty",
            "Klienci"
        };
    }
}
