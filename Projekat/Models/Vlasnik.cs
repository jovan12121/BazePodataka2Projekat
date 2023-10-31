using System;
using System.Collections.Generic;

namespace Projekat.Models;

public partial class Vlasnik
{
    public int VlasnikId { get; set; }

    public string Ime { get; set; } = null!;

    public string Prezime { get; set; } = null!;

    public string Jmbg { get; set; } = null!;

    public string Adresa { get; set; } = null!;

    public int MestoId { get; set; }

    public virtual ICollection<Automobil> Automobils { get; set; } = new List<Automobil>();

    public virtual Mesto Mesto { get; set; } = null!;
}
