using SQLProjekt.VievModel;
using SQLProjekt.Vievs;
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

namespace SQLProjekt
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            ((MainWindow)Application.Current.MainWindow).Return.Visibility = Visibility.Hidden;
            this.DataContext = new MainMenuViev();
            Test.Content = new MainMenu();
            Glowny.Content = new AddRecord();
            Mod.Content = new UpdateRecord();
            Del.Content = new DeleteRecord();
        }

        public void Button_Click(object sender, RoutedEventArgs e)
        {
            Test.Content = new MainMenu();
            ((MainWindow)Application.Current.MainWindow).Return.Visibility = Visibility.Hidden;
        }
    }
}
