using SQLProjekt.VievModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SQLProjekt.Models
{
    public class ForeignKey : ViewModelBase
    {
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
        private string name;

        public ForeignKey(int id, string name)
        {
            Id = id;
            Name = name;
        }

        public string Name
        {
            get
            {
                return name;
            }
            set
            {
                name = value;
                OnPropertyChanged();
            }
        }
    }
}
