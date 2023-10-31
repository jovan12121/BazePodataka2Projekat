using System;
using System.Collections.Generic;

namespace Projekat.Models;

public partial class Automobil
{
    public int AutomobilId { get; set; }

    public string Proizvodjac { get; set; } = null!;

    public string Model { get; set; } = null!;

    public int GodinaProizvodnje { get; set; }

    public string BrojSasije { get; set; } = null!;

    public int VlasnikId { get; set; }

    public virtual ICollection<Dovezen> Dovezens { get; set; } = new List<Dovezen>();

    public virtual Vlasnik Vlasnik { get; set; } = null!;
}
