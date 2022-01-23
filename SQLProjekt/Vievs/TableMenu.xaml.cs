using SQLProjekt.VievModel;
using System;
using System.Collections.Generic;
using System.Data;
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
    /// Interaction logic for TableMenu.xaml
    /// </summary>
    public partial class TableMenu : UserControl
    {
        public TableMenu(string procName)
        {
            InitializeComponent();
            this.DataContext = new TableMenuViev(procName);
        }

        private void Row_DoubleClick(object sender, MouseButtonEventArgs e)
        {
            // Ensure row was clicked and not empty space
            var row = sender as DataGridRow;

            if (row == null) return;

            DataTable dataTable = (DataContext as TableMenuViev).Table;

            ((MainWindow)Application.Current.MainWindow).Test.Content = new TestOkno((int)(dataTable.Rows[row.GetIndex()]["Id"]), (DataContext as TableMenuViev).TableName);
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            (DataContext as TableMenuViev).TableView.RowFilter = $"[{(DataContext as TableMenuViev).SelectedColumn}] {this.TextFiltr.Text}";
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            (DataContext as TableMenuViev).TableView.RowFilter = "";
        }
    }
}
