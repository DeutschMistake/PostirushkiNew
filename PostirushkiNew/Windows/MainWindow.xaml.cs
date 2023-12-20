using PostirushkiNew.Windows;
using PostirushkiNew;
using System;
using System.Collections.Generic;
using System.Diagnostics.Eventing.Reader;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
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

namespace PostirushkiNew
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        public void ButtonEnter_Click(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrEmpty(LoginBox.Text) || string.IsNullOrEmpty(PassBox.Password))
            {
                MessageBox.Show("Enter login and password!");
                return;
            }

            using (var db = new PostirushkiFrolovEntities())
            {
                var staff = db.Staff
                    .AsNoTracking()
                    .FirstOrDefault(s => s.Login == LoginBox.Text && s.Password == PassBox.Password);

                if (staff == null)
                {
                    MessageBox.Show("User with this data not found!");
                    return;
                }
                MessageBox.Show("User has found!");
                App.Current.Properties["StaffLogin"] = LoginBox.Text;

                var branch = db.Branch
                    .AsNoTracking()
                    .FirstOrDefault(u => u.IdStaff1 == staff.IdStaff || u.IdStaff2 == staff.IdStaff);

                switch (staff.IdRole)
                {
                    case 1:
                        StaffWindow Window1 = new StaffWindow();
                        Window1.setBranch(branch.IdBranch);
                        Window1.setEmployeeId(staff.IdStaff);

                        Window1.Title = $"{staff.Surname} {staff.Name[0]}. {staff.Patronymic[0]}. - \"Постирушки\" ";
                        
                        Window1.Show();
                        Window1.ActOffersList();
                        Window1.ReadyOffersList();
                        break;
                    case 2:
                        AdminWindow Window2 = new AdminWindow();
                        Window2.Show();
                        break;
                }
                Close();
            }
        }
    }
}
