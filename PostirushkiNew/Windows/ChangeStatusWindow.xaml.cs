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
    /// Логика взаимодействия для ChangeStatusWindowxaml.xaml
    /// </summary>
    public partial class ChangeStatusWindow : Window
    {
        public int IdOffer;

        public ChangeStatusWindow()
        {
            InitializeComponent();
            var StatusList = Helper.context.WashingStatus.ToList();


            foreach (var item in StatusList)
            {
                cmbStatus.Items.Add(item.Title);
            }

            cmbStatus.SelectedIndex = 0;

        }

        public void setWashing(int id)
        {
            IdOffer = id;
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            var status = Helper.context.WashingStatus
               .Where(u => u.Title == cmbStatus.SelectedItem.ToString())
               .FirstOrDefault();

            var db = new PostirushkiFrolovEntities();

            var washing = db.Offer.Where(u => u.IdOffer == IdOffer).FirstOrDefault();

            var m = db.WashingMachine.Where(u => u.IdWM == washing.IdWM).FirstOrDefault();

            washing.IdStatus = status.IdStatus;


            if (status.IdStatus == 1 || status.IdStatus == 2)
            {
                m.IsWorking = false;
            }
            else
            {
                m.IsWorking = true;
            }


            db.SaveChanges();
            MessageBox.Show("Статус стирки изменен");
        }
    
    }
}
