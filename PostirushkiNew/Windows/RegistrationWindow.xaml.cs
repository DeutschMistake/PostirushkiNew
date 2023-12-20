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
using System.Windows.Shapes;

namespace PostirushkiNew.Windows
{
    /// <summary>
    /// Логика взаимодействия для RegistrationWindow.xaml
    /// </summary>
    public partial class RegistrationWindow : Window
    {
        public RegistrationWindow()
        {
            InitializeComponent();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            string lastName = LastNameField.Text;
            string firstName = NameField.Text;
            string patronymic = PatronymicField.Text;
            string login = LoginField.Text;
            string password = PasswordField.Password;

            if (lastName == "" || firstName == "" || patronymic == "" || login == "" || password == "")
            {
                MessageBox.Show("Заполните корректно все поля");
            }
            else
            {
                var db = new PostirushkiFrolovEntities();

                var employee = db.Staff.Where(u => u.Login == login).FirstOrDefault();

                var laststaff = db.Staff
                    .AsNoTracking()
                    .OrderByDescending(x => x.IdStaff)
                    .FirstOrDefault();
                int lastid = laststaff.IdStaff;

                if (employee == null)
                {
                    if (Convert.ToBoolean(isAdminCheckBox.IsChecked))
                    {
                        db.Staff.Add(
                          new Staff()
                          {
                              IdStaff = lastid+1,
                              Name = firstName,
                              Surname = lastName,
                              Patronymic = patronymic,
                              Login = login,
                              Password = password,
                              IdRole = 2
                          }
                        );
                    }
                    else
                    {
                        db.Staff.Add(
                          new Staff()
                          {
                              IdStaff = lastid+1,
                              Name = firstName,
                              Surname = lastName,
                              Patronymic = patronymic,
                              Login = login,
                              Password = password,
                              IdRole = 1
                          }
                        );
                    }

                    db.SaveChanges();
                    MessageBox.Show("Сотрудник успешно добавлен!");
                }
                else
                {
                    MessageBox.Show("Логин уже используется пользователем");
                }
            }


        }
    }
}
