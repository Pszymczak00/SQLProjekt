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
    /// Interaction logic for UpdateRecord.xaml
    /// </summary>
    public partial class UpdateRecord : UserControl
    {
        public UpdateRecord()
        {
            InitializeComponent();
            this.DataContext = new UpdateRecordView();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            (DataContext as UpdateRecordView).InsertData();
        }

    }
}
