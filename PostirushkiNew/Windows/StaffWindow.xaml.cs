using PostirushkiNew;
using PostirushkiNew.Windows;
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
using System.Windows.Shapes;

namespace PostirushkiNew
{
    /// <summary>
    /// Логика взаимодействия для StafferWindow.xaml
    /// </summary>
    public partial class StaffWindow : Window
    {
        public int IdBranch;
        public int IdStaff;


        public StaffWindow()
        {
            InitializeComponent();
        }

        public void setBranch(int id)
        {
            IdBranch = id;
        }

        public void setEmployeeId(int id)
        {
            IdStaff = id;
        }

        public class TableTemplate
        {
            public string Number { get; set; }
            public string IdWM { get; set; }
            public string PowderTitle { get; set; }
            public string IsDrying { get; set; }
            public string Staff { get; set; }
            public string Status { get; set; }
        }

        public void ActOffersList()
        {
            var db = new PostirushkiFrolovEntities();
            var data = db.Offer.ToList();

            List<TableTemplate> tableTemplates = new List<TableTemplate> { };

            foreach (var item in data)
            {
                if (item.IdStatus == 1)
                {

                    var employee = db.Staff
                        .AsNoTracking()
                        .FirstOrDefault(u => u.IdStaff == item.Shift.IdStaff);

                    if (item.Shift.IdBranch == IdBranch)
                    {
                        tableTemplates.Add(
                        new TableTemplate()
                        {
                            Number = $"{item.IdOffer}-{item.Date}",
                            IdWM = Convert.ToString(item.IdWM),
                            PowderTitle = item.Powder.Title,
                            IsDrying = item.IdService == 2 ? "Да" : "Нет",
                            Staff = $"{employee.Surname} {employee.Name[0]}. {employee.Patronymic[0]}.",
                            Status = item.WashingStatus.Title
                        }
                    );
                    }
                }
            }
            DGActiveOff.ItemsSource = tableTemplates;
        }

        public void ReadyOffersList()
        {
            var db = new PostirushkiFrolovEntities();
            var data = db.Offer.ToList();

            List<TableTemplate> tableTemplates = new List<TableTemplate> { };

            foreach (var item in data)
            {

                if (item.IdStatus != 1)
                {

                    var employee = db.Staff
                        .AsNoTracking()
                        .FirstOrDefault(u => u.IdStaff == item.Shift.IdStaff);

                    if (item.Shift.IdBranch == IdBranch)
                    {
                        tableTemplates.Add(
                        new TableTemplate()
                        {
                            Number = $"{item.IdOffer}-{item.Date}",
                            IdWM = Convert.ToString(item.IdWM),
                            PowderTitle = item.Powder.Title,
                            IsDrying = item.IdService == 2 ? "Да" : "Нет",
                            Staff = $"{employee.Surname} {employee.Name[0]}. {employee.Patronymic[0]}.",
                            Status = item.WashingStatus.Title
                        }
                    );
                    }
                }

            }
            DGReadyOff.ItemsSource = tableTemplates;
        }

        public void TabControl_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (Report.IsSelected)
            {
                this.ActOffersList();
            }
            else if (ReadyOff.IsSelected)
            {
                this.ReadyOffersList();
            }
            else if(ActiveOff.IsSelected)
            {
                var data = Helper.context.Offer.ToList();
                var shift = Helper.context.Shift
                    .Where(s => s.IdStaff == this.IdStaff)
                    .OrderByDescending(s => s.IdShift)
                    .FirstOrDefault();

                int ShiftWasherCount = 0;
                float CashSum = 0;
                float NonCashSum = 0;

                foreach (var item in data)
                {
                    if (item.Shift.IdBranch == this.IdBranch && item.IdShift == shift.IdShift)
                    {
                        ShiftWasherCount++;

                        if (item.IdCalculation == 1)
                        {
                            CashSum += (float)item.Service.Price;
                        }
                        else
                        {
                            NonCashSum += (float)item.Service.Price;
                        }
                    }
                }

                StatLabel1.Content = $"Количество стирок за смену: {ShiftWasherCount}";
                StatLabel2.Content = $"Сумма наличного расчета: {CashSum}";
                StatLabel3.Content = $"Сумма безналичного расчета: {NonCashSum}";
            }
        }

        private void AWButton_Click(object sender, RoutedEventArgs e)
        {
            AddWashing addWashing = new AddWashing();
            addWashing.Title = this.Title;
            addWashing.setParams(this.IdStaff, IdBranch);
            addWashing.Show();
        }

        private void DGActiveOffDC(object sender, MouseButtonEventArgs e)
        {
            var row = DGActiveOff.SelectedItem;

            if (row != null)
            {

                TableTemplate dataRow = (TableTemplate)DGActiveOff.SelectedItem;

                string IdOffer = dataRow.Number.Split('-')[0];

                ChangeStatusWindow window4 = new ChangeStatusWindow();
                window4.Title = this.Title;
                window4.setWashing(Convert.ToInt32(IdOffer));
                window4.Show();

            }
        }
    }
}
