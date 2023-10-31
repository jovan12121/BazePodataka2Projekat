using Microsoft.EntityFrameworkCore;
using Projekat.Models;
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

namespace Projekat
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        private BazePodataka2Context context = new BazePodataka2Context();
        private CollectionViewSource automehanicarViewSource;
        private CollectionViewSource automobilViewSource;
        private CollectionViewSource dobavljacDelovaViewSource;
        private CollectionViewSource dovezenViewSource;
        private CollectionViewSource mesecniIzvestajViewSource;
        private CollectionViewSource mestoViewSource;
        private CollectionViewSource obucenViewSource;
        private CollectionViewSource popravkaViewSource;
        private CollectionViewSource racunovodjaViewSource;
        private CollectionViewSource radnikViewSource;
        private CollectionViewSource serviViewSource;
        private CollectionViewSource vlasnikViewSource;
        private CollectionViewSource vrstaPopravkeViewSource;



        public MainWindow()
        {

            InitializeComponent();
            automehanicarViewSource = (CollectionViewSource)FindResource(nameof(automehanicarViewSource));
            string s = (nameof(automehanicarViewSource));
            automobilViewSource = (CollectionViewSource)FindResource(nameof(automobilViewSource));
            dobavljacDelovaViewSource = (CollectionViewSource)FindResource(nameof(dobavljacDelovaViewSource));
            dovezenViewSource = (CollectionViewSource)FindResource(nameof(dovezenViewSource));
            mesecniIzvestajViewSource = (CollectionViewSource)FindResource(nameof(mesecniIzvestajViewSource));
            mestoViewSource = (CollectionViewSource)FindResource(nameof(mestoViewSource));
            obucenViewSource = (CollectionViewSource)FindResource(nameof(obucenViewSource));
            popravkaViewSource = (CollectionViewSource)FindResource(nameof(popravkaViewSource));
            racunovodjaViewSource = (CollectionViewSource)FindResource(nameof(racunovodjaViewSource));
            radnikViewSource = (CollectionViewSource)FindResource(nameof(radnikViewSource));
            serviViewSource = (CollectionViewSource)FindResource(nameof(serviViewSource));
            vlasnikViewSource = (CollectionViewSource)FindResource(nameof(vlasnikViewSource));
            vrstaPopravkeViewSource = (CollectionViewSource)FindResource(nameof(vrstaPopravkeViewSource));
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            context.Automehanicars.Load();
            context.Automobils.Load();
            context.DobavljacDelovas.Load();
            context.Dovezens.Load();
            context.MesecniIzvestajs.Load();
            context.Mestos.Load();
            context.Obucens.Load();
            context.Popravkas.Load();
            context.Racunovodjas.Load();
            context.Radniks.Load();
            context.Servis.Load();
            context.Vlasniks.Load();
            context.VrstaPopravkes.Load();
            automehanicarViewSource.Source = context.Automehanicars.Local.ToObservableCollection();
            automobilViewSource.Source = context.Automobils.Local.ToObservableCollection();
            dobavljacDelovaViewSource.Source = context.DobavljacDelovas.Local.ToObservableCollection();
            dovezenViewSource.Source = context.Dovezens.Local.ToObservableCollection();
            mesecniIzvestajViewSource.Source = context.MesecniIzvestajs.Local.ToObservableCollection();
            mestoViewSource.Source = context.Mestos.Local.ToObservableCollection();
            obucenViewSource.Source = context.Obucens.Local.ToObservableCollection();
            popravkaViewSource.Source = context.Popravkas.Local.ToObservableCollection();
            racunovodjaViewSource.Source = context.Racunovodjas.Local.ToObservableCollection();
            radnikViewSource.Source = context.Radniks.Local.ToObservableCollection();
            serviViewSource.Source = context.Servis.Local.ToObservableCollection();
            vlasnikViewSource.Source = context.Vlasniks.Local.ToObservableCollection();
            vrstaPopravkeViewSource.Source = context.VrstaPopravkes.Local.ToObservableCollection();

        }

        private void Window_Closing(object sender, System.ComponentModel.CancelEventArgs e)
        {
            context.Dispose();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            int n = context.SaveChanges();

            AutomehanicarDataGrid.Items.Refresh();
            AutomobilDataGrid.Items.Refresh();
            DobavljacDelovaDataGrid.Items.Refresh();
            DovezenDataGrid.Items.Refresh();
            MesecniIzvestajDataGrid.Items.Refresh();
            MestoDataGrid.Items.Refresh();
            ObucenGrid.Items.Refresh();
            PopravkaGrid.Items.Refresh();
            RacunovodjaDataGrid.Items.Refresh();
            RadnikDataGrid.Items.Refresh();
            ServisDataGrid.Items.Refresh();
            VlasnikDataGrid.Items.Refresh();
            VrstaPopravkeDataGrid.Items.Refresh();

            MessageBox.Show("Broj izvršenih zapisa: " + n, "Snimanje");
        }
    }
}
