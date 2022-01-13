using SQLProjekt.VievModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace SQLProjekt.Vievs
{
    /// <summary>
    /// Interaction logic for TestOkno.xaml
    /// </summary>
    public partial class TestOkno : UserControl
    {
        public TestOkno()
        {
            InitializeComponent();
            this.DataContext = new TestOknoViev();
        }

        private void ReloadTable(object sender, RoutedEventArgs e)
        {
            string temp = ((Button)sender).Content.ToString();

            switch (temp)
            {
                case "Pracownicy":
                    ((TestOknoViev)this.DataContext).Table = DBConnection.ConnectionFun();
                    break;
                case "Stanowiska":
                    ((TestOknoViev)this.DataContext).Table = DBConnection.ConnectionFun2();
                    break;
                case "Zespoły":
                    ((TestOknoViev)this.DataContext).Table = DBConnection.ConnectionFun3();
                    break;
                default:
                    ((TestOknoViev)this.DataContext).Table = DBConnection.ConnectionFun3();
                    break;
            }

            TablicaGrid.UpdateLayout();
        }
    }
}
