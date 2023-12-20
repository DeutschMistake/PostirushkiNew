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
    /// Логика взаимодействия для AdminWindow.xaml
    /// </summary>
    public partial class AdminWindow : Window
    {
        public AdminWindow()
        {
            InitializeComponent();
            var db = new PostirushkiFrolovEntities();

            var data = db.Offer.ToList();

            int countWashing = 0;
            float cashSum = 0;
            float nonCashSum = 0;

            foreach (var item in data)
            {
                countWashing++;

                if (item.IdCalculation == 1)
                {
                    cashSum += (float)item.Service.Price;
                }
                else
                {
                    nonCashSum += (float)item.Service.Price;
                }
            }

            WasCountLabel.Content = $"Количество стирок во всех филиалах: {countWashing}";
            CashLabel.Content = $"Общая стоимость за наличный расчет: {cashSum}";
            NCashLabel.Content = $"Общая стоимость за безналичный расчет: {nonCashSum}";
        }

        private void AddStaffBtn_Click(object sender, RoutedEventArgs e)
        {
            RegistrationWindow window3 = new RegistrationWindow();
            window3.Show();
        }
    }
}
