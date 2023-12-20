using System;
using System.Collections;
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
    /// Логика взаимодействия для AddWashing.xaml
    /// </summary>
    public partial class AddWashing : Window
    {
        public int IdStaff;
        public int IdBranch;
        public AddWashing()
        {
            InitializeComponent();
        }

        public void setParams(int IdStaff, int IdBranch)
        {
            this.IdStaff = IdStaff;
            this.IdBranch = IdBranch;

            var PowderList = Helper.context.Powder.ToList();
            var WasherList = Helper.context.WashingMachine
                .Where(u => u.IdBranch == this.IdBranch && u.IsWorking == false)
                .ToList();

            foreach (var item in PowderList)
            {
                PowderBox.Items.Add(item.Title);
            }

            foreach (var item in WasherList)
            {
                MachinesBox.Items.Add(item.IdWM);
            }

            PowderBox.SelectedIndex = 0;
            MachinesBox.SelectedIndex = 0;
        }

        public class WashingTemplate
        {
            public int IdOffer { get; set; }
            public DateTime Date { get; set; }
            public int IdShift { get; set; }
            public int IdService { get; set; }
            public int IdPowder { get; set; }
            public int IdWM { get; set; }
            public int IdStatus { get; set; }
            public int IdCalculation { get; set; }

        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            int MachineId = Convert.ToInt32(MachinesBox.SelectedItem.ToString());
            var db = new PostirushkiFrolovEntities();
            var m = db.WashingMachine.Where(u => u.IdWM == MachineId).FirstOrDefault();

            var lastoffer = db.Offer
                    .AsNoTracking()
                    .OrderByDescending(x => x.IdOffer)
                    .FirstOrDefault();
            int lastid = lastoffer.IdOffer;

            var powder = Helper.context.Powder
               .Where(u => u.Title == PowderBox.SelectedItem.ToString())
               .FirstOrDefault();


            var shift = Helper.context.Shift
                .Where(s => s.IdStaff == this.IdStaff)
                .OrderByDescending(s => s.IdShift)
                .FirstOrDefault();


            if (Convert.ToBoolean(isDryingCheckBox.IsChecked))
            {

                var rnd = new Random();

                db.Offer.Add(new Offer()
                {
                    IdOffer = lastid + 1,
                    Date = DateTime.Now,
                    IdShift = shift.IdShift,
                    IdPowder = powder.IdPowder,
                    IdWM = m.IdWM,
                    IdStatus = 1,
                    IdService = 2,
                    IdCalculation = rnd.Next(1, 3)
                });

                m.IsWorking = true;

                db.SaveChanges();
            }
            else
            {

                var rnd = new Random();

                db.Offer.Add(new Offer()
                {
                    IdOffer = lastid + 1,
                    Date = DateTime.Now,
                    IdShift = shift.IdShift,
                    IdPowder = powder.IdPowder,
                    IdWM = m.IdWM,
                    IdStatus = 1,
                    IdService = 1,
                    IdCalculation = rnd.Next(1, 3)
                });

                m.IsWorking = true;

                db.SaveChanges();

            }

            var WasherList = Helper.context.WashingMachine
                .Where(u => u.IdBranch == this.IdBranch && u.IsWorking == false)
                .ToList();


            MachinesBox.Items.Clear();
            foreach (var item in WasherList)
            {
                MachinesBox.Items.Add(item.IdWM);
            }


            MachinesBox.SelectedIndex = 0;

            MessageBox.Show("Стирка успешно добавлена!");

        }
    }
}
