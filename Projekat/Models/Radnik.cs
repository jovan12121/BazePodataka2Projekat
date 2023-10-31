using System;
using System.Collections.Generic;

namespace Projekat.Models;

public partial class Radnik
{
    public int RadnikId { get; set; }

    public string Ime { get; set; } = null!;

    public string Prezime { get; set; } = null!;

    public string Jmbg { get; set; } = null!;

    public string Adresa { get; set; } = null!;

    public decimal Plata { get; set; }

    public string TipRadnika { get; set; } = null!;

    public int ServisId { get; set; }

    public int MestoId { get; set; }

    public virtual Automehanicar? Automehanicar { get; set; }

    public virtual Mesto Mesto { get; set; } = null!;

    public virtual Racunovodja? Racunovodja { get; set; }

    public virtual Servi Servis { get; set; } = null!;
}
