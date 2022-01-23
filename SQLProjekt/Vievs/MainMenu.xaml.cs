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
    /// Interaction logic for MainMenu.xaml
    /// </summary>
    public partial class MainMenu : UserControl
    {
        public MainMenu()
        {
            InitializeComponent();
            this.DataContext = new MainMenuViev();
        }

        private void ShowTable(object sender, RoutedEventArgs e)
        {
            ((MainWindow)Application.Current.MainWindow).Test.Content = new TableMenu(((Button)sender).Content.ToString());
            ((MainWindow)Application.Current.MainWindow).Return.Visibility = Visibility.Visible;
        }
    }
}
